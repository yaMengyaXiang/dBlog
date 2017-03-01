package com.dreamlearner.blog.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dreamlearner.blog.entity.Blog;
import com.dreamlearner.blog.entity.Comment;
import com.dreamlearner.blog.service.BlogService;
import com.dreamlearner.blog.service.CommentService;
import com.dreamlearner.blog.util.IPUtil;
import com.dreamlearner.blog.util.IdGenerator;

@Controller("commentController")
@RequestMapping("/comment")
public class CommentController {

	@Resource
	private CommentService commentService;
	
	@Resource
	private BlogService blogService;
	
	@RequestMapping("/publishComment.action")
	public String publishComment(Comment comment, HttpServletRequest request) {
		
		Long blogId = Long.parseLong(request.getParameter("blogId"));
		Blog blog = blogService.queryBlogById(blogId);
		
		comment.setBlog(blog);
		comment.setCommentDate(new Date());
		comment.setCommentId(IdGenerator.generate());
		comment.setUserIp(IPUtil.getRemoteHost(request));

		// 发表评论
		commentService.insertComment(comment);
		
		// 更新博客的评论数量
		Blog b = new Blog();
		b.setBlogId(blogId);
		b.setReplyHit(blog.getReplyHit() + 1);
		// 设置点击次数，不然默认为0
		b.setClickHit(blog.getClickHit());

		blogService.updateBlog(b);
		
		return "redirect:/blog/detail.action?blogId=" + blogId;
	}
	
}
