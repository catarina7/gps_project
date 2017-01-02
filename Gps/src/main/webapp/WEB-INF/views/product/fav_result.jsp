<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
				<h4> ※  오늘 본 상품</h4>
				<c:forEach var="i" begin="0" end="9">				
					<span><input type="hidden" name="pro_num" id="cookie_${i}" readonly="readonly"></span>
				</c:forEach>
				<c:forEach items="${fav_list}" var="fav_list" varStatus="status">				
						<div id="fav_items">
							<div id="items_first">
								<a href="${pageContext.request.contextPath}/product/pro_view?pro_num=${fav_list.pro_num}">
									<img src="../resources/upload/${fav_list_img[status.index].file_name}">
								</a>
							</div>
							<div id="items_second">
								<p id="cookie_price">Num. ${fav_list.pro_num}</p>
								<p>${fav_list.pro_title}</p>
								<p>${fav_list.pro_contents}</p>
								<p id="cookie_price"> $${fav_list.total_price}</p>
							</div>
						</div>
				</c:forEach>
			</div>