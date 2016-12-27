<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<table>
		<tr>
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