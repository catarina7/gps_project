<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/admin_contents.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/common/img/icons.ico">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
function pro_delete(i){
	var pro_num = $("#pro_num_"+i).val();
	if(confirm("삭제하시겠습니까?")==true){
		location.href="product_admin_delete?pro_num="+pro_num;
	}else{
		return;
	}
}

</script>

</head>
<body>

	<c:import url="/admin_main" />
	<section>
		<div class="admin_product_first">
			<h2> 상품 정보 관리 </h2>
				<table>
					<colgroup>
						<col style="width:5%;">
						<col style="width:20%;">
						<col style="width:10%;">
						<col style="width:5%;">
						<col style="width:5%;">
						<col style="width:5%;">
					</colgroup>
					<tr id="title">
						<td> 상품번호 </td>
						<td> 상품이름 </td>
						<td> 상품가격 </td>
						<td> 상품할인율 </td>
						<td> 비고 </td>
						<td> 삭제 </td>
					</tr>		
			<c:forEach items="${pro_list}" var="pro" varStatus="status">
					<tr>
						<td> ${pro.pro_num} </td>
						<td> ${pro.pro_title} </td>
						<td> ${pro.total_price} </td>
						<td> ${pro.discount} </td>
						<td> </td>
						<td>
							<input type="hidden" id="pro_num_${status.index}" value="${pro.pro_num}">
							<input type="button" onclick="pro_delete(${status.index})" value="삭제">
						</td>
					</tr>
			</c:forEach>
				</table>
				
		
			<div class="admin_product_pageing">
				<c:if test="${pageMaker.curBlock>1}">
					<a href="product_admin?curPage=${pageMaker.startNum-1}">[이전]</a>
				</c:if>
				<c:forEach begin="${pageMaker.startNum}" end="${pageMaker.lastNum}" var="i">
					<a href="product_admin?curPage=${i}">[ ${i} ]</a>
				</c:forEach>
				<c:if test="${pageMaker.curBlock<pageMaker.totalBlock}">
					<a href="product_admin?curPage=${pageMaker.lastNum+1}">[다음]</a>
				</c:if>
			</div>
		</div>
	</section>
	
	
</body>
</html>