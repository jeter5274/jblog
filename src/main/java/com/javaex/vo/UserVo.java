package com.javaex.vo;

public class UserVo {
	
	//필드
	private int userNo; 		//회원식별번호
	private String id;			//아이디
	private String userName;	//회원이름
	private String password;	//비밀번호
	private String joinDate;	//가입일
	private String blogTitle;	//블로그 제목
	private String logoFile;	//로고 이미지 경로
	
	//생성자 - 생략(기본생성자)
	
	//메소드 getter/setter
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getBlogTitle() {
		return blogTitle;
	}
	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}
	public String getLogoFile() {
		return logoFile;
	}
	public void setLogoFile(String logoFile) {
		this.logoFile = logoFile;
	}
	
	//메소드 일반
	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", id=" + id + ", userName=" + userName + ", password=" + password
				+ ", joinDate=" + joinDate + ", blogTitle=" + blogTitle + ", logoFile=" + logoFile + "]";
	}
	
	
	
}
