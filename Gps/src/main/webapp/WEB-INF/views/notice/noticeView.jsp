<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/templete.css">
<title>${noticeView.n_title}</title>
<style type="text/css">
	.WriteTable{
		width: 400px;
	}
	
	#Btn{
		text-align: right;
	}
</style>

<script type="text/javascript">
	$(function (){
		$("#listBtn").click(function(){ //목록버튼
			location.href="${pageContext.request.contextPath}/notice/noticeList";
		});
		
		$("#delBtn").click(function(){ //삭제버튼
			var check = confirm("삭제하시겠습니까?");
			if(check == true){
				
			}
		});
		
		$("#modBtn").click(function(){ //수정버튼
			var check = confirm("수정하시겠습니까?");
			if(check == true){
				location.href="${pageContext.request.contextPath}/notice/noticeMod";
			}
		});
		
	});
</script>
</head>
<body>
		<c:import url="/header" />
	
		<!-- section -->
			<section>
			<!-- 내용 넣기 -->
				<center>
				<h1>공지사항</h1><hr>
				<form action="noticeView" method="get">
				<table class="WriteTable" border="1" cellpadding="0" cellspacing="0">
					<tr>
						<td>작성자</td>
						<td><input type="text"  name="n_writer" size="50" value="${noticeView.n_writer}"></td>
					</tr>
			
					<tr>
						<td>제목</td>
						<td><input type="text" name="n_title" size="50" value="${noticeView.n_title}"></td>
				
					</tr>
			
					<tr>
						<td colspan="2">
						<textarea rows="20" cols="60" name="n_contents" >${noticeView.n_contents}</textarea>
						</td>
					</tr>
				</table>
		
				<table class="WriteTable">
					<tr>
						<td colspan="2" id="Btn">
						<input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/notice/noticeMod';">
						<input type="button" value="삭제" >
						<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList';">
						</td>
					</tr>
			
				</table>
			</form>
			</center>
			
			</section>
	
		<c:import url="/footer" />
	
</body>
</html>