package com.dreamlearner.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dreamlearner.blog.dao.BlogTypeDao;
import com.dreamlearner.blog.entity.BlogType;
import com.dreamlearner.blog.service.BlogTypeService;

@Service("blogTypeService")
public class BlogTypeServiceImpl implements BlogTypeService {

	@Resource
	private BlogTypeDao blogTypeDao;

	@Transactional
	public void insertBlogType(BlogType blogType) {
		this.blogTypeDao.insertBlogType(blogType);
	}

	@Transactional
	public void updateBlogType(BlogType blogType) {
		this.blogTypeDao.updateBlogType(blogType);
	}

	@Transactional
	public void deleteBlogType(Integer typeId) {
		this.blogTypeDao.deleteBlogType(typeId);
	}

	@Override
	public BlogType queryBlogType(Integer typeId) {
		return this.blogTypeDao.queryBlogType(typeId);
	}

	@Override
	public List<BlogType> queryAllBlogTypes() {
		return this.blogTypeDao.queryAllBlogTypes();
	}

	@Override
	public void deleteBlogTypes(Integer[] typeIds) {
		this.blogTypeDao.deleteBlogTypes(typeIds);
	}

	@Override
	public List<BlogType> queryAllBlogTypesWithPage(Map<String, Integer> map) {
		return this.blogTypeDao.queryAllBlogTypesWithPage(map);
	}

	@Override
	public Integer queryBlogTypeCount() {
		return this.blogTypeDao.queryBlogTypeCount();
	}
	

}
