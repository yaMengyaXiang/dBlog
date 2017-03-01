package com.dreamlearner.blog.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 文件工具类
 * 
 * @author Long
 * 
 *         2017年3月1日 下午3:19:47
 */
public class FileUtil {

	/**
	 * 允许的类型，图片的类型
	 */
	public static final List<String> ALLOW_TYPES = Arrays.asList(
		"image/jpg","image/jpeg", "image/png", "image/gif"
	);
	
	/**
	 * 对文件重命名
	 * @param origin
	 * @return
	 */
	public static String rename(String origin) {
		
		StringBuilder name = new StringBuilder();
		
		name.append("IMG_");
		
		int lastIndexOf = origin.lastIndexOf(".");
		// 后缀名
		String extName = origin.substring(lastIndexOf);
		
		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = df.format(new Date());
		
		name.append(date).append(extName);
		
		return name.toString();
	}
	
}
