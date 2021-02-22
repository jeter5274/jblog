package com.javaex.vo;

public class CommentVo {
	
	//필드
	private int cmtNo, postNo, userNo;
	private String cmtContent, regDate, writer;
	private boolean doYouWriter;
	
	//생성자 - 생략(기본생성자)
	
	//메소드 getter/setter
	public int getCmtNo() {
		return cmtNo;
	}
	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public boolean isDoYouWriter() {
		return doYouWriter;
	}
	public void setDoYouWriter(boolean doYouWriter) {
		this.doYouWriter = doYouWriter;
	}
	
	//메소드 일반
	@Override
	public String toString() {
		return "CommentVo [cmtNo=" + cmtNo + ", postNo=" + postNo + ", userNo=" + userNo + ", cmtContent=" + cmtContent
				+ ", regDate=" + regDate + ", writer=" + writer + ", doYouWriter=" + doYouWriter + "]";
	}
	
	


	





}
