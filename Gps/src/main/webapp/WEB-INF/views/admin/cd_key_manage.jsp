<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/admin_contents.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#pro_num").keyup(function(event){
		$(this).val( $(this).val().replace(/[^0-9]/gi,''));
	});
	
	$(".cd_key").keyup(function(event){		
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
		}
		if(parseInt($("#cd_key1").val().length) > 4){
			alert("각 자리는 4자리 알파벳과 숫자 조합입니다.");
			$(this).val("");
		}else if(parseInt($("#cd_key2").val().length) > 4){
			alert("각 자리는 3자리 알파벳과 숫자 조합입니다.");
			$(this).val("");
		}else if(parseInt($("#cd_key3").val().length) > 4){
			alert("각 자리는 3자리 알파벳과 숫자 조합입니다.");
			$(this).val("");
		}
	});
});
function cd_key_create() {
	var pro_num = $("#pro_num").val();
	var cd_key1 = $("#cd_key1").val();
	var cd_key2 = $("#cd_key2").val();
	var cd_key3 = $("#cd_key3").val();
	var cd_serial = cd_key1+'-'+cd_key2+'-'+cd_key3;
	

	if(pro_num==''){
		alert("상품번호를 입력해주세요.");
	}else if(cd_key1=='' || cd_key2=='' || cd_key3==''){
		alert("CD_KEY를 입력해주세요.");
	}else{
		$.ajax({
			url:'cd_key_add',
			type:'POST',
			data:{
				pro_num : pro_num,
				cd_serial : cd_serial
			},
			success: function(data){
				data=data.trim();
				$("#cd_result").html(data);
			}
		});
	}
}
function cd_key_del(i){
	var cd_num = $("#cd_num_"+i).val();
	
	$.ajax({
		url: 'cd_key_delete',
		type: 'POST',
		data:{
			cd_num:cd_num
		},
		success:function(data){
			data=data.trim();
			$("#cd_result").html(data);
		}
	});
}
</script>
</head>
<body>
<section>
	<c:import url="/admin_main" />
	<div class="admin_product_first">
		<h2> CD_KEY 관리</h2>
		`	<div class="admin_product_save">
				<input type="button" value="CD_KEY 생성">
			</div>
			<div class="admin_product_save lineline">
				<p> 상품번호 입력 </p>
				<input type="text" id="pro_num">
				<p> CD-Key 입력 </p>
				<input type="text" class="cd_key" id="cd_key1"> - 
				<input type="text" class="cd_key" id="cd_key2"> - 
				<input type="text" class="cd_key" id="cd_key3">
				<br>
				<input type="button" onclick="cd_key_create()" value="생성">
			</div>
		<!-- ajax_div -->
		<div id="cd_result">
			<table>
				<colgroup>
					<col style="width:14%;">
					<col style="width:24%;">
					<col style="width:19%;">
					<col style="width:19%;">
					<col style="width:19%;">
				</colgroup>
				<tr id="title">
					<td> CD_NUM </td>
					<td> 상품번호 </td>
					<td> CD_KEY </td>
					<td> CD_KEY 발급여부 </td>
					<td> 삭제여부 </td>
				</tr>
		
		<c:forEach items="${cd_key_list}" var="cd_key" varStatus="status">	
				<tr>
					<td> ${cd_key.cd_num} </td>
					<td> ${cd_key.pro_num} </td>
					<td> ${cd_key.cd_serial} </td>
					<td> ${cd_key.cd_check} </td>
					<td>
						<input type="hidden" id="cd_num_${status.index}" value="${cd_key.cd_num}">
						<input type="button" onclick="cd_key_del(${status.index})" value="삭제">
					</td>
				</tr>	
		</c:forEach>
			</table>
		</div>
			<div class="admin_product_pageing">
				<c:if test="${pageMaker.curBlock>1}">
					<a href="cd_key_manage?curPage=${pageMaker.startNum-1}">[이전]</a>
				</c:if>
				<c:forEach begin="${pageMaker.startNum}" end="${pageMaker.lastNum}" var="i">
					<a href="cd_key_manage?curPage=${i}">[ ${i} ]</a>
				</c:forEach>
				<c:if test="${pageMaker.curBlock<pageMaker.totalBlock}">
					<a href="cd_key_manage?curPage=${pageMaker.lastNum+1}">[다음]</a>
				</c:if>
			</div>
	</div>
</section>
</body>
</html>