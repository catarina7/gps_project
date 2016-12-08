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
				<textarea id="contract" readonly="readonly">
					<c:import url="/member/contract"></c:import>
				</textarea><br>
				<input type="checkbox" id="checkcon">
				<label for="checkcon">
					 위 약정을 동의하고 13세이상임을 확인합니다.
				</label> 
				<!-- 개정보호 -->
				<textarea id="license" readonly="readonly">
					<c:import url="/member/license"></c:import>			
				</textarea>	<br> 
				<input type="checkbox" id="checkli">
				<label for="checkli">
					 아이디 보호에 대한 약정을 확인합니다.
				</label>
				<button id="checkbox">동의합니다.</button>
			</div>
				

			<div id="joinform">
				<form action="#" id="frm">
					<table>
						<colgroup>
							<col style="width:23%;">
							<col style="width:40%;">
							<col style="width:37%;">
						</colgroup>
						<tr>
							<td class="m_titles">
								아이디 :
							</td>
							<td>
								<input type="text" name="m_id" id="id_input" class="input">
							</td>
							<td>
								<input type="button" id="id_check" value="중복체크">
							</td>
						</tr>
						<tr>
							<td class="m_titles">
								비밀번호 :
							</td>
							<td>
								<input type="password" name="m_pw" id="pw_input" class="input">
							</td>
							<td>
								<span id="pw_check">비밀번호는 띄어쓰기 없이 8~15자의 영문 대/소문자, 숫자 및 	특수문자 중 2가지 이상 조합으로 입력하셔야 합니다.</span>
							</td>
						</tr>
						<tr>
							<td class="m_titles">
								비밀번호 확인 :
							</td>
							<td>
								<input type="password" id="pw_set"> 
							</td>
							<td>
								<span id="pw_confirm">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</span>
							</td>
						</tr>
						<tr>
							<td class="m_titles">
								이름 :
							</td>
							<td>
								<input type="text" name="m_name" id="name_input" class="input">
							</td>
							<td>
								<span id="namechk">이름을 입력해주세요.</span>
							</td>
						</tr>
						<tr>
							<td class="m_titles">
								전화번호 :
							</td>
							<td>
								 <select id="tel_option" name="m_tel">
									<option value="SKT" selected>SKT</option>
									<option value="LGT">LGT</option>
									<option value="KT">KT</option>
								</select> 
								<input type="text" name="m_tel" id="tel_input" placeholder=" '-'를 포함하여 입력해주세요." class="input">
							</td>
							<td>
								<span id="telchk">전화번호를 '-'를 포함하여 정확하게 입력해주세요.</span>
							</td>
						</tr>
						<tr>
							<td class="m_titles">
								생일 :
							</td>
							<td colspan="2">
								<input type="date" name="m_birth" id="birth_input" class="input">
							</td>
						</tr>
						<tr>
							<td class="m_titles">
								성별 :
							</td>
							<td colspan="2">
								남성 <input type="radio" checked="checked" name="m_gender" id="gender" value="male"> 
								여성 <input type="radio" name="m_gender" id="gender" value="female">
							</td>
						</tr>
						<tr>
							<td class="m_titles">
								이메일 :
							</td>
							<td>
								<input type="text" name="m_email" id="email_input" placeholder="이메일을 입력해주세요." class="input">
							</td>
							<td>
								<span id="emailchk">이메일을 정확하게 입력해주세요.</span>
							</td>
						</tr>
					</table>
					<!-- 실행버튼  -->
					<input type="button" id="submit_btn" value="회원가입">
	
				</form>
			</div>
		</div>
	</section>

	<c:import url="/footer" />


</body>
</html>