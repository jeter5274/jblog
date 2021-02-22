<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">


</head>

<body>
	<div id="wrap">
		
		<!-- 개인블로그 해더 -->
		<c:import url="/WEB-INF/views/includes/blog-header.jsp"></c:import>

		<div id="content">
			<ul id="admin-menu" class="clearfix">
				<li class="tabbtn"><a href="${pageContext.request.contextPath}/${authUser.id}/admin/basic">기본설정</a></li>
				<li class="tabbtn selected"><a href="${pageContext.request.contextPath}/${authUser.id}/admin/category">카테고리</a></li>
				<li class="tabbtn"><a href="${pageContext.request.contextPath}/${authUser.id}/admin/writeForm">글작성</a></li>
			</ul>
			<!-- //admin-menu -->
			
			<div id="admin-content">
			
				<table id="admin-cate-list">
					<colgroup>
						<col style="width: 50px;">
						<col style="width: 200px;">
						<col style="width: 100px;">
						<col>
						<col style="width: 50px;">
					</colgroup>
		      		<thead>
			      		<tr>
			      			<th>번호</th>
			      			<th>카테고리명</th>
			      			<th>포스트 수</th>
			      			<th>설명</th>
			      			<th>삭제</th>      			
			      		</tr>
		      		</thead>
		      		<tbody id="cateList">
		      			<!-- 
		      				리스트 영역 
		      			-->
					</tbody>
				</table>
      	
		      	<table id="admin-cate-add" >
		      		<colgroup>
						<col style="width: 100px;">
						<col style="">
					</colgroup>
		      		<tr>
		      			<td class="t">카테고리명</td>
		      			<td><input type="text" name="name" value=""></td>
		      		</tr>
		      		<tr>
		      			<td class="t">설명</td>
		      			<td><input type="text" name="desc"></td>
		      		</tr>
		      	</table> 
			
				<div id="btnArea">
		      		<button id="btnAddCate" class="btn_l" type="submit" >카테고리추가</button>
		      	</div>
			
			</div>
			<!-- //admin-content -->
		</div>	
		<!-- //content -->
		
		
		<!-- 개인블로그 푸터 -->
		<c:import url="/WEB-INF/views/includes/blog-footer.jsp"></c:import>
		
	</div>
	<!-- //wrap -->
</body>

<script type="text/javascript">

	//카테고리 리스트
	$("document").ready(function(){
		console.log("ready");

		 $.ajax({
			url : "${pageContext.request.contextPath }/api/blog/admin-cateList",
			type : "post",
			//contentType : "application/json",
			data : {id : '${authUser.id}'},
			
			dataType : "json",
			success : function(cateList) {
				/*성공시 처리해야될 코드 작성*/
				console.log(cateList);
				for(var i=0; i<cateList.length; i++){
					rander(cateList[i], "down");
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		}); 
		
	});
	
	//카테고리 추가
	$("#btnAddCate").on("click", function(){
		
		console.log("카테고리 추가 버튼 클릭");

		var categoryVo= {
			cateName: $("input[name='name']").val(),
			description: $("input[name='desc']").val()
		}
		
		console.log(categoryVo);
		
		$.ajax({
			url : "${pageContext.request.contextPath }/api/blog/admin-addCate",
			type : "post",
			//contentType : "application/json",
			data : categoryVo,
			
			dataType : "json",
			success : function(categoryVo) {
				/*성공시 처리해야될 코드 작성*/
				console.log(categoryVo);
				rander(categoryVo, "up");
				
				$("input[name='name']").val("");
				$("input[name='desc']").val("");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		}); 
	});
	
	//카테고리 삭제
	$("#cateList").on("click", "img", function(){
		console.log("카테고리 클릭");
		var cateNo = $(this).data('cateno');
		var postCnt = $(this).data('postcnt');
		
		console.log(cateNo);
		console.log(postCnt);
		
		if(postCnt > 0){
			console.log("포스트가 존재하여 삭제 불가");
			
			alert("삭제 할 수 없습니다.");
			
		}else{
			console.log("삭제");
			
			$.ajax({
				url : "${pageContext.request.contextPath }/api/blog/admin-removeCate",
				type : "post",
				//contentType : "application/json",
				data : {cateNo : cateNo},
				
				dataType : "text",
				success : function(result) {
					/*성공시 처리해야될 코드 작성*/
					console.log(result);
					console.log($("#cate"+cateNo));
					
					$("#cate"+cateNo).remove();
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			}); 
		}
		
	});
	
	function rander(cateVo, updown) {
		var str = "";
		str += '<tr id="cate' +cateVo.cateNo+ '">';
		str += '	<td>' +cateVo.cateNo+ '</td>';
		str += '	<td>' +cateVo.cateName+ '</td>';
		str += '	<td>' +cateVo.postCnt+ '</td>';
		str += '	<td>' +cateVo.description+ '</td>';
		str += '	<td class="text-center">';
		str += '		<img class="btnCateDel" data-cateno="' +cateVo.cateNo+ '" data-postcnt="' +cateVo.postCnt+ '" src="${pageContext.request.contextPath}/assets/images/delete.jpg">';
		str += '	</td>';
		str += '</tr>';    	
		
		if(updown == "up"){
			$("#cateList").prepend(str);	
		}else if(updown == "down"){
			$("#cateList").append(str);	
		}else{
			console.log("updown 미지정")
		}
		
	}
</script>


</html>