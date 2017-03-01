package com.dreamlearner.blog.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 评论
 * 
 * @author Long
 * 
 *         2017年1月15日 下午12:16:54
 */
public class Comment implements Serializable {

	private static final long serialVersionUID = 3158298213073632777L;
	
	private Long commentId;
	private String content; // 评论内容
	private Date commentDate; // 发表评论的时间
	private Blog blog; // 哪篇博客的评论
	private String userIp;	// 发表评论的ip
	
	public String getUserIp() {
		return userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	public Long getCommentId() {
		return commentId;
	}

	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", content=" + content
				+ ", commentDate=" + commentDate + ", userIp=" + userIp + "]";
	}

}
