<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/member_join.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/join.js"></script>

</head>
<body>

	<c:import url="/header" />

	<!-- section -->
	<section>
		<!-- 내용 넣기 -->

		<h2>Game Preference Site</h2>
		<div id="first_join">
			<div id="agreement">
				<!-- 미성년자 확인 -->
				<textarea rows="" cols="" id="contract" readonly="readonly">
					<c:import url="/member/contract"></c:import>
				</textarea><br>
				<input type="checkbox" id="checkcon">
				<label for="checkcon">
					 위 약정을 동의하고 13세이상임을 확인합니다.
				</label> 
				<!-- 개정보호 -->
				<textarea rows="" cols="" id="license" readonly="readonly">
					<c:import url="/member/license"></c:import>			
				</textarea>	<br> 
				<input type="checkbox" id="checkli">
				<label for="checkli">
					 아이디 보호에 대한 약정을 확인합니다.
				</label>
			</div>
				
			<button id="checkbox">동의합니다.</button>

			<div id="joinform">
				<form action="#" id="frm">
					<!-- id -->
					id: <input type="text" name="m_id" id="id_input" class="input">
					<input type="button" id="id_check" value="id_check"><br>
					
					<!-- pw -->
					pw: <input type="password" name="m_pw" id="pw_input" class="input">
					<input type="text" id="pw_check" readonly="readonly"
						value="비밀번호는 띄어쓰기 없이 8~15자의 영문 대/소문자, 숫자 및 	특수문자 중 2가지 이상 조합으로 입력하셔야 합니다."><br>
					<!-- pw 확인용 -->
					pwcheck: <input type="password" id="pw_set"> <input
						type="text" id="pw_confirm" readonly="readonly"
						value="비밀번호가 일치하지 않습니다. 다시 입력해주세요."> <br> 
					
					<!-- 이름 넣기 -->
					name: <input type="text" name="m_name" id="name_input" class="input">
					<p id="namechk">이름을 입력해주세요.</p>	<br> 
					<!-- 전화번호 -->
					tel: <select id="tel_option" name="m_tel">
						<option value="SKT" selected>SKT</option>
						<option value="LGT">LGT</option>
						<option value="KT">KT</option>
					</select> <input type="text" name="m_tel" id="tel_input"
						placeholder=" '-'를 포함하여 입력해주세요." class="input">
					<p id="telchk">전화번호를 '-'를 포함하여 정확하게 입력해주세요.</p>	<br> 
					<!-- 생일 -->
					birth: <input type="date" name="m_birth" id="birth_input" class="input"><br> 
					<!-- 성별 -->
					gender: 
					male <input type="radio" name="m_gender" id="gender" value="male"> 
					female <input type="radio" name="m_gender" id="gender" value="female"> <br>
					<!-- email -->
					e-mail: <input type="text" name="m_email" id="email_input" placeholder="이메일을 입력해주세요." class="input">
					<p id="emailchk">이메일을 정확하게 입력해주세요.</p>
					<br> 
					<!-- 실행버튼  -->
					<input type="button" id="submit_btn" value="회원가입">
	
				</form>
			</div>
		</div>
	</section>

	<c:import url="/footer" />


</body>
</html>