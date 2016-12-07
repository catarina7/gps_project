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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/templete.css">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/pw_mod.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
	#pw_check{
		display: none;
	}
</style>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		
		<!-- session 정리용 -->
		<!-- id -->
		<input type="hidden" value="${member.m_id}" id="pas_id">
		
		<!-- pw -->
		<input type="hidden" value="${member.m_pw}" id="pas_pw">	
		
	
		<!-- 내용 넣기 -->
		<div>
		<h2>비밀번호 수정</h2>
		
		현재 비밀번호
		<input type="password" name="m_pw" id="pw_input" class="input"><br>
		새로운 비밀번호 
		<input type="password" name="m_pw" id="new_pw_input" class="input"><br>
		<input type="text" id="pw_check" readonly="readonly" value="비밀번호는 띄어쓰기 없이 8~15자의 영문 대/소문자, 숫자 및 	특수문자 중 2가지 이상 조합으로 입력하셔야 합니다."><br>
		새로운 비밀번호 확인
		<input type="password" name="m_pw" id="pw_set" class="input"><br>
		<input type="text" id="pw_confirm" readonly="readonly" value="비밀번호가 일치 하지 않습니다."><br>
		<button id="pwmod_btn">수정하기</button>	  
		
		
		</div>	
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>