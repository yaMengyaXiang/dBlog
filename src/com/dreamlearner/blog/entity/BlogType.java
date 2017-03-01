package com.dreamlearner.blog.entity;

import java.io.Serializable;

/**
 * 博客类型，分类
 * 
 * @author Long
 * 
 *         2017年1月15日 下午12:25:04
 */
public class BlogType implements Serializable {

	private static final long serialVersionUID = -136919488754438292L;
	
	private Integer typeId;
	private String typeName; // 类型名称
	private String description; // 类型介绍

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "BlogType [typeId=" + typeId + ", typeName=" + typeName
				+ ", description=" + description + "]";
	}

}
