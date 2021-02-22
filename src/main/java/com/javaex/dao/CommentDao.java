package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CommentVo;

@Repository
public class CommentDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//코멘트 등록
	public int insert(CommentVo cmtVo) {
		System.out.println("[CommentDao] insert()");
		
		return sqlSession.insert("comment.insert", cmtVo);
	}
	
	//포스트에 달린 코멘트 리스트
	public List<CommentVo> selectListByPN(int postNo){
		System.out.println("[CommentDao] selectList()");
		
		return sqlSession.selectList("comment.selectList", postNo);
	}
	
	//코멘트 삭제
	public int delete(int cmtNo) {
		System.out.println("[CommentDao] deletet()");
		
		return sqlSession.delete("comment.delete", cmtNo);
	}
}
