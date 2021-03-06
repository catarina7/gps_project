<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/common/img/icons.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- css 넣는 태그 -->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/board/board_view.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/product/pro_view.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/board/viewModal.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>${qnaView.q_title}</title>

<script type="text/javascript">
	$(function() {
		$("#listBtn").click(function() { //목록버튼
			location.href = "${pageContext.request.contextPath}/qna/qnaList";
		});

		$("#delBtn")
				.click(
						function() { //삭제버튼
							var check = confirm("삭제하시겠습니까?");
							if (check == true) {
								alert("삭제가 완료되었습니다!");
								location.href = "${pageContext.request.contextPath}/qna/qnaDelete?q_num=${qnaView.q_num}";
							}
						});

		$("#modBtn")
				.click(
						function() { //수정버튼
							var check = confirm("수정하시겠습니까?");
							if (check == true) {
								location.href = "${pageContext.request.contextPath}/qna/qna_mod?q_num=${qnaView.q_num}";
							}
						});

		$("#reBtn")
				.click(
						function() {
							var check = confirm("답글을 등록하시겠습니까?");
							if (check == true) {
								location.href = "${pageContext.request.contextPath}/qna/qnaReply?q_num=${qnaView.q_num}"
							}
						});

		/* $(".qimg").mouseleave(function() {
			$("#viewModal").hide();
		}); */

		$(".qimg").click(function() {
			$("#viewModal").show();
			$("#img1").attr("src", $(this).attr("src"));
			$("#viewCaption").html($(this).attr("alt"));
		});

		$(".close").click(function() {
			$("#viewModal").hide();
		});
	});
</script>
</head>
<body>
	<c:import url="/header" />
	<!-- section -->
	<section>
		<div id="user_menu">
			<c:import url="/user_menu_bar" />
		</div>
		<div id="board_w">
			<!-- qna글 -->
			<form action="qnaView" method="post">
				<table>
					<colgroup>
						<col style="width: 23%;">
						<col style="width: 75%;">
					</colgroup>

					<tr>
						<td class="title">작성자</td>
						<td><span class="pro_in">${qnaView.q_writer}</span></td>
					</tr>

					<tr>
						<td class="title">제목</td>
						<td><span class="pro_in">${qnaView.q_title}</span></td>
					</tr>

					<tr>
						<td class="title">작성날짜</td>
						<td><span class="pro_in">${qnaView.reg_date}</span></td>
					</tr>

					<tr>
						<td colspan="2" id="titi">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="n_textarea">${qnaView.q_contents}</div>
						</td>
					</tr>
				</table>
				<!-- 이미지 -->
				<div id="board_images">
					<c:if test="${qnaImg != null}">
						<h4>-첨부이미지</h4>
					</c:if>
					<div id="main_img" class="w3-content">
						<ul>
							<c:forEach items="${qnaImg}" var="img">
								<li><img src="../resources/upload/${img.qfile_name}"
									class="qimg"></li>
							</c:forEach>
						</ul>
					</div>
				</div>

				<div id="board_w_btn">

					<c:if test="${member.m_id != null }">
						<input type="button" value="답글" id="reBtn" class="btn">
					</c:if>

					<c:if test="${qnaView.q_writer eq member.m_name }">
						<input type="button" value="수정" id="modBtn" class="btn">
						<input type="button" value="삭제" id="delBtn" class="btn">
					</c:if>
					<input type="button" value="목록" id="listBtn" class="btn">
				</div>
			</form>

		</div>
		<!-- Modal -->
		<div id="viewModal" class="vModal">
			<span class="close">x</span> <img id="img1" class="viewModal-content">
			<div id="viewCaption"></div>
		</div>

	</section>
	<c:import url="/footer" />
</body>
</html>