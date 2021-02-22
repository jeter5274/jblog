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
import com.javaex.dao.CommentDao;
import com.javaex.dao.PostDao;
import com.javaex.dao.UserDao;
import com.javaex.vo.CategoryVo;
import com.javaex.vo.CommentVo;
import com.javaex.vo.PostVo;
import com.javaex.vo.UserVo;

@Service
public class BlogService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private CategoryDao cateDao;
	@Autowired
	private PostDao postDao;
	@Autowired
	private CommentDao cmtDao;

	// 블로그 카테고리 및 글 정보 불러옴
	public Map<String, Object> getblog(String id, PostVo postVo) {
		System.out.println("[BlogService] getblog()");

		Map<String, Object> blogMap = new HashMap<String, Object>();

		// 카테고리 리스트 가져오기
		List<CategoryVo> cateList = getCateList(id);
		blogMap.put("cateList", cateList);

		// 카테고리의 포스트 리스트 가져오기
		int cateNo = postVo.getCateNo();
		
		if(cateNo == 0) {							// 카테고리를 선택하지 않은 경우 제일 마지막 카테고리(가장 늦게 생성한)의 번호를 가져옴
			cateNo = cateList.get(0).getCateNo();
		}
		
		List<PostVo> postList = postDao.selectPostList(cateNo);
		blogMap.put("postList", postList);

		if(postList.size() != 0) {	//글이 없지 않다면
			// 포스트 가져오기
			int postNo = postVo.getPostNo();
			
			if(postNo == 0) {							// 글을 선택하지 않은 경우 제일 마지막 글(가장 늦게 생성한)의 번호를 가져옴
				postNo = postList.get(0).getPostNo();
			}
			
			blogMap.put("postVo", postDao.selectPost(postNo));
		}

		return blogMap;
	}

	// id로 유저 정보를 불러옴
	public UserVo getUser(String id) {
		System.out.println("[BlogService] getblog()");

		return userDao.selectById(id);
	}

	// 블로그 제목, 이미지 수정 : 파일이 없는 경우
	public int basicModify(UserVo userVo) {
		System.out.println("[BlogService] basicModify()");

		return userDao.updateBlog(userVo);
	}

	// 블로그 제목, 이미지 수정 : 파일이 있는 경우
	public int basicModify(UserVo userVo, MultipartFile file) {
		System.out.println("[BlogService] basicModify(exist file)");

		// 파일 정보 생성 및 서버에 업로드
		String saveDir = "C:\\javaStudy\\upload\\jblog"; // 파일 저장 위치
		String orgName = file.getOriginalFilename(); // 원본파일 이름
		String exName = orgName.substring(orgName.lastIndexOf(".")); // 확장자
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName; // 서버 저장 파일이름

		String filePath = saveDir + "\\" + saveName;

		try {
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bos = new BufferedOutputStream(out);

			bos.write(file.getBytes());
			bos.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 파일 경로 업데이트
		userVo.setLogoFile("/upload/" + saveName);

		return basicModify(userVo);
	}

	// 카테고리 리스트 가져오기
	public List<CategoryVo> getCateList(String id) {
		System.out.println("[BlogService] getCateList()");

		return cateDao.selectCateList(id);
	}

	// 카테고리 추가하기
	public CategoryVo addReturnCate(CategoryVo categoryVo) {
		System.out.println("[BlogService] addReturnCate()");

		cateDao.insertSelectKey(categoryVo);

		return cateDao.selectOne(categoryVo.getCateNo());
	}

	// 카테고리 삭제하기
	public int removeCate(int cateNo) {
		System.out.println("[BlogService] addReturnCate()");

		return cateDao.deleteCate(cateNo);
	}

	// 글 작성하기
	public int writePost(PostVo postVo) {
		System.out.println("[BlogService] writePost()");

		return postDao.insertPost(postVo);
	}
	
	//코멘트 추가
	public int addComment(CommentVo cmtVo) {
		System.out.println("[BlogService] addComment()");
		
		return cmtDao.insert(cmtVo);
	}
	
	//코멘트 리스트 가져오기
	public List<CommentVo> getCmtList(int postNo, int authUserNo){
		System.out.println("[BlogService] getCmtList()");
		
		List<CommentVo> cmtList = cmtDao.selectListByPN(postNo);
		
		//로그인한 사람이 코멘트 작성자인지 확인
		for(int i=0; i<cmtList.size(); i++) {
			if(cmtList.get(i).getUserNo() == authUserNo) {
				cmtList.get(i).setDoYouWriter(true);
			}else {
				cmtList.get(i).setDoYouWriter(false);
			}
		}
		
		return cmtList;
	}
	
	//코멘트 삭제하기
	public int removeCmt(int cmtNo) {
		System.out.println("[BlogService] removeCmt()");
		
		return cmtDao.delete(cmtNo);
	}
}
