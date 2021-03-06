package com.dreamlearner.blog.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dreamlearner.blog.entity.Blogger;
import com.dreamlearner.blog.service.BloggerService;
import com.dreamlearner.blog.util.EncryptUtil;
import com.dreamlearner.blog.util.FileUtil;

@Controller("bloggerController")
@RequestMapping("/blogger")
public class BloggerController {

	@Resource
	private BloggerService bloggerService;
	
	@RequestMapping("/toLogin.action")
	public String toLogin() {
		
		return "WEB-INF/page/blogger/login.jsp";
	}
	
	@RequestMapping(value = "/login.action")
	public String login(String username, String password, HttpServletRequest request) {
		Map<String, String> query = new HashMap<String, String>(2);
		query.put("username", username);
		// md5加密，BASE64编码后的密码
		query.put("password", EncryptUtil.encrypt(password));
		List<Blogger> bloggers = bloggerService.userLogin(query);
		
		if (null != bloggers && bloggers.size() != 0) {
			Blogger blogger = bloggers.get(0);
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", blogger);
			return "WEB-INF/page/admin/index.jsp";
		}
		request.setAttribute("errorMsg", "用户名或密码出错!!!");
		return "WEB-INF/page/blogger/login.jsp";
	}
	
	@RequestMapping("/logout.action")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("currentUser");
		return "WEB-INF/page/blogger/login.jsp";
	}
	
	@RequestMapping("/toBloggerInfo.action")
	public String toBloggerInfo(HttpServletRequest request, Model model) {
		Object bloggerObj = request.getSession().getAttribute("currentUser");
		if (null == bloggerObj) {
			return "WEB-INF/page/blogger/login.jsp";
		}
		
		return "WEB-INF/page/blogger/bloggerInfo.jsp";
	}
	
	
	@RequestMapping("/updateBlogger.action")
	@ResponseBody
	public String updateBlogger(Blogger blogger, MultipartFile imageFile, HttpServletRequest request, Model model) {
		
		String avatar = null;
		
		if(!imageFile.isEmpty()){
			String contentType = imageFile.getContentType();
			// 判断文件类型
			if (FileUtil.ALLOW_TYPES.contains(contentType)) {
				// 上传到服务器
				String uploadPath = request.getServletContext().getRealPath("/") + "static/userImages/";
				
				String newName = FileUtil.rename(imageFile.getOriginalFilename());
				
				File uploadDirectory = new File(uploadPath);
				if (!uploadDirectory.exists()) {
					uploadDirectory.mkdirs();
				}
				try {
					imageFile.transferTo(new File(uploadPath, newName));
					
					avatar = request.getContextPath() + "/static/userImages/" + newName;
			        
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		
		blogger.setAvatar(avatar);
		
		bloggerService.updateBlogger(blogger);
		
		Blogger b = bloggerService.queryBlogger(blogger.getBloggerId());
		
		request.getSession().setAttribute("currentUser", b);
		return "true";
	}
	
}
