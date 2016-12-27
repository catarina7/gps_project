<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<table>
		<tr>
			<td> 상품 번호 </td>
			<td> 상품 이름 </td>
			<td> 회원 아이디 </td>
			<td> 결재 상태 </td>
			<td> CD_KEY 발급 </td>
		</tr>
<c:forEach items="${pro_num}" var="pro_num" varStatus="status">
		<tr>
			<td> ${pro_num} </td>
			<td> ${pro_title[status.index]} </td>
			<td> ${m_id[status.index]} </td>
			<td> ${status_ar[status.index]} </td>
			<td> <input type="button"  value="발급"> </td>
		</tr>
</c:forEach>		
		
	</table>
</body>
</html>