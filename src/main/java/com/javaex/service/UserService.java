package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CategoryDao;
import com.javaex.dao.UserDao;
import com.javaex.vo.CategoryVo;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private CategoryDao cateDao;
	
	//id 중복체크
	public String idChk(String id) {
		System.out.println("[UserService] idChk()");

		String result;
		
		UserVo userVo = userDao.selectById(id);
		
		if(userVo == null) {
			result = "can";
		}else {
			result = "cant";
		}
		
		return result;
	}
	
	//회원가입 & 블로그 & 카테고리 초기값 입력
	public int join(UserVo userVo) {
		System.out.println("[UserService] join()");
		
		//블로그 초기값 할당
		userVo.setBlogTitle(userVo.getUserName()+ "의 블로그입니다.");
		userVo.setLogoFile("/assets/images/spring-logo.jpg");
		
		//user정보 등록
		int count=userDao.insertUser(userVo);
		
		//blog정보 등록
		userDao.insertBlog(userVo);
		
		//category 초기값 할당 및 정보 등록
		CategoryVo cateVo = new CategoryVo();
		cateVo.setCateName("미분류");
		cateVo.setDescription("기본으로 만들어지는 카테고리입니다.");
		cateVo.setId(userVo.getId());
		
		cateDao.insertCate(cateVo);
		
		return count;
	}
	
	//로그인
	public UserVo login(UserVo userVo) {
		System.out.println("[UserService] login()");
		
		return userDao.selectByIdNPw(userVo);
		
	}
}
