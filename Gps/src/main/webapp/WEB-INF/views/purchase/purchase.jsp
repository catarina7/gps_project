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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/purchase/purchase.css">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		<c:import url="/user_menu_bar" />
		<h3>구매 내역</h3>
		<div id="first_purchase">
			<!-- 구매한 게임  -->
			<div class="second_purchase">
				<!-- 구매한 날짜 -->
				<p class="purchase_day">
					2016/12/06
				</p>
				<!-- 날짜에 따른 구매 리스트 -->
				<div class="third_purchase">
					
				</div>
			</div>
			<div class="second_purchase">
				<!-- 구매한 날짜 -->
				<p class="purchase_day">
					2016/12/07
				</p>
				<!-- 날짜에 따른 구매 리스트 -->
				<div class="third_purchase">
					
				</div>
			</div>
		</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>