package com.dreamlearner.blog.entity;

import java.io.Serializable;

/**
 * 博主
 * 
 * @author Long
 * 
 *         2017年1月15日 下午12:06:28
 */
public class Blogger implements Serializable {

	private static final long serialVersionUID = -6340424130885717744L;

	private Integer bloggerId;
	private String username; // 用户名
	private String password; // 密码
	private String nickName; // 昵称
	private String signature; // 个性签名
	private String description; // 个人简介
	private String avatar; // 博主头像

	public Integer getBloggerId() {
		return bloggerId;
	}

	public void setBloggerId(Integer bloggerId) {
		this.bloggerId = bloggerId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@Override
	public String toString() {
		return "Blogger [bloggerId=" + bloggerId + ", username=" + username
				+ ", password=" + password + ", nickName=" + nickName
				+ ", signature=" + signature + ", description=" + description
				+ ", avatar=" + avatar + "]";
	}

}
