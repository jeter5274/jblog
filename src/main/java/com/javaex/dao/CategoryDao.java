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
	
	//카테고리 추가하기
	public int insertCate(CategoryVo cateVo) {
		System.out.println("[CategoryDao] insertCate()");
		
		return sqlSession.insert("category.insertCate", cateVo);
	}

	//카테고리 리스트 불러오기
	public List<CategoryVo> selectCateList(String id){
		System.out.println("[CategoryDao] selectCateList()");
		
		return sqlSession.selectList("category.selectCateList", id);
	}
	
	//카테고리 추가하면서 CateNo값 할당
	public int insertSelectKey(CategoryVo categoryVo) {
		System.out.println("[CategoryDao] insertSelectKey()");
		System.out.println(categoryVo);
		return sqlSession.insert("category.insertSelectKey", categoryVo);
	}
	
	//카테고리 1개 가져오기
	public CategoryVo selectOne(int cateNo) {
		System.out.println("[CategoryDao] selectOne()");

		return sqlSession.selectOne("category.selectOne", cateNo);
	}
	
	//카테고리 삭제하기
	public int deleteCate(int cateNo) {
		System.out.println("[CategoryDao] deleteCate()");

		return sqlSession.delete("category.deleteCate", cateNo);
	}
}
