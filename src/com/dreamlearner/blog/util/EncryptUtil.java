package com.dreamlearner.blog.util;

import java.security.MessageDigest;

import sun.misc.BASE64Encoder;


/**
 * 加密工具类
 * @author Long
 *
 * 2017年1月16日 下午6:45:36
 */
public class EncryptUtil {

	public static String encrypt(String str) {
		try {
			// MD5加密
			MessageDigest md;
			md = MessageDigest.getInstance("MD5");
			// BASE64编码
			BASE64Encoder encoder = new BASE64Encoder();
			// 加密结果用BASE64编码
			return encoder.encode(md.digest(str.getBytes("utf-8")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		System.out.println(encrypt("long"));
	}

}
