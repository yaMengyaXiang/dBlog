package com.dreamlearner.blog.service;

import java.util.List;
import java.util.Map;

import com.dreamlearner.blog.entity.Blog;
import com.dreamlearner.blog.util.Page;

public interface BlogService {
	
	/**
	 * 写博客
	 * @param blog
	 */
	public void insertBlog(Blog blog);
	
	/**
	 * 更新博客
	 * @param blog
	 */
	public void updateBlog(Blog blog);
	
	/**
	 * 通过id删除博客
	 * @param blogId
	 */
	public void deleteBlog(Long blogId);
	
	/**
	 * 通过id查找博客
	 * @param blogId
	 */
	public Blog queryBlogById(Long blogId);
	
	/**
	 * 通过标题查找博客，标题模糊查询
	 * @param title
	 */
	public List<Blog> queryBlogsByTitle(String title);
	
	/**
	 * 通过关键字查找博客，内容模糊查询
	 * @param keyWord
	 */
	public List<Blog> queryBlogsByKeyWordWithPage(Map<String, Object> map);
	
	/**
	 * 分页查询最新博客
	 * @return
	 */
	public List<Blog> queryLatestBlogsByPage(Page<Blog> page);
	
	/**
	 * 查询某博主所有博客
	 * @param bloggerId
	 * @return
	 */
	public List<Blog> queryAllBlogs(Integer bloggerId);
	
	/**
	 * 查询某博主所有博客，分页
	 * @param map
	 * @return
	 */
	public List<Blog> queryAllBlogsWithPage(Map<String, Integer> map);
	
	/**
	 * 查询博客数量
	 * @return
	 */
	public Integer queryBlogCount();
	
	/**
	 * 查询某博主博客数量
	 * @return
	 */
	public Integer queryMyBlogCount(Integer bloggerId);
	
	/**
	 * 查看博客的详细信息
	 * @param blogId
	 * @return
	 */
	public Blog queryBlogDetailInfo(Long blogId);
	
	/**
	 * 返回阅读量最多的博客
	 * @param clickRankNum 阅读量最多的博客的前几篇 
	 * @return
	 */
	public List<Blog> queryBlogsTopClick(Integer clickRankNum);
	
	/**
	 * 最新回复的博客数量
	 * @param latestCommentNum
	 * @return
	 */
	public List<Blog> queryBlogsLatestComment(Integer latestCommentNum);

	/**
	 * 查询内容包含关键字的博客数量
	 * @param keyWord
	 * @return
	 */
	public Integer queryBlogCountByKeyWord(String keyWord);
	
	/**
	 * 查找下一篇博客
	 * @param map
	 * @return
	 */
	public Blog queryNextBlog(Map<String, Object> map);

	/**
	 * 查找上一篇博客
	 * @param map
	 * @return
	 */
	public Blog queryPreviousBlog(Map<String, Object> map);
	
}
