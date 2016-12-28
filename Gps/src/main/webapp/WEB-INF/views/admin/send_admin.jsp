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
function cd_key(i){
	var pro_num = $("#pro_num_"+i).val();
	var pm_num = $("#pm_num_"+i).val();
	var pur_num = $("#pur_num_"+i).val();
	var cd_key = $("#cd_key_"+i).val();
	var cd_check = $("#cd_check_"+i).val();
 
	if(cd_key=='null' && cd_check=='o'){
		$.ajax({
			url:'cd_key_no',
			type:'POST',
			data:{
				pro_num:pro_num,
				pm_num:pm_num,
				pur_num:pur_num
			},
			success: function(data){
				data=data.trim();
				$("#send_result").html(data);
			}
		});
	}else if(cd_key=='null' && cd_check=='x'){
		alert("CD_key를 생성해주세요.");
	}else if(cd_key!='null'){
		alert("이미 발급하였습니다.");
	}
}
</script>
</head>
<body>

<div id="send_result">
	<table>
		<tr>
			<td> 상품 번호 </td>
			<td> 상품 이름 </td>
			<td> 회원 아이디 </td>
			<td> CD_KEY 존재 </td>
			<td> CD_KEY 보유상태 </td>
			<td> CD_KEY 발급 </td>
		</tr>
 <c:forEach items="${send_list}" var="send_list" varStatus="status">
		<tr>
			<td> ${send_list.pur_num} </td>
			<td> ${productDTO[status.index]} </td>
			<td> ${send_list.m_id} </td>
			<td> 
				<c:choose>
					<c:when test="${cd_key[status.index] == 0}">
						X
					</c:when>
					<c:otherwise>
						O
					</c:otherwise>
				</c:choose>
			</td>
			<td> ${send_list.cd_serial} </td>
			<td>
				<input type="hidden" id="pur_num_${status.index}" value="${send_list.pur_num}">
				<input type="hidden" id="pro_num_${status.index}" value="${send_list.pro_num}">
				<input type="hidden" id="pm_num_${status.index}" value="${send_list.pm_num}">
				<input type="hidden" id="cd_key_${status.index}" value="${send_list.cd_serial}">
				<c:choose>
					<c:when test="${cd_key[status.index] == 0}">
						<input type="hidden" id="cd_check_${status.index}" value="x">
					</c:when>
					<c:otherwise>
						<input type="hidden" id="cd_check_${status.index}" value="o">
					</c:otherwise>
				</c:choose>
				<input type="button" onclick="cd_key(${status.index})" value="발급">
			</td>
		</tr>
</c:forEach>
	</table>
</div>
</body>
</html>