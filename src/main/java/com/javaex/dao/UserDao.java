package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//id중복체크 : id로 데이터 1개 찾기
	public UserVo selectById(String id) {
		System.out.println("[UserDao] selectById()");
	
		return sqlSession.selectOne("user.selectById", id);
		
	}
	
	//회원가입
	public int insertUser(UserVo userVo) {
		System.out.println("[UserDao] insertUser()");
		
		return sqlSession.insert("user.insertUser", userVo);
	}
	
	//회원가입시 블로그 초기값 입력
	public int insertBlog(UserVo userVo) {
		System.out.println("[UserDao] insertBlog()");
		
		return sqlSession.insert("user.insertBlog", userVo);
	}
	
	//로그인
	public UserVo selectByIdNPw(UserVo userVo) {
		System.out.println("[UserDao] selectByIdNPw()");
		
		return sqlSession.selectOne("user.selectByIdNPw", userVo);
	}
}
