<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${pro_sub_volume}" var="volume" varStatus="status">
	<div onmouseover="mouse(${status.index})">
		<table>
			<tr>
				<td colspan="2">
					<div class="discount_sub_img">
						<img
							src="resources/upload/${pro_main_img_sub_volume[status.index].file_name}">
					</div>
					<div class="discount_sub_contents"
						onclick="location.href='product/pro_view?pro_num=${volume.pro_num}'">
						<input type="hidden" id="check_${status.index}"
							value="${volume.pro_num}"> <span>게임 : </span>
						${pro_sub_volume_title[status.index].pro_title} <br> ${pro_sub_volume_title[status.index].pro_contents}
					</div>
				</td>
			</tr>
		</table>
	</div>
</c:forEach>