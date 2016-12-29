<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/admin_contents.css">
<title>Insert title here</title>
</head>
<body>
<section>
	<c:import url="/admin_main" />
	<div class="admin_product_first">
		<h2>매출 정보 관리</h2>		
		<table>
			<colgroup>
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:10%;">
			</colgroup>
			<tr id="title">
				<td> 매출번호 </td>
				<td> 회원 아이디 </td>
				<td> 상품 번호 </td>
				<td> 결제일 </td>
				<td> 결재상태 </td>
				<td> 총 가격 </td>
			</tr>
		<c:forEach items="${sales_list}" var="sales_list">
			<tr>
				<td> ${sales_list.pur_num} </td>
				<td> ${sales_list.m_id} </td>
				<td> ${sales_list.pro_num} </td>
				<td> ${sales_list.reg_date} </td>
				<td> ${sales_list.status} </td>
				<td> ${sales_list.total_price} </td>
			</tr>
		</c:forEach>
		</table>
		
		<h3 class="tot_price"> 총 매출액 | <span>${sum_price}</span> </h3>
		<h3 class="tot_price"> 총 매출량 | <span>${total_count}</span> </h3>
		
		<div class="admin_product_pageing">
			<c:if test="${pageMaker.curBlock>1}">
				<a href="sales_list?curPage=${pageMaker.startNum-1}">[이전]</a>
			</c:if>
			<c:forEach begin="${pageMaker.startNum}" end="${pageMaker.lastNum}" var="i">
				<a href="sales_list?curPage=${i}">[ ${i} ]</a>
			</c:forEach>
			<c:if test="${pageMaker.curBlock<pageMaker.totalBlock}">
				<a href="sales_list?curPage=${pageMaker.lastNum+1}">[다음]</a>
			</c:if>
		</div>
	</div>
</section>
</body>
</html>