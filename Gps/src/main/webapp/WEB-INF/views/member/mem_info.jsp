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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/mem_info.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		<!-- session 정리용 -->
		<!-- pw -->
		<input type="hidden" value="${member.m_pw}" id="pas_pw">
		<!-- gender -->
		<input type="hidden" value="${member.m_gender}" id="pas_gender">
		<!-- tel -->
		<input type="hidden" value="${member.m_tel}" id="pas_tel">
		
		<h2>회원정보 확인</h2>
		<!-- id -->
				id: <input type="text" name="m_id" id="id_input" class="input" value="${member.m_id}"><br>
								
				<!-- pw -->
				pw: <input type="text" name="m_pw" id="pw_input" class="input" readonly="readonly">
				<button id="pwmod_btn">비밀번호 수정하러가기</button>
				<br>
						
				<!-- 이름 넣기 -->
				name: <input type="text" name="m_name" id="name_input" class="input" value="${member.m_name}"><br>
				
				<!-- 전화번호 -->
				tel: <select id="tel_option" name="m_tel">
					<option value="SKT" selected>SKT</option>
					<option value="LGT">LGT</option>
					<option value="KT">KT</option>
				</select> 
				<input type="text" name="m_tel" id="tel_input" placeholder=" '-'를 포함하여 입력해주세요." class="input"> <br>
				
				<!-- 생일 -->
				birth: <input type="date" name="m_birth" id="birth_input" class="input" value="${member.m_birth}"><br> 
				<!-- 성별 -->
				gender: 
				male <input type="radio" name="m_gender" id="gender" value="male"> 
				female <input type="radio" name="m_gender" id="gender" value="female"> <br>
				<!-- email -->
				e-mail: <input type="text" name="m_email" id="email_input" placeholder="이메일을 입력해주세요." class="input" value="${member.m_email}">
		
		<button id="mod_btn">일반정보 수정하기</button>
		
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>