package com.dreamlearner.blog.service;

import java.util.List;

import com.dreamlearner.blog.entity.Comment;

public interface CommentService {

	/**
	 * 发表评论
	 * @param comment
	 */
	public void insertComment(Comment comment);
	
	/**
	 * 更新评论信息
	 * @param comment
	 */
	public void updateComment(Comment comment);
	
	/**
	 * 删除一条评论
	 * @param commentId
	 */
	public void deleteComment(Long commentId);
	
	/**
	 * 查看评论
	 * @param commentId
	 * @return
	 */
	public Comment queryComment(Long commentId);
	
	/**
	 * 查看一篇博客的评论
	 * @param blogId
	 * @return
	 */
	public List<Comment> queryCommentsByBlogId(Long blogId);
	
}
