<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${pro_list_sub_favor}" var="favor" varStatus="status">
	<div onmouseover="mouse(${status.index})">
		<table>
			<tr>
				<td colspan="2">
					<div class="discount_sub_img">
						<img
							src="resources/upload/${pro_main_img_sub_favor[status.index].file_name}">
					</div>
					<div class="discount_sub_contents"
						onclick="location.href='product/pro_view?pro_num=${favor.pro_num}'">
						<input type="hidden" id="check_${status.index}"
							value="${favor.pro_num}"> <span>게임 : </span>
						${favor.pro_title} <br> ${favor.pro_contents}
					</div>
				</td>
			</tr>
		</table>
	</div>
</c:forEach>