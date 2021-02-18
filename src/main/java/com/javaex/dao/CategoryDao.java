package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CategoryVo;

@Repository
public class CategoryDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertSelectKey(CategoryVo cateVo) {
		System.out.println("[CategoryDao] insertSelectKey()");
		
		return sqlSession.insert("category.insertSelectKey", cateVo);
	}

}
