<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/templete.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/login.js"></script>
</head>
<body>

<c:import url="/header" />

	<!-- section -->
	<section>
		<!-- 내용 넣기 -->

			<h2>login</h2>
			
			<form action="#" method="post">
			id <input type="text" name="m_id" id="id_input" class="input"><br>
			pw <input type="password" name="m_pw" id="pw_input" class="input"><br>
			<input type="button" id="log_btn" value="login">
			</form>
			
			<input type="button" id="join_btn" value="회원가입"><br>
			<input type="button" id="findid_btn" value="아이디찾기"><br>
			<input type="button" id="findpw_btn" value="비밀번호찾기"><br>

	</section>

	<c:import url="/footer" />

</body>
</html>