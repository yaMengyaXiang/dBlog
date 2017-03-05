package com.dreamlearner.blog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dreamlearner.blog.entity.Blog;
import com.dreamlearner.blog.entity.BlogType;
import com.dreamlearner.blog.entity.Blogger;
import com.dreamlearner.blog.entity.Comment;
import com.dreamlearner.blog.service.BlogService;
import com.dreamlearner.blog.service.BlogTypeService;
import com.dreamlearner.blog.service.CommentService;
import com.dreamlearner.blog.util.Constants;
import com.dreamlearner.blog.util.IdGenerator;
import com.dreamlearner.blog.util.Page;
import com.dreamlearner.blog.util.PageNumberGenerator;

@Controller("blogController")
@RequestMapping("/blog")
public class BlogController {

	@Resource
	private BlogService blogService;
	
	@Resource
	private BlogTypeService blogTypeService;
	
	@Resource
	private CommentService commentService;
	
	@RequestMapping("/showAllBlogs.action")
	public String showAllBlogs(Integer pageNo, Model model) {
		// 总记录数
		Integer totalResults = blogService.queryBlogCount();

		pageNo = (pageNo == null || pageNo < 1) ? 1 : pageNo;
		
		// 总页数
		int totalPageNum = 1;
		totalPageNum = 
			totalResults % Constants.PAGE_SIZE == 0 ? 
			totalResults / Constants.PAGE_SIZE :
			totalResults / Constants.PAGE_SIZE + 1;
		
		pageNo = totalPageNum < pageNo ? totalPageNum : pageNo;
		
		Page<Blog> page = new Page<Blog>(pageNo, totalResults);
		// 分页查询
		List<Blog> blogs = blogService.queryLatestBlogsByPage(page);
		
		page.setResults(blogs);
		
		// 分页按钮的页数
		List<Integer> pageNums = PageNumberGenerator.generator(pageNo, page.getTotalPageNum());
		
		// 点击量最大的博客
		List<Blog> maxClickBlogs = blogService.queryBlogsTopClick(Constants.CLICK_RANK_NUM);
				
		// 最新评论的博客
		List<Blog> latestCommentBlogs = blogService.queryBlogsLatestComment(Constants.LATEST_COMMENT_NUM);
		
		model.addAttribute("latestCommentBlogs", latestCommentBlogs);
		model.addAttribute("maxClickBlogs", maxClickBlogs);
		model.addAttribute("pageBlogs", page);
		model.addAttribute("pageNums", pageNums);
		
		return "index.jsp";
	}
	
