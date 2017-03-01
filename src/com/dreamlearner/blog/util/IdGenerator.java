package com.dreamlearner.blog.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * id生成器
 * @author Long
 *
 * 2017年1月16日 上午9:39:03
 */
public class IdGenerator {

	/**
	 * 生成一个Long类型的数字，值为日期时间（不包括毫秒）的时间戳
	 * @return
	 */
	public static Long generate() {
		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = df.format(new Date());
		return Long.parseLong(date);
	}
	
}
