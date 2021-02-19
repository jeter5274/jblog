package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.PostVo;

@Repository
public class PostDao {

	@Autowired
	private SqlSession sqlSession;
	
	//글 등록
	public int insertPost(PostVo postVo) {
		System.out.println("[PostDao] insertPost()");
		
		return sqlSession.insert("post.insertPost",postVo);
	}
	
	//글 리스트
	public List<PostVo> selectPostList(int cateNo){
		System.out.println("[PostDao] selectPostList()");
		
		return sqlSession.selectList("post.selectPostList",cateNo);
	}
}
