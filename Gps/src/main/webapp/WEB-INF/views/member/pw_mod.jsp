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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/pw_mod.css">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/pw_mod.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
	#pw_check{
		display: none;
	}
	#pw_confirm{
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
		
		<div id="fisrt_pw">
			<c:import url="/user_menu_bar"/>
		</div>
		<!-- 내용 넣기 -->

		<div id="second_pw">
			<h2>비밀번호 수정</h2>
			
			<table>
				<colgroup>
					<col style="width:30%;">
					<col style="width:60%;">
				</colgroup>
				<tr>
					<td class="p_title">현재 비밀번호 : </td>
					<td>
						<input type="password" name="m_pw" id="se_pw_input" class="input">
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td class="p_title">새로운 비밀번호 : </td>
					<td>
						<input type="password" name="m_pw" id="se_new_pw_input" class="input">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<span id="pw_check">비밀번호는 띄어쓰기 없이 8~15자의 영문 대/소문자, 숫자 및 	특수문자 중 2가지 이상 조합으로 입력하셔야 합니다.</span>
					</td>
				</tr>
				<tr>
					<td class="p_title">새로운 비밀번호 확인 </td>
					<td>
						<input type="password" name="m_pw" id="se_pw_set" class="input"><br>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<span id="pw_confirm" > 비밀번호가 일치 하지 않습니다.</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button id="pwmod_btn">수정하기</button>						
					</td>
				</tr>
			</table>	
		</div>
		<!-- <div>
		<h2>비밀번호 수정</h2>
		
		현재 비밀번호
		<input type="password" id="se_pw_input"><br>
		새로운 비밀번호 
		<input type="password" id="se_new_pw_input"><br>
		<input type="text" id="pw_check" readonly="readonly" value="비밀번호는 띄어쓰기 없이 8~15자의 영문 대/소문자, 숫자 및 	특수문자 중 2가지 이상 조합으로 입력하셔야 합니다."><br>
		새로운 비밀번호 확인
		<input type="password" id="se_pw_set"><br>
		<input type="text" id="pw_confirm" readonly="readonly" value="비밀번호가 일치 하지 않습니다."><br>
		<button id="pwmod_btn">수정하기</button>	  
		
		</div> -->
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>