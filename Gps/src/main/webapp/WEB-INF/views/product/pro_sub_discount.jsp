<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${pro_list_sub_discount}" var="discount" varStatus="status">
	<div onmouseover="mouse(${status.index})">
		<table>
			<tr>
				<td colspan="2">
					<div class="discount_sub_img">						
						<img src="resources/upload/${pro_main_img_sub_discount[status.index].file_name}">
					</div>
					<div class="discount_sub_contents">
						<input type="hidden" id="check_${status.index}" value="${discount.pro_num}"> 
						제목: ${discount.pro_title} <br>
						내용: ${discount.pro_contents}						
					</div>
				</td>
				<%-- <td>
					<img src="resources/upload/${pro_main_img_sub_discount[status.index].file_name}">
				</td>
				<td>
					<input type="hidden" id="check_${status.index}" value="${discount.pro_num}"> 
						제목: ${discount.pro_title} <br>
						내용: ${discount.pro_contents}	
				</td> --%>
			</tr>
		</table>
	</div>
</c:forEach>