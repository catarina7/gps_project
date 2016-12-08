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
		<div>
		<h2>회원탈퇴 하기</h2>
			
			<div>
				<p>마지막으로 비밀번호를 입력하시면 탈퇴가 진행 됩니다.</p>
			</div>
			
			<!-- pw -->
			pw <input type="text" name="m_pw" id="pw_input" class="input"><br>
			
			<input type="text" id="pw_check" readonly="readonly"
					value="비밀번호는 띄어쓰기 없이 8~15자의 영문 대/소문자, 숫자 및 	특수문자 중 2가지 이상 조합으로 입력하셔야 합니다."><br>
			
			<button id="out_btn">탈퇴합니다.</button>
			
		</div>
		
		
		
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>