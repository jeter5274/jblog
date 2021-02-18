package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	// 로그인 폼
	@RequestMapping(value = "/loginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginForm() {
		System.out.println("[UserController] /loginForm");

		return "user/loginForm";
	}

	// 회원가입 폼
	@RequestMapping(value = "/joinForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinForm() {
		System.out.println("[UserController] /joinForm");

		return "user/joinForm";
	}

	// id중복체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = { RequestMethod.GET, RequestMethod.POST })
	public String idChk(@RequestParam("id") String id) {
		System.out.println("[UserController] /idChk");

		String result = userService.idChk(id);

		return result;
	}

	// 회원가입
	@RequestMapping(value = "/join", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(@ModelAttribute UserVo userVo) {
		System.out.println("[UserController] /join");

		userService.join(userVo);

		return "user/joinSuccess";
	}

	// 로그인
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@ModelAttribute UserVo userVo, HttpSession session) {

		System.out.println("[UserController] /login");

		UserVo authUser = userService.login(userVo);
		
		if(authUser == null) {
			return "redirect:/user/loginForm?result=fail";
		}else {
			session.setAttribute("authUser", authUser);
			return "redirect:/";
		}
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) {
		
		session.removeAttribute("authUser");
		session.invalidate();
		
		return "redirect:/";
	}
}
