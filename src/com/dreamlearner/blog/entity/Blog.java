package com.dreamlearner.blog.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 博客
 * 
 * @author Long
 * 
 *         2017年1月15日 上午11:36:11
 */
public class Blog implements Serializable {

	private static final long serialVersionUID = -7343255796536159104L;
	
	private Long blogId;
	private String title; // 标题
	private String content; // 内容
	private Date publishDate; // 发表博客的时间
	private String keyWord; // 关键字 空格隔开
	private Integer clickHit = 0; // 查看次数
	private Integer replyHit = 0; // 回复次数
	private String summary;	// 摘要

	private Blogger blogger; // 博主
	private BlogType blogType;	// 该博客是什么类型的博客
	private List<Comment> comments; // 该博客的评论

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Integer getClickHit() {
		return clickHit;
	}

	public void setClickHit(Integer clickHit) {
		this.clickHit = clickHit;
	}

	public Integer getReplyHit() {
		return replyHit;
	}

	public void setReplyHit(Integer replyHit) {
		this.replyHit = replyHit;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public BlogType getBlogType() {
		return blogType;
	}

	public void setBlogType(BlogType blogType) {
		this.blogType = blogType;
	}

	public Long getBlogId() {
		return blogId;
	}

	public void setBlogId(Long blogId) {
		this.blogId = blogId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public Blogger getBlogger() {
		return blogger;
	}

	public void setBlogger(Blogger blogger) {
		this.blogger = blogger;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "Blog [blogId=" + blogId + ", title=" + title + ", content="
				+ content + ", publishDate=" + publishDate + ", keyWord="
				+ keyWord + ", clickHit=" + clickHit + ", replyHit=" + replyHit
				+ ", summary=" + summary + "]";
	}

}
