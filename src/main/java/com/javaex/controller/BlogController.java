package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.BlogService;
import com.javaex.vo.PostVo;
import com.javaex.vo.UserVo;

@Controller
public class BlogController {

	@Autowired
	private BlogService blogService;

	// 블로그 메인화면
	@RequestMapping(value = "/{id}", method = { RequestMethod.GET, RequestMethod.POST })
	public String blogMain(@PathVariable("id") String id,
						   @ModelAttribute PostVo postVo,
						   /* ModelAttribute를 사용하면 파라미터가 없을 경우 0으로 입력됨을 활용
			 			   @RequestParam(value="cateNo", required = false, defaultValue = "-1") int cateNo,
			 			   @RequestParam(value="postNo", required = false, defaultValue = "-1") int postNo,
						    */
						   Model model) {
		System.out.println("[BlogController] /" + id);

		model.addAttribute("userVo", blogService.getUser(id));
		model.addAttribute("blogMap", blogService.getblog(id, postVo));
		
		return "blog/blog-main";
	}

	// 기본설정 화면
	@RequestMapping(value = "/{id}/admin/basic")
	public String basicManagement(@PathVariable("id") String id, Model model) {
		System.out.println("[BlogController] /" + id + "/admin/basic");

		model.addAttribute("userVo", blogService.getUser(id));

		return "blog/admin/blog-admin-basic";

	}

	// 블로그 제목, 로고 변경
	@RequestMapping(value = "/basicModify")
	public String basicModify(@ModelAttribute UserVo userVo,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpSession session) {
		System.out.println("[BlogController] /basicModify");

		userVo.setId(((UserVo) session.getAttribute("authUser")).getId());

		if (file.isEmpty()) {
			blogService.basicModify(userVo);
		} else {
			blogService.basicModify(userVo, file);
		}

		return "redirect:/" + userVo.getId() + "/admin/basic";
	}

	// 카테고리 설정 화면
	@RequestMapping(value = "/{id}/admin/category")
	public String categoryManagement(@PathVariable("id") String id, Model model) {
		System.out.println("[BlogController] /" + id + "/admin/category");
		
		model.addAttribute("userVo", blogService.getUser(id));
		
		return "blog/admin/blog-admin-cate";

	}

	// 글 작성 화면
	@RequestMapping(value = "/{id}/admin/writeForm")
	public String writeForm(@PathVariable("id") String id, Model model) {
		System.out.println("[BlogController] /" + id + "/admin/writeForm");
		
		model.addAttribute("userVo", blogService.getUser(id));
		model.addAttribute("cateList", blogService.getCateList(id));
		
		return "blog/admin/blog-admin-write";
	}
	
	// 글 작성
	@RequestMapping(value = "/{id}/admin/write")
	public String writePost(@PathVariable("id") String id, @ModelAttribute PostVo postVo, Model model) {
		System.out.println("[BlogController] /" + id + "/admin/write");
		
		blogService.writePost(postVo);
		
		return "redirect:/" + id + "/admin/writeForm";
	}
}