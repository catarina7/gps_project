<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/board_view.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>${noticeView.n_title}</title>
<style type="text/css">
	.WriteTable{
		width: 600px;
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
				alert("삭제가 완료되었습니다!");
				location.href="${pageContext.request.contextPath}/notice/noticeDelete?n_num=${noticeView.n_num}";
			}
		});
		
		$("#modBtn").click(function(){ //수정버튼
			var check = confirm("수정하시겠습니까?");
			if(check == true){
				location.href="${pageContext.request.contextPath}/notice/noticeMod?n_num=${noticeView.n_num}&n_writer=${noticeView.n_writer}&n_title=${noticeView.n_title}&n_contents=${noticeView.n_contents}";
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
			<c:import url="/user_menu_bar" />
			<div id="board_w">
					<h1>공지사항</h1>
						<form action="noticeView" method="post">
							<table>
							<colgroup>
								<col style="width:23%;">
								<col style="width:75%;">	
							</colgroup>
							
							<tr>
								<td class="title">작성자 : </td>
								<td><span class="pro_in">${member.m_name}</span></td>
							</tr>
							
							<tr>
								<td class="title">제목 : </td>
								<td><span class="pro_in">${noticeView.n_title}</span></td>
							</tr>
							
							<tr>
								<td colspan="2" id="titi">내용 </td>
							</tr>
							<tr>
								<td colspan="2">
									<div id="n_textarea">
										${noticeView.n_contents}
									</div>
								</td>
							</tr>
							</table>
							<div id="board_w_btn">
								<c:if test="${member.m_id eq 'admin'}">
									<input type="button" value="수정" id="modBtn" class="btn">
								</c:if>
								<input type="button" value="삭제" id="delBtn" class="btn"> 
								<input type="button" value="목록" id="listBtn" class="btn">
							</div>
						</form>
			</div>
			</section>	
			<c:import url="/footer" />
	
</body>
</html>