<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- new game -->
<button>◁</button>
<c:forEach items="${pro_list_recent}" var="pro_list" varStatus="status">
	<div class="product">
		<input type="text" readonly="readonly" class="discount"
			value="할인% : ${pro_list.discount}%">
		<div class="img">
			<img src="resources/upload/${pro_main_img_recent[status.index].file_name }">
			<div class="game_txt">
				
			</div>
		</div>
	</div>
</c:forEach>
<button>▷</button>