<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
</head>

<body>
	<div id="wrap">

		<!-- 개인블로그 해더 -->
		<c:import url="/WEB-INF/views/includes/blog-header.jsp"></c:import>

		<div id="content" class="clearfix">
			<div id="profilecate_area">
				<div id="profile">

					<!-- 이미지(기본 or 업로드) -->
					<img id="proImg" src="${pageContext.request.contextPath }${userVo.logoFile}">

					<div id="nick">${userVo.userName}(${userVo.id})님</div>
				</div>
				<div id="cate">
					<div class="text-left">
						<strong>카테고리</strong>
					</div>
					<ul id="cateList" class="text-left">
						<c:forEach items="${blogMap.cateList }" var="cateVo">
							<li><a href="${pageContext.request.contextPath }/${userVo.id}?cateNo=${cateVo.cateNo }">${cateVo.cateName }</a></li>
						</c:forEach>

					</ul>
				</div>
			</div>
			<!-- profilecate_area -->

			<div id="post_area">

				<c:choose>
					<c:when test="${empty blogMap.postVo}">

						<!-- 글이 없는 경우 -->
						<div id="postBox" class="clearfix" data-postno="-1">
							<div id="postTitle" class="text-left">
								<strong>등록된 글이 없습니다.</strong>
							</div>
							<div id="postDate" class="text-left">
								<strong></strong>
							</div>
							<div id="postNick"></div>
						</div>
						<div id="post"></div>

					</c:when>

					<c:otherwise>
						<div id="postBox" class="clearfix" data-postno="${blogMap.postVo.postNo }">
							<div id="postTitle" class="text-left">
								<strong>${blogMap.postVo.postTitle }</strong>
							</div>
							<div id="postDate" class="text-left">
								<strong>${blogMap.postVo.regDate }</strong>
							</div>
							<div id="postNick">${userVo.userName}(${userVo.id})님</div>
						</div>
						<!-- //postBox -->

						<div id="post">${blogMap.postVo.postContent }</div>
						<!-- //post -->
					</c:otherwise>
				</c:choose>

				<div id="comment">
					<c:if test="!(${empty authUser })">
						<table id="cmtInput">
	
							<colgroup>
								<col style="width: 10%;">
								<col style="">
								<col style="width: 10%;">
							</colgroup>
	
							<tr>
								<td>${authUser.userName }</td>
								<td><input id="textCmt" type="text" name="textCmt" value=""></td>
								<td>
									<button id="BtnSave" data-userno="${authUser.userName }">저장</button>
	
								</td>
							</tr>
						</table>
					</c:if>

					<table id="cmtList">
						<colgroup>
							<col style="width: 10%;">
							<col style="">
							<col style="width: 15%;">
							<col style="width: 5%;">
						</colgroup>

						<!-- 코멘트 리스트 영역 -->
					</table>

				</div>


				<div id="list">
					<div id="listTitle" class="text-left">
						<strong>카테고리의 글</strong>
					</div>
					<table>
						<colgroup>
							<col style="">
							<col style="width: 20%;">
						</colgroup>

						<c:forEach items="${blogMap.postList }" var="postVo">
							<tr>
								<td class="text-left"><a
									href="${pageContext.request.contextPath }/${userVo.id}?cateNo=${postVo.cateNo }&postNo=${postVo.postNo }">${postVo.postTitle }</a></td>
								<td class="text-right">${postVo.regDate }</td>
							</tr>
						</c:forEach>

					</table>
				</div>
				<!-- //list -->
			</div>
			<!-- //post_area -->



		</div>
		<!-- //content -->
		<div class=></div>
		<c:import url="/WEB-INF/views/includes/blog-footer.jsp"></c:import>



	</div>
	<!-- //wrap -->
</body>

<script type="text/javascript">
	
	$("docment").ready(function(){
		console.log("ready");
		
		var postNo = $("#postBox").data("postno");
		
		$.ajax({
	
			url : "${pageContext.request.contextPath }/api/blog/getCmtList",
			type : "post",
			//contentType : "application/json",
			data : {postNo: postNo },
			/*여기까지 보낼때 */
	
			/*여기부터 받을 때*/
			dataType : "json",
			success : function(cmtList) {
				/*성공시 처리해야될 코드 작성*/
				console.log(cmtList);
				for(var i=0; i<cmtList.length; i++){
					rander(cmtList[i]);
				}

			},
			//성공도 실패도 아닌 에러
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});

	});
	
	$("#BtnSave").on("click", function() {
		console.log("코멘트 저장 버튼 클릭");

		var postNo = $("#postBox").data("postno");
		var userNo = $(this).data("userno");
		var cmtContent = $("#textCmt").val();

		if (cmtContent == "") {
			alert("내용을 입력해 주세요")
		} else {
			
			var cmtVo = {
				postNo: postNo,
				userNo: userNo,
				cmtContent: cmtContent
			};
			
			$.ajax({

				url : "${pageContext.request.contextPath }/api/blog/addCmt",
				type : "post",
				//contentType : "application/json",
				data : cmtVo,
				/*여기까지 보낼때 */

				/*여기부터 받을 때*/
				dataType : "text",
				success : function(result) {
					/*성공시 처리해야될 코드 작성*/
					console.log("result: " +result);
					$("#textCmt").val("");
				},
				//성공도 실패도 아닌 에러
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});

		}
	});
	
	$("#cmtList").on("click", ".f-red", function(){
		console.log("삭제버튼 클릭");
		
		var cmtNo = $(this).data("cmtno")
		
		$.ajax({

			url : "${pageContext.request.contextPath }/api/blog/removeCmt",
			type : "post",
			//contentType : "application/json",
			data : {cmtNo : cmtNo},
			/*여기까지 보낼때 */

			/*여기부터 받을 때*/
			dataType : "text",
			success : function(result) {
				/*성공시 처리해야될 코드 작성*/
				console.log("result: " +result);
				$("#cmt"+cmtNo).remove();
			},
			//성공도 실패도 아닌 에러
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	function rander(cmtVo){
		str = '';
		str += '<tr id="cmt' +cmtVo.cmtNo+ '">';
		str += '	<td>' +cmtVo.writer+ '</td>';
		str += '	<td class="text-left">' +cmtVo.cmtContent+ '</td>';
		str += '	<td>' +cmtVo.regDate+ '</td>';
		if(cmtVo.doYouWriter){
			str += '<td data-cmtno="' +cmtVo.cmtNo+ '" class="f-red f-bold ">X</td>';
		}else{
			str += '<td></td>';
		}		
		str += '</tr>';
	
		$("#cmtList").prepend(str);
	}
</script>

</html>