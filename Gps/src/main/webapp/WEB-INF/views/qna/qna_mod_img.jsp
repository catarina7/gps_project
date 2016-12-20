<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${qna_mod_img}" var="img" varStatus="status">
	<div>
		<input class="check_box" id="checkbox${status.index}" name="qfile_num" value="${img.qfile_num}" type="checkbox"> 
		<input type="hidden" name="qfile_name" id="img_${status.index}" value="${img.qfile_name }"> 
		<label for="checkbox${status.index}"><img src="../resources/upload/${img.qfile_name}"></label>
	</div>
</c:forEach>
