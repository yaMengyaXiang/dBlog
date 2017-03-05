package com.dreamlearner.blog.controller;

import java.awt.image.BufferedImage;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dreamlearner.blog.service.BlogService;
import com.dreamlearner.blog.util.ImageGenerator;

@Controller("systemController")
public class SystemController {

	@Resource
	private BlogService blogService;
	
	@RequestMapping("/admin/login.html")
	public String toLogin() {
		
		return "redirect:/blogger/toLogin.action";
	}
	
	@RequestMapping(value = "/index.html")
	public String index(Integer pageNo) {
		// 检查pageNo
		pageNo = (pageNo == null || pageNo < 1) ? 1 : pageNo;
		
		return "forward:/blog/showAllBlogs.action?pageNo=" + pageNo;
	}
	
	@RequestMapping("/system/getImageCode.action")
	public void getImageCode(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			BufferedImage image = ImageGenerator.generateImage();
			ImageIO.write(image, "JPEG", response.getOutputStream());
			// 保存验证码到session中
			request.getSession().setAttribute("codeContent", ImageGenerator.getCodeContent());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "/system/checkImageCode.action", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String checkImageCode(String imageCode, HttpServletRequest request) {
		boolean canPublish = false;
		
		String codeContent = (String) request.getSession().getAttribute("codeContent");
		
		canPublish = codeContent.equalsIgnoreCase(imageCode);
		
		return canPublish + "";
	}

}
