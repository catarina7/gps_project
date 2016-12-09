	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/templete.css">
<title>QnA</title>
<style type="text/css">
	.listTable {
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
	<c:import url="/header"/>
	
		<!-- section -->
		<section>
		<!-- 내용 넣기 -->
		<center>
			<form action="qnaList" method="get">
				<table class="listTable" border="1" cellpadding="0" cellspacing="0">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성날짜</td>
						<td>조회수</td>
					</tr>
					
					<c:choose>
					<c:when test="${fn:length(qnaList) > 0 }">
					<c:forEach items="${qnaList}" var="q">
						<tr>
							<td>${q.q_num}</td>
							<td>
								<c:forEach begin="1" end="${q.depth}">
										&nbsp;&nbsp;&nbsp;ㄴ Re:&nbsp;
								</c:forEach>
								<a href="qnaView?q_num=${q.q_num}">${q.q_title}</a>
							</td>
							<td>${q.q_writer}</td>
							<td>${q.reg_date}</td>
							<td>${q.counts}</td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" style="text-align: center;">게시된 등록글이 없습니다.</td>
						</tr>
					</c:otherwise>
					</c:choose>
				</table>
				
					<c:if test="${pageMaker.curBlock>1}">
					<a href="qnaList?curPage=${pageMaker.startNum-1}">[이전]</a>
					</c:if>
					<c:forEach begin="${pageMaker.startNum}" end="${pageMaker.lastNum}" var="i">
					<a href="qnaList?curPage=${i}">${i}</a>
					</c:forEach>
					<c:if test="${pageMaker.curBlock<pageMaker.totalBlock}">
					<a href="qnaList?curPage=${pageMaker.lastNum+1}">[다음]</a>
					</c:if>
			</form>
				<input type="button" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/qna/qnaWrite';">
		</center>
		</section>
		
		<c:import url="/footer" />
</body>
</html>