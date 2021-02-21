package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.BlogService;
import com.javaex.vo.CategoryVo;

@Controller
@RequestMapping(value="/api/blog")
public class ApiBlogController {
	
	@Autowired
	private BlogService blogService;
	
	//카테고리 리스트 불러오기
	@ResponseBody
	@RequestMapping(value="/admin-cateList", method= {RequestMethod.GET, RequestMethod.POST})
	public List<CategoryVo> getCateList(@RequestParam("id") String id){
		System.out.println("[ApiBlogController] /admin-cateList");

		return blogService.getCateList(id);
	}
	
	//카테고리 추가하고 추가한 카테고리 정보 불러오기
	@ResponseBody
	@RequestMapping(value="/admin-addCate", method= {RequestMethod.GET, RequestMethod.POST})
	public CategoryVo addCate(@ModelAttribute CategoryVo categoryVo){
		System.out.println("[ApiBlogController] /admin-addCate");
		
		CategoryVo addCate = blogService.addReturnCate(categoryVo);
		System.out.println(addCate);
		
		return addCate;
	}
	
	//카테고리 삭제
	@ResponseBody
	@RequestMapping(value="/admin-removeCate")
	public int removeCate(@RequestParam("cateNo") int cateNo) {
		System.out.println("[ApiBlogController] /admin-removeCate");
	
		return blogService.removeCate(cateNo);
	}
}
