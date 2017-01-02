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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/mem_out.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/common/img/icons.ico">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/mem_out.js"></script>
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
		<input type="hidden" readonly="readonly" id="pas_id" value="${member.m_id}"><br>
	
		<!-- name -->
		<input type="hidden" readonly="readonly" id="pas_num" value="${member.m_num}"><br>
	
		<!-- pw -->
		<input type="hidden" readonly="readonly" id="pas_pw" value="${member.m_pw}"><br>
	
		<!-- 내용 넣기 -->
		<div id="mem_out_first">
			<h2>회원탈퇴 하기</h2>
				
				<div id="mem_out_second">
					<p>마지막으로 비밀번호를 입력하시면 탈퇴가 진행 됩니다.</p>
				</div>
				
				<div id="mem_out_third">
					<!-- pw -->
					<span>pw : </span> <input type="password" name="m_pw" id="pw_input" class="input"><br>
					
				</div>
				<div id="mem_out_four">
					<button id="out_btn">탈퇴합니다.</button>
				</div>
			
		</div>
		
		
		
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>