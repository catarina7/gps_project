<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<style type="text/css">
	.listTable{
		width: 600px;
	}
	
	#th{
		text-align: center;
	}
	
	#td{
		text-align: center;
	}
</style>
</head>
<body>
	<form action="noticeList" method="get">
	<table class="listTable" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${noticeList}" var="no">
			<tr>
				<td>${no.n_num}</td>
				<td><a href="noticeView?n_num=${no.n_num}">${no.n_title}</a></td>
				<td>${no.n_writer}</td>
				<td>${no.reg_date}</td>
				<td>${no.counts}</td>
			</tr>
		</c:forEach>
	</table>
	
		<c:if test="${PageMaker.curBlock>1}">
		<a href="/notice/noticeList?curPage=${PageMaker.startNum-1}">[이전]</a>
		</c:if>
		<c:forEach begin="${PageMaker.startNum}" end="${PageMaker.lastNum}" var="i">
		<a href="/notice/noticeList?curPage=${i}">${i}</a>
		</c:forEach>
		<c:if test="${PageMaker.curBlock<PageMaker.totalBlock}">
		<a href="/notice/noticeList?curPage=${PageMaker.lastNum+1}">[다음]</a>
		</c:if>
		<input type="button" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/notice/noticeWrite';">
	</form>
</body>
</html>