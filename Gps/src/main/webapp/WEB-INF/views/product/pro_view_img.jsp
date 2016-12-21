<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${pro_img_main}" var="img">
	<div class="sub_secon_img">
		<img src="resources/upload/${img.file_name}">
	</div>
</c:forEach>