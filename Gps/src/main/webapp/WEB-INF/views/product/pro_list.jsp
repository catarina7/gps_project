<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Product List</h2>
	<div>
	<div>
		<c:forEach items="${pro_main_img}" var="pro">
			<img src="../resources/upload/${pro.file_name}">
		</c:forEach>
	</div>
	<div>
		<c:forEach items="${pro_list}" var="pro">
			<p>글 번호 : ${pro.pro_num} </p> 
		
			<p> 게임 이름 : ${pro.pro_title}</p> 
			
			<p>	가격 : ${pro.price}</p>
			
		    <p> 회사명 :  ${pro.company}</p>  
		</c:forEach>
	</div>
	</div>
	
	<c:if test="${pageMaker.curBlock>1}">
		<a href="pro_list?curPage=${pageMaker.startNum-1}">[이전]</a>
	</c:if>
	<c:forEach begin="${pageMaker.startNum}" end="${pagMakere.lastNum}" var="i">
		<a href="pro_list?curPage=${i}">${i}</a>
	</c:forEach>
	<c:if test="${pageMaker.curBlock<pageMaker.totalBlock}">
		<a href="pro_list?curPage=${pageMaker.lastNum+1}">[다음]</a>
	</c:if>
	
<a href="pro_write">Product Write</a>

</body>
</html>