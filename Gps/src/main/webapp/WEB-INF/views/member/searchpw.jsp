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
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		<h2>비밀번호 찾기</h2>
		
		id: <input type="text" name="m_id" id="id_input" class="input">
				<p id="idchk">id를 정확하게 입력해주세요.</p><br>
		
		name: <input type="text" name="m_name" id="name_input" class="input">
				<p id="namechk">이름을 입력해주세요.</p>	<br> 
		
		e-mail: <input type="text" name="m_email" id="email_input" placeholder="이메일을 입력해주세요." class="input">
				<p id="emailchk">이메일을 정확하게 입력해주세요.</p>
		
		<button id="searchpw">찾기</button>
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>