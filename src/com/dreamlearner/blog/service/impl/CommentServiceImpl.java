package com.dreamlearner.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dreamlearner.blog.dao.CommentDao;
import com.dreamlearner.blog.entity.Comment;
import com.dreamlearner.blog.service.CommentService;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Resource
	private CommentDao commentDao;

	@Transactional
	public void insertComment(Comment comment) {
		this.commentDao.insertComment(comment);
	}

	@Transactional
	public void updateComment(Comment comment) {
		this.commentDao.updateComment(comment);
	}

	@Transactional
	public void deleteComment(Long commentId) {
		this.commentDao.deleteComment(commentId);
	}

	public Comment queryComment(Long commentId) {
		return this.commentDao.queryComment(commentId);
	}

	public List<Comment> queryCommentsByBlogId(Long blogId) {
		return this.commentDao.queryCommentsByBlogId(blogId);
	}
	
}
