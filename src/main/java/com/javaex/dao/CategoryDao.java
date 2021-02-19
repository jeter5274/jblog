package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CategoryVo;

@Repository
public class CategoryDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertCate(CategoryVo cateVo) {
		System.out.println("[CategoryDao] insertCate()");
		
		return sqlSession.insert("category.insertCate", cateVo);
	}

	public List<CategoryVo> selectCateList(String id){
		System.out.println("[CategoryDao] selectCateList()");
		
		return sqlSession.selectList("category.selectCateList", id);
	}
}
