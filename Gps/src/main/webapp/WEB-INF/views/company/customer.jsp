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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/company/company.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/common/img/icons.ico">
<script type="text/javascript">
	$(function(){
		$("#custo_comp").css("background-color","#32435c");
		$("#custo_comp").css("border","1px solid #aaaaaa");
		$("#custo_comp").css("border-radius","5px");
	});
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		<div id="first_company">
			
			<div id="second_company">
				<a id="agree_comp" href="${pageContext.request.contextPath}/company/agreement">이용약관</a>
				<a id="info_comp" href="${pageContext.request.contextPath}/company/information">개인정보취급방침</a>
				<a id="teen_comp" href="${pageContext.request.contextPath}/company/teenager">청소년보호정책</a>
				<a id="custo_comp" href="${pageContext.request.contextPath}/company/customer">고객센터</a>
			</div>
			<div id="third_company">
				<c:import url="/company/custom" />
			</div>
			
		</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>