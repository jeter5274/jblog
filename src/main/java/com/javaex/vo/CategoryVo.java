package com.javaex.vo;

public class CategoryVo {
	
	//필드
	private int cateNo;									//식별번호
	private String id, cateName, description, regDate;	//회원번호, 카테고리 명, 카테고리 설명, 등록일
	private int postCnt;								//포스트 수
	
	//생성자 - 생략 (기본생성자)
	
	//메소드 setter/getter
	public int getCateNo() {
		return cateNo;
	}
	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getPostCnt() {
		return postCnt;
	}
	public void setPostCnt(int postCnt) {
		this.postCnt = postCnt;
	}
	
	//메소드 일반
	@Override
	public String toString() {
		return "CategoryVo [cateNo=" + cateNo + ", id=" + id + ", cateName=" + cateName + ", description=" + description
				+ ", regDate=" + regDate + ", postCnt=" + postCnt + "]";
	}
	
	
}
