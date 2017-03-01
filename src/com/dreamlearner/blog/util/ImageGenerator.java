package com.dreamlearner.blog.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * 验证码生成器
 * @author Long
 *
 * 2017年2月25日 上午10:46:16
 */
public class ImageGenerator {

	private static String codeContent;
	
	public static String getCodeContent() {
		return codeContent;
	}

	/**
	 * 生成验证码
	 * @return 验证码图片对象
	 * @throws Exception 
	 */
	public static BufferedImage generateImage() throws Exception {
		int width = 100;
		int height = 25;
		BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		
		Graphics2D graphics = bi.createGraphics();
		// 画背景
		graphics.setColor(Color.WHITE);
		graphics.fillRect(0, 0, width, height);
		// 画边框
		graphics.setColor(Color.BLACK);
		graphics.drawRect(1, 1, width-2, height-2);
		
		// 设置字体大小
		graphics.setFont(new Font("宋体", Font.BOLD, 20));
		
		// 准备字符
		String code = "123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		// 存放验证码内容
		StringBuilder content = new StringBuilder();
		// 随机数
		Random rand = new Random();
		for (int i = 0; i < 4; i++) {
			int index = rand.nextInt(code.length());
			char one_char = code.charAt(index);
			
			content.append(one_char);
			
			int r = rand.nextInt(255);
			int g = rand.nextInt(255);
			int b = rand.nextInt(255);
			
			graphics.setColor(new Color(r, g, b));
			graphics.drawString(one_char + "", i*25+5, 20);
			
		}
		// 回收资源
		graphics.dispose();
		
		codeContent = content.toString();
		
		return bi;
	}
	
}
