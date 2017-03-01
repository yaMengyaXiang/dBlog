package com.dreamlearner.blog.service;

import java.util.List;
import java.util.Map;

import com.dreamlearner.blog.entity.Blogger;

public interface BloggerService {

	/**
	 * 查询博主
	 * @param bloggerId
	 * @return
	 */
	public Blogger queryBlogger(Integer bloggerId);
	
	/**
	 * 通过查询条件查询博主
	 * @param query
	 * @return
	 */
	public List<Blogger> queryBloggerByMap(Map<String, Object> query);
	
	/**
	 * 通过用户名查找博主
	 * @param username
	 * @return
	 */
	public Blogger queryBloggerByUsername(String username);
	
	/**
	 * 更新博主信息
	 * @param blogger
	 */
	public void updateBlogger(Blogger blogger);
	
}
