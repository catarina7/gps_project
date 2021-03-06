<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/common/img/icons.ico">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/admin_contents.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
function member(i){
	var m_num = $("#m_num_"+i).val();
	
	if(confirm("회원을 탈퇴 시키겠습니까?") == true){
		$.ajax({
			url:'member_delete',
			type:'POST',
			data:{
				m_num:m_num
			},
			success:function(data){
				data=data.trim();
				$("#member_result").html(data);
			}
		});
	}else{
		return;
	}
}
</script>
</head>
<body>
<section>
	<c:import url="/admin_main" />
	<div class="admin_product_first">
		<h2>회원 정보 관리</h2>
		<div id="member_result">
			<table>
				<tr id="title">
					<td> 회원번호 </td>
					<td> 아이디 </td>
					<td> 닉네임 </td>
					<td> 전화번호 </td>
					<td> 생년월일 </td>
					<td> 성별 </td>
					<td> E-mail</td>
					<td> 마일리지 </td>
					<td> 탈퇴 </td>
				</tr>
				<c:forEach items="${member_list}" var="member" varStatus="status">
				<tr>
					<td> ${member.m_num} </td>
					<td> ${member.m_id} </td>
					<td> ${member.m_name} </td>
					<td> ${member.m_tel} </td>
					<td> ${member.m_birth} </td>
					<td> ${member.m_gender} </td>
					<td> ${member.m_email} </td>
					<td> ${member.millage} </td>
					<td>
						<input type="hidden" id="m_num_${status.index}" value="${member.m_num}">
						<input type="button" onclick="member(${status.index})" value="삭제">
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</section>
</body>
</html>