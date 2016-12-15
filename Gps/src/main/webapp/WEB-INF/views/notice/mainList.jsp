<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:choose>
	<c:when test="${fn:length(mainList) > 0 }">
		<c:forEach items="${mainList}" var="m">
			<tr>
				<td><a href="noticeView?n_num=${m.n_num}">${m.n_title}</a></td>
				<td>${m.reg_date}</td>
			</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
			<td colspan="5" style="text-align: center;">게시된 등록글이 없습니다.</td>
		</tr>
	</c:otherwise>
</c:choose>