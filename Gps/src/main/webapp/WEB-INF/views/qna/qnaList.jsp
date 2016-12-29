<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/board/board.css">
<title>QnA</title>
<style type="text/css">
.listTable {
	width: 600px;
}
</style>
</head>
<body>
	<c:import url="/header" />
	<!-- section -->
	<section>
		<div id="user_menu">
			<c:import url="/user_menu_bar" />
		</div>
		<!-- 내용 넣기 -->
		<div id="notice_first">
			<h4>QnA</h4>
			<form action="qnaList" method="get">
				<table class="listTable">
					<colgroup>
						<col style="width: 7%;">
						<col style="width: 40%;">
						<col style="width: 12%;">
						<col style="width: 12%;">
						<col style="width: 7%;">
					</colgroup>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성날짜</th>
						<th>조회수</th>
					</tr>

					<c:choose>
						<c:when test="${fn:length(qnaList) > 0 }">
							<c:forEach items="${qnaList}" var="q">
								<tr>
									<td>${q.q_num}</td>
									<td><c:forEach begin="1" end="${q.depth}">
										&nbsp;&nbsp;&nbsp;ㄴ Re:&nbsp;
								</c:forEach> <a href="qnaView?q_num=${q.q_num}">${q.q_title}</a></td>
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
				<div id="notice_page">
					<c:if test="${pageMaker.curBlock>1}">
						<a href="qnaList?curPage=${pageMaker.startNum-1}">[이전]</a>
					</c:if>
					<c:forEach begin="${pageMaker.startNum}" end="${pageMaker.lastNum}"
						var="i">
						<a href="qnaList?curPage=${i}">${i}</a>
					</c:forEach>
					<c:if test="${pageMaker.curBlock<pageMaker.totalBlock}">
						<a href="qnaList?curPage=${pageMaker.lastNum+1}">[다음]</a>
					</c:if>
				</div>
			</form>
			<div>
				<c:if test="${member.m_id != null }">
					<input type="button" value="글쓰기"
						onclick="location.href='${pageContext.request.contextPath}/qna/qnaWrite';">
				</c:if>
			</div>
		</div>
	</section>

	<c:import url="/footer" />
</body>
</html>