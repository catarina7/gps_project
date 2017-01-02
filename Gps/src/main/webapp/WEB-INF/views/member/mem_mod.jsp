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
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/common/img/icons.ico">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/mem_mod.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
	#telchk{
		display: none;
	}
	#emailchk{
		display: none;
	}
	
</style>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		<!-- session 정리용 -->
		<!-- id -->
		<input type="hidden" value="${member.m_id}" id="id_input">
		<!-- gender -->
		<input type="hidden" value="${member.m_gender}" id="pas_gender">
		<!-- tel -->
		<input type="hidden" value="${member.m_tel}" id="pas_tel">
		
		
		<div>
		<h2>회원정보 수정</h2>
		<div>
		name: <input type="text" id="pu_name_input" value="${member.m_name}"><br>
		</div>
		<div>
		<!-- 전화번호 -->
		tel: <select id="pu_tel_option" >
					<option value="SKT">SKT</option>
					<option value="LGT">LGT</option>
					<option value="KT">KT</option>
				</select> 
				<input type="text" id="pu_tel_input" placeholder=" '-'를 포함하여 입력해주세요." >
				<p id="telchk">전화번호를 '-'를 포함하여 정확하게 입력해주세요.</p>	<br> 
		</div>
		<div>
		<!-- 성별 -->
		gender: 
				male <input type="radio" name="pu_m_gender"  value="male"> 
				female <input type="radio" name="pu_m_gender" value="female"> <br>
		</div>
		<div>
		<!-- email -->
		e-mail: <input type="text" id="pu_email_input" placeholder="이메일을 입력해주세요." class="input" value="${member.m_email}">
				<p id="emailchk">이메일을 정확하게 입력해주세요.</p><br>
		
		</div>
		<div>
		<!-- 실행 버튼 -->
		<button id="mod_btn">수정하기</button>
		</div>
		</div>
		
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>