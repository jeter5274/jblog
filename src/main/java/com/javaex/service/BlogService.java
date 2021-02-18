package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class BlogService {
	
	@Autowired
	private UserDao userDao;	
	
	//유저 정보를 가져옴
	public UserVo getUser(String id) {
		System.out.println("[BlogService] getUser()");

		return userDao.selectById(id);
		
	}
}
