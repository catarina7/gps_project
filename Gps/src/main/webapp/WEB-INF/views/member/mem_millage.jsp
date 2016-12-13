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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/mem_millage.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#go_list").click(function(){
			location.href="${pageContext.request.contextPath}/product/pro_list";
		});
	});
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		<div>
			<c:import url="/user_menu_bar" />
		</div>
		<div id="first_mill">
			<div id="mill_deco">
				<div id="second_mill">
					<table>
						<tr>
							<td> <span>${member.m_id }</span> 님 마일리지 현황 </td>
						</tr>
						<tr>
							<td> 현재 적립 마일리지 </td>
						</tr>
						<tr>
							<td> <span>${member.millage } </span> p</td>
						</tr>
					</table>
					<div id="mill_info">
						<p><span>※ 마일리지 사용 시 유의사항</span></p>
						<p>+ 마일리지는 현금과 동일하게 사용가능합니다.</p>
						<p>+ 마일리지 1p는 1원에 해당합니다.</p>
						<p>+ 게임구매 가격의 5%를 마일리지로 적립합니다. </p>
						<p>+ 구매 중 마일리지 사용에 대한 금액 제한은 없습니다. </p>
					</div>
				</div>
				<div id="third_mill">
					<p>
						
					</p>
				</div>
				<div id="four_mill">
					<button id="go_list">게임 구매하러가기</button>
				</div>
			</div>
		</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>