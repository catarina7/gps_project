<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${pro_mod_img}" var="img" varStatus="status">
	<div id="pro_mod_images">
		<input class="check_box" id="checkbox${status.index}" name="file_num" value="${img.file_num}" type="checkbox"> 
		<input type="hidden" name="file_name" id="img_${status.index}" value="${img.file_name}">
		<label for="checkbox${status.index}"><img src="../resources/upload/${img.file_name}"></label>
	</div>
</c:forEach>