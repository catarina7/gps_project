<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- best game -->
<!-- <button id="before">◁</button> -->

<c:forEach items="${pro_list}" var="pro_list" varStatus="status">
	<div class="product">
		<input type="text" readonly="readonly" class="discount"
			value="${pro_list.discount} %">
		<div class="img">
			<img src="resources/upload/${pro_main_img[status.index].file_name }">
		</div>
	</div>
</c:forEach>

<!-- <button id="next">▷</button> -->