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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/mem_info.css">
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
		<div id="second_mem">
			<c:import url="/user_menu_bar"/>
		</div>
		<!-- session 정리용 -->
		<div id="first_mem">
			
			<!-- pw -->
			<input type="hidden" value="${member.m_pw}" id="pas_pw">
			<!-- gender -->
			<input type="hidden" value="${member.m_gender}" id="pas_gender">
			<!-- tel -->
			<input type="hidden" value="${member.m_tel}" id="pas_tel">
			
			<h2>회원정보 확인</h2>
			<!-- id -->
					<table>
						<colgroup>
							<col style="width:22%;">
							<col style="width:42%;">
							<col style="width:32%;">
						</colgroup>
						<tr>
							<td class="title_m">아이디 : </td>
							<td colspan="2">
								<input type="text" readonly="readonly" name="m_id" id="id_input" class="input" value="${member.m_id}">
							</td>
						</tr>
						<tr>
							<td class="title_m"> 비밀번호 : </td>
							<td>
								<input type="text" name="m_pw" id="pw_input" class="input" readonly="readonly">
							</td>
							<td>
								<button id="pwmod_btn">비밀번호 수정</button>
							</td>
						</tr>
						<tr>
							<td class="title_m">이름 : </td>
							<td colspan="2">
								<input type="text" readonly="readonly" name="m_name" id="name_input" class="input" value="${member.m_name}">
							</td>
						</tr>
						<tr>
							<td class="title_m">전화번호 : </td>
							<td colspan="2">
								<select id="tel_option" name="m_tel">
									<option value="SKT" selected>SKT</option>
									<option value="LGT">LGT</option>
									<option value="KT">KT</option>
								</select>
								 
								<input type="text" readonly="readonly" name="m_tel" id="tel_input" placeholder=" '-'를 포함하여 입력해주세요." class="input">
							</td>
						</tr>
						<tr>
							<td class="title_m">생일 : </td>
							<td colspan="2">
								<input type="date" readonly="readonly" name="m_birth" id="birth_input" class="input" value="${member.m_birth}"><br>
							</td>
						</tr>
						<tr>
							<td class="title_m">성별 : </td>
							<td colspan="2">
								<label for="gender">남성</label> <input type="radio" name="m_gender" id="gender" value="male"> 
								<label for="gender_w">여성</label> <input type="radio" name="m_gender" id="gender_w" value="female">
							</td>
						</tr>
						<tr>
							<td class="title_m">이메일 : </td>
							<td colspan="2">
								<input type="text" readonly="readonly" name="m_email" id="email_input" placeholder="이메일을 입력해주세요." class="input" value="${member.m_email}">
							</td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td>
								<button id="mod_btn">회원정보 수정</button>
							</td>
						</tr>
					</table>
		</div>
		
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>