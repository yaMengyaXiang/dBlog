package com.dreamlearner.blog.dao;

import java.util.List;
import java.util.Map;

import com.dreamlearner.blog.entity.BlogType;

public interface BlogTypeDao {

	/**
	 * 增加新类型
	 * @param blogType
	 */
	public void insertBlogType(BlogType blogType);
	
	/**
	 * 修改类型信息
	 * @param blogType
	 */
	public void updateBlogType(BlogType blogType);
	
	/**
	 * 删除一个类型
	 * @param typeId
	 */
	public void deleteBlogType(Integer typeId);
	
	/**
	 * 删除多个类型
	 * @param typeIds
	 */
	public void deleteBlogTypes(Integer[] typeIds);
	
	/**
	 * 查询一个类型
	 * @param typeId
	 * @return
	 */
	public BlogType queryBlogType(Integer typeId);
	
	/**
	 * 找出所有的类型
	 * @return
	 */
	public List<BlogType> queryAllBlogTypes();
	
	/**
	 * 找出所有的类型， 带分页
	 * @return
	 */
	public List<BlogType> queryAllBlogTypesWithPage(Map<String, Integer> map);
	
	/**
	 * 查询类型的总数量
	 * @return
	 */
	public Integer queryBlogTypeCount();
	
}
