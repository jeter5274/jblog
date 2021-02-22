package com.javaex.util;

import java.util.HashMap;
import java.util.Map;

public class PagingUtil {
	
	public static Map<String, Object> setPaging(int crtPage, int postCnt, int pageBtnCnt, int totalPostCnt) {
	    // postCnt => 페이지 당 글 갯수, pageBtnCnt => 페이지 버튼 갯수
			
	    // **************************게시글 리스트 시작, 끝번호 연산
	    // crtPage 음수 오류 방지
	    crtPage = crtPage > 0 ? crtPage : 1;

	    // 시작글 번호
	    int startPostNo = postCnt * (crtPage - 1) + 1;

	    // 끝 글 번호
	    int endPostNo = startPostNo + postCnt - 1;

	    // **************************페이징
	    // 끝 페이지 번호
	    int endPageNo = (int) Math.ceil(crtPage / (double) pageBtnCnt) * pageBtnCnt;

	    // 시작 페이지 번호
	    int startPageNo = endPageNo - pageBtnCnt + 1;
			
	    // 이전, 다음버튼
	    boolean prev, next;

	    if (startPageNo != 1) {
	        prev = true;
	    } else {
	        prev = false;
	    }

	    if (endPageNo * postCnt < totalPostCnt) {
	        next = true;
	    } else {
	        next = false;
	        endPageNo = (int) Math.ceil(totalPostCnt / (double) postCnt);
	    }

	    // 맵으로 데이터 묶음
	    Map<String, Object> pageMap = new HashMap<String, Object>();
	    pageMap.put("startPostNo", startPostNo);
	    pageMap.put("endPostNo", endPostNo);
	    pageMap.put("startPageNo", startPageNo);
	    pageMap.put("endPageNo", endPageNo);
	    pageMap.put("prev", prev);
	    pageMap.put("next", next);

	    return pageMap;
	}

	
}
