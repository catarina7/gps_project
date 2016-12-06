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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/purchase/buy.css">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<c:import url="/user_menu_bar" />
		<!-- 내용 넣기 -->
		<div id="first_buy">
			<!-- 구매하고자 하는 게임 리스트 -->
			<div id="second_buy">
				
			</div>
			<!-- 구매하고 하는 상품들의 가격 합계(최종 구매 가격) -->
			<div id="third_buy">
				
			</div>
			<!-- 남기고자 하는 말 -->
			<div id="four_buy">
				
			</div>
			<!-- 결제 -->
			<div id="five_buy">
				
			</div>
		</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>