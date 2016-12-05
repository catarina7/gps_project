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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/comInfo.js"></script>
<style type="text/css">
	#cominfo_btn{
		display: none;
	}
</style>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		<h2>컴퓨터사양</h2>
		<div>
		m_num: <input type="hidden" name="m_num" id="m_num" value="${m_num}" readonly="readonly"><br>
		os: <input type="text" name="com_os" id="os_input" class="input"><br>
		cpu: <input type="text" name="com_process" id="process_input" class="input"><br>
		memory: <input type="text" name="com_memory" id="memory_input" class="input"><br>
		graphic: <input type="text" name="com_graphic" id="graphic_input" class="input"><br>
		directx: <input type="text" name="com_directx" id="directx_input" class="input"><br>
		남은용량: <input type="text" name="com_space" id="space_input" class="input"><br>
		
		<button id="skipit">건너뛰기</button>
		<button id="cominfo_btn">컴퓨터사항 입력</button>	
		
		</div>
		
		
		
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>