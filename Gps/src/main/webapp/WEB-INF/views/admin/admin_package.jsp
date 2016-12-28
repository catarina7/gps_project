<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/admin_contents.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#create_package").click(function(){
			$("#create_pack").show();
		});
	});
</script>
</head>
<body>
	<c:import url="/admin_main" />
	<section>
		<div class="admin_product_first">
			<h2>패키지 상품 관리</h2>
			<table>
				<colgroup>
					<col style="width:5%;">
					<col style="width:13%;">
					<col style="width:13%;">
					<col style="width:13%;">
					<col style="width:8%;">
					<col style="width:8%;">
					<col style="width:8%;">
					<col style="width:8%;">
					<col style="width:10%;">
					<col style="width:10%;">
				</colgroup>
				<tr id="title">
					<td>번호</td>
					<td>상품정보</td>
					<td>이름</td>
					<td>내용</td>
					<td>가격</td>
					<td>할인율</td>
					<td>최종가격</td>
					<td>마일리지</td>
					<td>연관카테고리</td>
					<td>수정</td>
				</tr>
				<c:forEach items="${packAllList }" var="allList">
					<tr>
						<td>${allList.pack_num }</td>
						<td>${allList.pro_num }</td>
						<td>${allList.pack_title }</td>
						<td>${allList.pack_contents }</td>
						<td>${allList.price }</td>
						<td>${allList.discount }</td>
						<td>${allList.total_price }</td>
						<td>${allList.millage }</td>
						<td>${allList.sub_category }</td>
						<td>
							<input type="button" value="할인">
							<input type="button" onclick="loaction.href='${pageContext.request.contextPath}/package_pro/packDelete'" value="삭제">
						</td>
					</tr>
				</c:forEach>
			</table>
			<div class="first_button">			
				<input type="button" id="create_package" value="패키지 생성">
			</div>
		</div>
			<!-- 패키지 정보 작성 -->
			<div id="create_pack">
				<c:import url="/package_pro/pack_write" />
			</div>
	</section>
</body>
</html>