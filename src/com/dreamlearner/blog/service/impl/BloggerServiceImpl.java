package com.dreamlearner.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dreamlearner.blog.dao.BloggerDao;
import com.dreamlearner.blog.entity.Blogger;
import com.dreamlearner.blog.service.BloggerService;

@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService {

	@Resource
	private BloggerDao bloggerDao;
	
	public Blogger queryBlogger(Integer bloggerId) {
		return this.bloggerDao.queryBlogger(bloggerId);
	}
	
	public List<Blogger> queryBloggerByMap(Map<String, Object> query) {
		return this.bloggerDao.queryBloggerByMap(query);
	}

	public Blogger queryBloggerByUsername(String username) {
		return this.bloggerDao.queryBloggerByUsername(username);
	}

	@Transactional
	public void updateBlogger(Blogger blogger) {
		this.bloggerDao.updateBlogger(blogger);
	}
	
}
