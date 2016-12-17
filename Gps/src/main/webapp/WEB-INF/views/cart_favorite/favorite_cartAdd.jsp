<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${favorite_list}" var="favor" varStatus="status">
<div class="item">
	<div class="four_contents">
		<div class="f_g_check">
			<input class="check_box" id="checkbox1" type="checkbox">
			<label for="checkbox${status.index}"></label>
		</div>
		<div class="f_g_img">
			<img src="../resources/upload/${favorite_list_img[status.index].file_name}">
		</div>
		<table>
			<colgroup>
				<col style="width:80%;">
				<col style="width:10%;">
				<col style="width:10%;">
			</colgroup>
			<tr>
				<td class="f_g_name">${favor.pro_title}</td>
				<td>
					<span class="window">
						<img src="${pageContext.request.contextPath}/resources/css/cart_favorite/img/icon_platform_win.png">
					</span>
					<span class="mac">
						<img src="${pageContext.request.contextPath}/resources/css/cart_favorite/img/icon_platform_mac.png">
					</span>
				</td>
				<td>
					<input class="pro_delete" type="button" value="X">
				</td>
			</tr>
			<tr>
				<td class="f_g_ex" colspan="3">${favor.pro_contents }</td>
			</tr>
		</table>
		</div>
		<div class="tag">
			<ul>
				<li class="discount">-${favor.discount}%</li>
				<li class="price">
					<p class="nomal_p">${favor.price}</p>
					<span>${favor.total_price}</span>
				</li>
				<li>
					<input type="hidden" name="f_num" id="f_num${status.index}" value="${fDTO[status.index].f_num}">
					<input type="hidden" name="pro_num" id="pro_num${status.index}" value="${fDTO[status.index].pro_num}">
					<input type="hidden" name="m_id" id="m_id${status.index}" value="${member.m_id}">
					<input type="button" onclick="one_cart(${status.index})" value="장바구니 넣기">
				</li>
			</ul>
		</div>
	</div>
</c:forEach>