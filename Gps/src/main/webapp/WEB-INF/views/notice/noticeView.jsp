<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/templete.css">
<title>공지사항 수정</title>
<script type="text/javascript">
	$(function (){
		$("#listBtn").click(function(){ //목록버튼
			
		});
		
		$("#delBtn").click(function(){ //삭제버튼
			
		});
		
		$("#modBtn").click(function(){ //수정버튼
	
		});
		
	});
</script>
</head>
<body>
		<c:import url="/header" />
	
		<!-- section -->
			<section>
			<!-- 내용 넣기 -->
		
				<h2>작성자 :${noticeView.n_writer}</h2>
				<h2>제목 :${noticeView.n_title}</h2>
				<h2>내용 :${noticeView.n_contents}</h2>
				<input type="submit" id="modBtn" value="수정">
				<input type="button" id="delBtn" value="삭제">
				<input type="button" id="listBtn" value="목록">
		
		
			</section>
	
		<c:import url="/footer" />
	
</body>
</html>