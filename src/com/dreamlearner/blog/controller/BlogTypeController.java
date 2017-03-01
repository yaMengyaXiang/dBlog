package com.dreamlearner.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dreamlearner.blog.entity.BlogType;
import com.dreamlearner.blog.service.BlogTypeService;
import com.dreamlearner.blog.util.Constants;
import com.dreamlearner.blog.util.Page;
import com.dreamlearner.blog.util.PageNumberGenerator;

@Controller("blogTypeController")
@RequestMapping("/blogType")
public class BlogTypeController {

	@Resource
	private BlogTypeService blogTypeService;
	
	@RequestMapping("/showAllTypes.action")
	public String showAllTypes(Integer pageNo, Model model) {
		// 总记录数
		Integer totalResults = blogTypeService.queryBlogTypeCount();
		
		pageNo = (pageNo == null || pageNo < 1) ? 1 : pageNo;
		
		// 总页数
		int totalPageNum = 1;
		if (totalResults % Constants.PAGE_SIZE == 0) {
			totalPageNum = totalResults / Constants.PAGE_SIZE;
		} else {
			totalPageNum = totalResults / Constants.PAGE_SIZE + 1;
		}
		
		pageNo = totalPageNum < pageNo ? totalPageNum : pageNo;
		
		Page<BlogType> page = new Page<BlogType>(pageNo, totalResults);
		
		Map<String, Integer> map = new HashMap<String, Integer>(2);
		map.put("startIndex", page.getStartIndex());
		map.put("pageSize", page.getPageSize());
		
		// 分页查询
		List<BlogType> blogTypes = blogTypeService.queryAllBlogTypesWithPage(map);
		
		List<Integer> pageNums = PageNumberGenerator.generator(pageNo, page.getTotalPageNum());
		
		page.setResults(blogTypes);
		
		model.addAttribute("pageBlogTypes", page);
		model.addAttribute("pageNums", pageNums);
		
		return "WEB-INF/page/type/listType.jsp";
	}
	
	@RequestMapping("/editBlogType.action")
	public String editBlogType(BlogType blogType) {
		
		blogTypeService.updateBlogType(blogType);
		
		return "forward:/blogType/showAllTypes.action";
	}
	
	@RequestMapping("/saveBlogType.action")
	public String saveBlogType(BlogType blogType) {
		
		blogTypeService.insertBlogType(blogType);
		
		return "forward:/blogType/showAllTypes.action";
	} 

	@RequestMapping("/deleteTypes.action")
	// 此处要加@RequestParam(value = "typeIds[]")，不然接受不到参数，为null
	public String deleteTypes(@RequestParam("typeIds[]") Integer[] typeIds) {
		
		blogTypeService.deleteBlogTypes(typeIds);
		
		return "forward:/blogType/showAllTypes.action";
	} 
	
}
