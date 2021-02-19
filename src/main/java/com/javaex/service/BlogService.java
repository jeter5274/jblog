package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.CategoryDao;
import com.javaex.dao.PostDao;
import com.javaex.dao.UserDao;
import com.javaex.vo.CategoryVo;
import com.javaex.vo.UserVo;

@Service
public class BlogService {
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private CategoryDao cateDao;
	@Autowired
	private PostDao postDao;
	
	//블로그에 필용한 정보를 불러옴
	public Map<String, Object> getblog(String id) {
		System.out.println("[BlogService] getblog()");
		
		Map<String, Object> blogMap = new HashMap<String, Object>();
		
		//유저 정보 및 블로그 타이틀/이미지 가져오기
		blogMap.put("userVo", getUser(id));
		
		//카테고리 리스트 가져오기
		List<CategoryVo> cateList = cateDao.selectCateList(id);
		blogMap.put("cateList", cateList);

		//포스트 리스트 가져오기
		blogMap.put("postList", postDao.selectPostList(cateList.get(0).getCateNo()));
		
		return blogMap;
	}
	
	//id로 유저 정보를 불러옴
	public UserVo getUser(String id) {
		System.out.println("[BlogService] getblog()");
		
		return userDao.selectById(id);
	}
	
	//블로그 제목, 이미지 수정
	public int basicModify(UserVo userVo) {
		System.out.println("[BlogService] basicModify()");
		
		return userDao.updateBlog(userVo);
	}
	
	//파일이 있는 경우
	public int basicModify(UserVo userVo, MultipartFile file) {
		System.out.println("[BlogService] basicModify(exist file)");
		
		//파일 정보 생성 및 서버에 업로드
		String saveDir = "C:\\javaStudy\\upload\\jblog"; //파일 저장 위치
		String orgName = file.getOriginalFilename();	//원본파일 이름
		String exName = orgName.substring(orgName.lastIndexOf("."));	//확장자
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName; //서버 저장 파일이름
		
		String filePath = saveDir+ "\\" +saveName;
		
		try {
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bos = new BufferedOutputStream(out);
			
			bos.write(file.getBytes());
			bos.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//파일 경로 업데이트
		userVo.setLogoFile("/upload/" +saveName);		
		
		return basicModify(userVo);
	}
}
