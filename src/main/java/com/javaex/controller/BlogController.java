package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.BlogService;

@Controller
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	
	@RequestMapping(value="/{id}", method= {RequestMethod.GET, RequestMethod.POST})
	public String blogMain(@PathVariable("id") String id, Model model) {
		System.out.println("[BlogController] " +id);
		
		model.addAttribute("userVo", blogService.getUser(id));
		
		return "blog/blog-main";
	}
}
