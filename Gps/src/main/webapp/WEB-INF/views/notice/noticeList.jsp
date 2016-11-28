<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
</head>
<body>
	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>내용</td>
			<td>작성날짜</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${noticeList}" var="no">
			<tr>
				<td>${no.n_num}</td>
				<td><a href="noticeView?n_num=${no.n_num}">${no.n_title}</a></td>
				<td>${no.n_writer}</td>
				<td>${no.n_contents}</td>
				<td>${no.reg_date}</td>
				<td>${no.counts}</td>
			</tr>
		</c:forEach>
	</table>
		<c:if test="${PageMaker.curBlock>1}">
		<a href="noticeList?curPage=${PageMaker.startNum-1}">[이전]</a>
		</c:if>
		<c:forEach begin="${PageMaker.startNum}" end="${PageMaker.lastNum}" var="i">
		<a href="noticeList?curPage=${i}">${i}</a>
		</c:forEach>
		<c:if test="${PageMaker.curBlock<PageMaker.totalBlock}">
		<a href="noticeList?curPage=${PageMaker.lastNum+1}">[다음]</a>
		</c:if>
		<a href="noticeWrite">글쓰기</a>
	
</body>
</html>