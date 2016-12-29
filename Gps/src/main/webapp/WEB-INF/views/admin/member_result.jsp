<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
