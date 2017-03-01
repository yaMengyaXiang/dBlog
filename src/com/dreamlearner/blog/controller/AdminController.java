package com.dreamlearner.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminController")
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/login.html")
	public String toLogin() {
		
		return "redirect:/blogger/toLogin.action";
	}
	
	
	
}