	@RequestMapping("/saveBlog.action")
	public void saveBlog(Blog blog, HttpServletRequest request, HttpServletResponse response) {
		Object obj = request.getSession().getAttribute("currentUser");
		try {
			if (null == obj) {
				response.getOutputStream().print(0);
				return ;
			}
			Blogger blogger = (Blogger) obj;
			blog.setPublishDate(new Date());
			blog.setBlogId(IdGenerator.generate());
			blog.setBlogger(blogger);
			
			blogService.insertBlog(blog);
			response.getOutputStream().print(1);
		} catch (Exception e) {
			try {
				response.getOutputStream().print(0);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping("/updateBlog.action")
	public void updateBlog(Blog blog, HttpServletResponse response) {
		
		Long blogId = blog.getBlogId();
		Blog b = blogService.queryBlogById(blogId);
		blog.setClickHit(b.getClickHit());
		blog.setReplyHit(b.getReplyHit());
		
		blogService.updateBlog(blog);
		
		try {
			response.getOutputStream().print(1);
		} catch (IOException e) {
			try {
				response.getOutputStream().print(0);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping("/detail.action")
	public String detail(Long blogId, ModelMap model) {
		// 查询博客的详细信息，包括blog，blogger，blogType
		Blog blog = blogService.queryBlogDetailInfo(blogId);
		// 点击次数加1
		blog.setClickHit(blog.getClickHit() + 1);
		
		Blog b = new Blog();
		b.setBlogId(blogId);
		b.setClickHit(blog.getClickHit());
		b.setReplyHit(blog.getReplyHit());
		
		// 修改
		blogService.updateBlog(b);
		
		// 关键字
		String keyWord = blog.getKeyWord();
		// 中间可能有多个空格
		String[] keyWords = keyWord.split(" +");
		
		Map<String, Object> map = new HashMap<String, Object>(2);
		map.put("bloggerId", blog.getBlogger().getBloggerId());
		map.put("blogId", blog.getBlogId());
		
		// 上一篇博客
		Blog previousBlog = blogService.queryPreviousBlog(map);
		// 下一篇博客
		Blog nextBlog = blogService.queryNextBlog(map);
		
		// 该博客的评论
		List<Comment> comments = commentService.queryCommentsByBlogId(blog.getBlogId());
		
		// 点击量最大的博客
		List<Blog> maxClickBlogs = blogService.queryBlogsTopClick(Constants.CLICK_RANK_NUM);
				
		// 最新评论的博客
		List<Blog> latestCommentBlogs = blogService.queryBlogsLatestComment(Constants.LATEST_COMMENT_NUM);
		
		model.addAttribute("previousBlog", previousBlog);
		model.addAttribute("nextBlog", nextBlog);
		model.addAttribute("latestCommentBlogs", latestCommentBlogs);
		model.addAttribute("maxClickBlogs", maxClickBlogs);
		model.addAttribute("blog", blog);
		model.addAttribute("comments", comments);
		model.addAttribute("keyWords", keyWords);
		
		return "WEB-INF/page/blog/detail.jsp";
	}
	
	@RequestMapping("/search.action")
	public String search(Integer pageNo, String keyWord, Model model) {
		if (keyWord == null) {
			keyWord = "";
		}
		
		// 总记录数
		Integer totalResults = blogService.queryBlogCountByKeyWord(keyWord);
		pageNo = (pageNo == null || pageNo < 1) ? 1 : pageNo;
		
		// 总页数
		int totalPageNum = 1;
		totalPageNum = 
			totalResults % Constants.PAGE_SIZE == 0 ? 
			totalResults / Constants.PAGE_SIZE :
			totalResults / Constants.PAGE_SIZE + 1;
		
		pageNo = totalPageNum < pageNo ? totalPageNum : pageNo;
		
		Page<Blog> page = new Page<Blog>(pageNo, totalResults);
		
		Map<String, Object> map = new HashMap<String, Object>(3);
		
		map.put("keyWord", keyWord);
		map.put("startIndex", page.getStartIndex());
		map.put("pageSize", page.getPageSize());
		
		// 查询内容中包含关键字的博客
		List<Blog> queryBlogs = blogService.queryBlogsByKeyWordWithPage(map);
		
		page.setResults(queryBlogs);
		
		// 分页按钮的页数
		List<Integer> pageNums = PageNumberGenerator.generator(pageNo, page.getTotalPageNum());
		
		// 点击量最大的博客
		List<Blog> maxClickBlogs = blogService.queryBlogsTopClick(Constants.CLICK_RANK_NUM);
				
		// 最新评论的博客
		List<Blog> latestCommentBlogs = blogService.queryBlogsLatestComment(Constants.LATEST_COMMENT_NUM);
		
		model.addAttribute("latestCommentBlogs", latestCommentBlogs);
		model.addAttribute("maxClickBlogs", maxClickBlogs);
		model.addAttribute("pageBlogs", page);
		model.addAttribute("pageNums", pageNums);
		model.addAttribute("keyWord", keyWord);
				
		
		return "WEB-INF/page/blog/result.jsp";
	}
	
	@RequestMapping("/toWriteBlog.action")
	public String toWriteBlog(HttpServletRequest request, Model model) {
		Object blogger = request.getSession().getAttribute("currentUser");
		if (null == blogger) {
			return "null";
		}
		
		List<BlogType> blogTypes = blogTypeService.queryAllBlogTypes();
		
		model.addAttribute("blogTypes", blogTypes);
		return "WEB-INF/page/blog/writeBlog.jsp";
		
	}
	
	@RequestMapping("/toMyBlog.action")
	public String toMyBlog(Integer pageNo, HttpServletRequest request, Model model) {
		//TODO 考虑写个切面判断用户是否登录
		Object blogger = request.getSession().getAttribute("currentUser");
		if (null == blogger) {
			return "null";
		}
		
		// 总记录数
		Integer totalResults = blogService.queryBlogCount();

		pageNo = (pageNo == null || pageNo < 1) ? 1 : pageNo;
		
		// 总页数
		int totalPageNum = 1;
		totalPageNum = 
			totalResults % Constants.PAGE_SIZE == 0 ? 
			totalResults / Constants.PAGE_SIZE :
			totalResults / Constants.PAGE_SIZE + 1;

		pageNo = totalPageNum < pageNo ? totalPageNum : pageNo;
		
		Page<Blog> page = new Page<Blog>(pageNo, totalResults);
		
		Map<String, Integer> query = new HashMap<String, Integer>(3);
		
		query.put("startIndex", page.getStartIndex());
		query.put("pageSize", page.getPageSize());
		
		// 分页查询
		List<Blog> blogs = blogService.queryAllBlogsWithPage(query);
		// 遍历，设置blogType
		if (blogs != null && !blogs.isEmpty()) {
			for (Blog blog : blogs) {
				BlogType blogType = blogTypeService.queryBlogType(blog.getBlogType().getTypeId());
				blog.setBlogType(blogType);
			}
		}

		page.setResults(blogs);
		
		// 分页按钮的页数
		List<Integer> pageNums = PageNumberGenerator.generator(pageNo, page.getTotalPageNum());
				
		model.addAttribute("pageNums", pageNums);
		model.addAttribute("pageBlogs", page);
		
		return "WEB-INF/page/blog/myBlog.jsp";
	}
	
	@RequestMapping("/toEditBlog.action")
	public String toEditBlog(Long blogId, Integer typeId, Model model) {
		
		Blog blog = blogService.queryBlogById(blogId);
		
		BlogType blogType = blogTypeService.queryBlogType(typeId);
		
		blog.setBlogType(blogType);
		
		List<BlogType> blogTypes = blogTypeService.queryAllBlogTypes();
		
		model.addAttribute("blog", blog);
		model.addAttribute("blogTypes", blogTypes);
		
		return "WEB-INF/page/blog/editBlog.jsp";
	}
	
	@RequestMapping("/getBlogById.action")
	public String getBlogById(Long blogId, HttpServletResponse response) throws Exception {
		Blog blog = blogService.queryBlogById(blogId);
		JSONObject jsonObj = JSONObject.fromObject(blog);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(jsonObj.toString());
		out.flush();
		out.close();
		return null;
	}
	
}
