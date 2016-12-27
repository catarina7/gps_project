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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/admin_main.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#main_home").click(function(){
			location.href="${pageContext.request.contextPath}/index";
		});
		//상품정보관리
		$("#product_admin").click(function(){
			location.href="${pageContext.request.contextPath}/admin/product_admin";
		});
		//CD-key 관리
		$("#cd-key").click(function(){
			location.href="${pageContext.request.contextPath}/admin/cd_key_manage";
		});
		//배송정보관리
		$("#send_admin").click(function(){
			location.href="${pageContext.request.contextPath}/admin/send_list";
		});
	});
</script>
</head>
<body>
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		
		<div id="first_admin">		
			<div id="second_admin">
				 <ul>
				 	<li id="main_home">GPS 홈페이지로</li>
				 	<li>회원정보관리</li>
				 	<li id="product_admin">상품정보관리</li>
				 	<li id="send_admin">배송정보관리</li>
				 	<li id="cd-key">CD-key 관리</li>
				 	<li>매출정보관리</li>
				 </ul>
			</div>
			<div id="liline"></div>
			<div id="third_admin">
				<!-- 관리 내용 집어넣기 -->
				
			</div>
		</div>
		
		
	</section>
	
</body>
</html>