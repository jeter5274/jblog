package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.BlogService;
import com.javaex.vo.CategoryVo;
import com.javaex.vo.CommentVo;
import com.javaex.vo.UserVo;

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
	@RequestMapping(value="/admin-removeCate", method= {RequestMethod.GET, RequestMethod.POST})
	public int removeCate(@RequestParam("cateNo") int cateNo) {
		System.out.println("[ApiBlogController] /admin-removeCate");
	
		return blogService.removeCate(cateNo);
	}
	
	//코멘트 추가
	@ResponseBody
	@RequestMapping(value="/addCmt", method= {RequestMethod.GET, RequestMethod.POST})
	public int addComment(@ModelAttribute CommentVo cmtVo) {
		System.out.println("[ApiBlogController] /addCmt");
		
		return blogService.addComment(cmtVo);
	}
	
	//코멘트 리스트
	@ResponseBody
	@RequestMapping(value="getCmtList", method= {RequestMethod.GET, RequestMethod.POST})
	public List<CommentVo> getCmtList(@RequestParam("postNo") int postNo, HttpSession session){
		System.out.println("[ApiBlogController] /getCmtList");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int authUserNo = 0;
		
		if( authUser != null) {
			authUserNo = authUser.getUserNo();
		}

		return blogService.getCmtList(postNo, authUserNo);
	}
	
	//코멘트 삭제
	@ResponseBody
	@RequestMapping(value="/removeCmt", method = {RequestMethod.GET, RequestMethod.POST})
	public int removeCmt(@RequestParam("cmtNo") int cmtNo) {
		System.out.println("[ApiBlogController] /removeCmt");
		
		return blogService.removeCmt(cmtNo);
	}
}
