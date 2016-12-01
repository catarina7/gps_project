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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/member_info.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
	});
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		
		<div id="mem_info_menu">
			<div id=""></div>
			<div id=""></div>
			<div id=""></div>
		</div>
		<div id="mem_info_category">
			<!-- 회원 -->
			<div class=""></div>
			<div class=""></div>
			<div class=""></div>
			<!-- 마일리지 -->
			<div class=""></div>
			<div class=""></div>
			<!-- 구매내역 -->
			<div class=""></div>
			<div class=""></div>
		</div>
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>