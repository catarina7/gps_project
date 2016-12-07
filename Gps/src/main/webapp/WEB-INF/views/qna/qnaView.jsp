<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/templete.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>${qnaView.q_title}</title>
<style type="text/css">
	.WriteTable{
		width: 600px;
	}
	
	#Btn{
		text-align: right;
	}
</style>
<script type="text/javascript">
	$(function (){
		$("#listBtn").click(function(){ //목록버튼
			location.href="${pageContext.request.contextPath}/qna/qnaList";
		});
		
		$("#delBtn").click(function(){ //삭제버튼
			var check = confirm("삭제하시겠습니까?");
			if(check == true){
				alert("삭제가 완료되었습니다!");
				location.href="${pageContext.request.contextPath}/qna/qnaDelete?q_num=${qnaView.q_num}";
			}
		});
		
		$("#modBtn").click(function(){ //수정버튼
			var check = confirm("수정하시겠습니까?");
			if(check == true){
				location.href="${pageContext.request.contextPath}/qna/qnaMod?q_num=${qnaView.q_num}&q_writer=${qnaView.q_writer}&q_title=${qnaView.q_title}&q_contents=${qnaView.q_contents}";
			}
		});
		
		$("#reBtn").click(function(){
			var check = confirm("답글을 등록하시겠습니까?");
			if(check == true){
				location.href="${pageContext.request.contextPath}/qna/qnaReply?q_num=${qnaView.q_num}"
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
			<h1>제 질문이요!</h1>
			<form action="qnaView" method="post">
			
				<table class="WriteTable" border="1" cellpadding="0" cellspacing="0">
					<tr>
						<td>작성자</td>
						<td>${qnaView.q_writer}</td>
					</tr>
			
					<tr>
						<td>제목</td>
						<td >${qnaView.q_title}</td>
				
					</tr>
			
					<tr>
						<td>
						<p>${qnaView.q_contents}</p>
						</td>
					</tr>
					
					
				</table>
						
				<table class="WriteTable">
					<tr>
						<td colspan="2" id="Btn">
						<input type="button" value="답글" id="reBtn">
						<input type="button" value="수정" id="modBtn">
						<input type="button" value="삭제" id="delBtn" >
						<input type="button" value="목록" id="listBtn">
						</td>
					</tr>
				</table>
			</form>
		</center>
	</section>

</body>
</html>