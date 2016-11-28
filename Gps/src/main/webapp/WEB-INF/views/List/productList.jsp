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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/product/productList.css">
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
		<!-- 내용 넣기 -->
		<!-- easy user menu bar -->
		<div id="sub_header">
			<div class="h_menu">
				<span>My Store</span>
				<span class="h_icon">▼</span>
			</div>
			<div class="h_menu">
				<span>Games</span>
				<span class="h_icon">▼</span>
			</div>
			<div class="h_menu">
				<span>SoftWare</span>
				<span class="h_icon">▼</span>
			</div>
			<div class="h_menu">
				<span>menu</span>
			</div>
			<div class="h_menu">
				<span>Notice</span>
			</div>
			<div id="search_input">
				<input id="search_area" type="text" placeholder="검색어를 입력하세요">
				<div id="search_btn">
					<button>
						<img src="${pageContext.request.contextPath}/resources/css/common/img/search_icon.png">
					</button>
				</div>
			</div>
		</div>
		<div id="sub_header_menu">
				<div class="H_list" id="user">
					<ul>
						<li><a href="#">마이페이지</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
					</ul>
				</div>
				<div class="H_list" id="product">
					<ul>
						<li><a href="#">관심게임</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
					</ul>
				</div>
				<div class="H_list" id="software">
					<ul>
						<li><a href="#">한글패치</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
					</ul>
				</div>
		</div>
		
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>