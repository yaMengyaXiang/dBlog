package com.dreamlearner.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dreamlearner.blog.dao.BlogDao;
import com.dreamlearner.blog.entity.Blog;
import com.dreamlearner.blog.service.BlogService;
import com.dreamlearner.blog.util.Page;

@Service("blogService")
public class BlogServiceImpl implements BlogService {
	
	@Resource
	private BlogDao blogDao;

	@Transactional
	public void insertBlog(Blog blog) {
		this.blogDao.insertBlog(blog);
	}

	@Transactional
	public void updateBlog(Blog blog) {
		this.blogDao.updateBlog(blog);
	}

	@Transactional
	public void deleteBlog(Long blogId) {
		this.blogDao.deleteBlog(blogId);
	}

	public Blog queryBlogById(Long blogId) {
		return this.blogDao.queryBlogById(blogId);
	}

	public List<Blog> queryBlogsByTitle(String title) {
		return this.blogDao.queryBlogsByTitle(title);
	}

	public List<Blog> queryBlogsByKeyWordWithPage(Map<String, Object> map) {
		return this.blogDao.queryBlogsByKeyWordWithPage(map);
	}

	@Override
	public List<Blog> queryLatestBlogsByPage(Page<Blog> page) {
		return this.blogDao.queryLatestBlogsByPage(page);
	}

	@Override
	public List<Blog> queryAllBlogs(Integer bloggerId) {
		return this.blogDao.queryAllBlogs(bloggerId);
	}
	
	@Override
	public List<Blog> queryAllBlogsWithPage(Map<String, Integer> map) {
		return this.blogDao.queryAllBlogsWithPage(map);
	}
	
	@Override
	public Integer queryBlogCount() {
		return this.blogDao.queryBlogCount();
	}

	@Override
	public Blog queryBlogDetailInfo(Long blogId) {
		return this.blogDao.queryBlogDetailInfo(blogId);
	}

	@Override
	public List<Blog> queryBlogsTopClick(Integer clickRankNum) {
		return this.blogDao.queryBlogsTopClick(clickRankNum);
	}

	@Override
	public List<Blog> queryBlogsLatestComment(Integer latestCommentNum) {
		return this.blogDao.queryBlogsLatestComment(latestCommentNum);
	}

	@Override
	public Integer queryBlogCountByKeyWord(String keyWord) {
		return this.blogDao.queryBlogCountByKeyWord(keyWord);
	}

	@Override
	public Blog queryNextBlog(Map<String, Object> map) {
		return this.blogDao.queryNextBlog(map);
	}

	@Override
	public Blog queryPreviousBlog(Map<String, Object> map) {
		return this.blogDao.queryPreviousBlog(map);
	}
	
}
