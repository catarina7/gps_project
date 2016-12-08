<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/member_login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/login.js"></script>
</head>
<body>

<c:import url="/header" />

	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		<div id="first_login">
			<div id="first_id_div">
				<div class="div_down">
					<button class="x_div">X</button>
				</div>
				<div class="div_contents">
					<!-- id -->
					<c:import url="/member/searchid" /> 
				</div>
			</div>
			<div id="first_pw_div">
				<div class="div_down">
					<button class="x_div">X</button>
				</div>
				<div class="div_contents">
					<!-- pw -->
					<c:import url="/member/searchPw" /> 
				</div>
			</div>
			<h2 id="login_tt">LOGIN</h2>

			<div id="second_login">
				<form action="#" method="post">
					<div id="third_login">
						<span>&nbsp;&nbsp; 아이디 : </span><input type="text" name="m_id" id="id_input" class="input"><br>
						<span>비밀번호 : </span><input type="password" name="m_pw" id="pw_input" class="input"><br>
					</div>
					<div id="four_login">
						<input type="button" id="log_btn" value="로그인">
					</div>
				</form>
				<div id="five_login">
					<input type="checkbox" id="id_save"><label for="id_save">아이디 저장</label>
					<input type="button" id="join_btn" value="회원가입">
					<input type="button" id="findpw_btn" value="비밀번호찾기">
					<input type="button" id="findid_btn" value="아이디찾기">
				</div>
			</div>
		</div>
	</section> 

	<c:import url="/footer" />

</body>
</html>