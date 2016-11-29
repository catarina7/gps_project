<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#joinform{
		display: none;
	}
	#id_check{
		display: none;
	}
	#pw_confirm{
		display: none;
	}
	#pw_check{
		display: none;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/join.js"></script>

</head>
<body>

	<textarea rows="" cols="">
		<!-- 약정 첨부 예정 -->
	</textarea><br>
	
	<input type="checkbox" id="check"> 위 약정을 동의하고 13세 이상임을 확인합니다. 
	<button id="checkbox">동의합니다.</button>

	<div id="joinform">
		<form action="#" id="frm">
			id: <input type="text" name="m_id" id="id_input" class="input">
			<input type="button" id="id_check" value="id_check"><br> 
			
			pw: <input type="text" name="m_pw" id="pw_input" class="input">
			<input type="text" id="pw_check" readonly="readonly" value="비밀번호는 띄어쓰기 없이 8~15자의 영문 대/소문자, 숫자 및 	특수문자 중 2가지 이상 조합으로 입력하셔야 합니다."><br>
			pwcheck: <input type="text" id="pw_set" >
			<input type="text" id="pw_confirm" readonly="readonly" value="비밀번호가 일치하지 않습니다. 다시 입력해주세요.">
			<br>
			
			name: <input type="text" name="m_name" id="name_input" class="input">
			<p id="namechk">이름을 입력해주세요.</p>
			<br>
			tel: <select id="tel_option" name="m_tel">
				<option value="SKT" selected>SKT</option> 
				<option value="LGT">LGT</option>
				<option value="KT">KT</option>
			</select> 
				<input type="text" name="m_tel" id="tel_input" placeholder=" '-'를 포함하여 입력해주세요." class="input">
				<p id="telchk">전화번호를 '-'를 포함하여 정확하게 입력해주세요.</p> 
			<br> 
			birth: <input type="date" name="m_birth" id="birth_input" class="input"><br>
			gender: 
			male <input type="radio" name="m_gender" id="gender" value="male"> 			
			female <input type="radio" name="m_gender" id="gender" value="female"> 
			<br>
			e-mail: <input type="text" name="m_email" id="email_input" placeholder="이메일을 입력해주세요." class="input">
			<p id="emailchk">이메일을 정확하게 입력해주세요.</p><br>
			<input type="button" id="submit_btn" value="회원가입">
	
		</form>
	</div>


</body>
</html>