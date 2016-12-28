<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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