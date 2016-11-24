<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/index.css">
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<header>
		<div id="first_div">
			<div id="first_div_1">
				<div id="second_div">
					<!-- rogo image -->
				</div>
				<div id="third_div">
					<!-- menu list -->
					<ul>
						<li>menu</li>
						<li>menu</li>
						<li>menu</li>
						<li>menu</li>
						<li>menu</li>
					</ul>
				</div>
				<div id="four_div">
					<!-- login, join button -->
					<button id="login">로그인</button>
					<!-- <button id="logout">로그아웃</button> -->
					<button id="join">회원가입</button>
					<!-- <button id="information">My Page</button> -->
				</div>
			</div>
		</div>
	</header>
	
	
	<!-- section -->
	<section>
		<div id="advertisement">
			
		</div>
		<div id="index_story">
			<div id="decoration">
				<!-- decoration image -->
			</div>
			
		</div>
		<div id="menu_bar">
			<!-- move menu -->
			
		</div>
	</section>
	
	
	<!-- footer -->
	<footer>
		<div id="first_footer">
			<div id="first_footer_1">
				<div id="second_footer">
					<div id="footer_logo">
						<!-- logo_image -->						
					</div>
					<div id="footer_info">
						<p>
							© 2016 Valve Corporation. All rights reserved. All trademarks are property of their respective owners in the US and other countries.
						</p>
						<p>
							VAT included in all prices where applicable.
						</p>
						<ul>
							<li class="design">link</li>
							<li class="design">link</li>
							<li class="design">link</li>
							<li>link</li>
						</ul>
					</div>
				</div>
				<div id="third_footer">
					<ul>
						<li class="design">value</li>
						<li class="design">value</li>
						<li class="design">value</li>
						<li class="design" id="import">개인정보취급방침</li>
						<li class="design">value</li>
						<li class="design">value</li>
						<li>value</li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>