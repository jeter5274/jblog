package com.javaex.vo;

public class PostVo {
	
	//필드
	private int postNo, cateNo;						//식별번호, 카테고리 번호
	private String postTitle, postContent, regDate;	//글 제목, 내용, 작성일
	
	//생성자 - 생략 (기본생성자)
	
	//메소드 getter/setter
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getCateNo() {
		return cateNo;
	}
	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	//메소드 일반
	@Override
	public String toString() {
		return "PostVo [postNo=" + postNo + ", cateNo=" + cateNo + ", postTitle=" + postTitle + ", postContent="
				+ postContent + ", regDate=" + regDate + "]";
	}
	
	
	
}
