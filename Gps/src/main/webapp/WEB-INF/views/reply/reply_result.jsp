<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${replyList}" var="rep" varStatus="status">
	<div class="re_title"></div>
	<div class="re_contents">
		<div class="re_user">
			${rep.r_writer} 
			<input type="hidden" name="m_id" id="m_id_${status.index}"	value="${rep.r_writer}">
			<input type="hidden" name="r_num" id="r_num_${status.index}" value="${rep.r_num}">
			<input type="button" onclick="reply_delete(${status.index})" value="삭제">
		</div>
		<textarea id="smarteditor" readonly="readonly"> ${rep.r_contents}</textarea>
	</div>
	<div class="re_sub">
		<div class="like" onclick="reply_like(${status.index})">
			<input type="hidden" name="m_id" id="m_id_like_${status.index}" value="${member.m_id}">
			<span> <img
				src="${pageContext.request.contextPath}/resources/css/product/img/thumbs-up.png">
			</span>
			<strong>
				<c:choose>
					<c:when test="${empty reply_like_count[status.index].like_count}">
						0
					</c:when>
					<c:otherwise>
						${reply_like_count[status.index].like_count}			
					</c:otherwise>
				</c:choose>
			</strong>
		</div>

	</div>
</c:forEach>