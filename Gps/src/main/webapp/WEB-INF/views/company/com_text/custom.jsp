<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/company/company.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<c:import url="/header" />
	<section>
	<div id="first_company">
		<div id="third_company">
			<table>
				<tr>
					<td>TEL :<br>FAX :<br>E-MAIL :<br>상담업무 :</td>
					<td>010-7448-7429<br>070-1234-5678<br>GPS@gmail.com<br>오전11시-오후9시</td>
				</tr>
			</table>
			<br>
			
			<table>
			
			</table>
			
		</div>
	</div>

	</section>
	<c:import url="/footer" />
</body>
</html>