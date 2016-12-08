<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- css 넣는 태그 -->
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/member_search.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/searchpw.js"></script>
<style type="text/css">
	#idchk{
		display: none;
	}
	#namechk{
		display: none;
	}
	#emailchk{
		display: none;
	}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	
		<!-- 내용 넣기 -->
		<h2 class="s_titi">비밀번호 찾기</h2>
		<table>
			<colgroup>
				<col style="width:33%;">
				<col style="width:63%;">
			</colgroup>
			<tr>
				<td class="sh_titi">
					아이디 : 
				</td>
				<td>
					<input type="text" name="m_id" id="sp_id_input" class="input">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<p id="idchk">id를 정확하게 입력해주세요.</p>
				</td>
			</tr>
			<tr>
				<td class="sh_titi">
					이름 : 
				</td>
				<td>
					<input type="text" name="m_name" id="sp_name_input" class="input">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<p id="namechk">이름을 입력해주세요.</p>
				</td>
			</tr>
			<tr>
				<td class="sh_titi">
					이메일 : 
				</td>
				<td>
					<input type="text" name="m_email" id="sp_email_input" placeholder="이메일을 입력해주세요." class="input">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<p id="emailchk">이메일을 정확하게 입력해주세요.</p>
				</td>
			</tr>
		</table>
		
		<button class="ss_btn" id="searchpw">찾기</button>

	
	
</body>
</html>