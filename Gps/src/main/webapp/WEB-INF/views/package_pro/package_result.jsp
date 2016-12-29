<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${package_pro }" var="pack" varStatus="status">				
		<div class="item">
				<div class="four_contents">
				<input type="hidden" value="${pack.pro_num }" id="pack_pro_num${status.index}">
				<input type="hidden" value="${pack.pack_num }" id="pack_num${status.index }"> 
					<table>
						<colgroup>
							<col style="width: 450px;">
							<col style="width: 100px;">
						</colgroup>
						<tr>
							<td class="f_g_name">${pack.pack_title }</td>
							<td></td>
						</tr>
						<tr>
							<td class="f_g_ex" colspan="2">${pack.pack_contents }</td>
						</tr>
						</table>
				</div>
				<div class="tag">
					<ul>
								<li class="discount">${pack.discount } %</li>
								<li class="price">
								<c:if test="${pack.total_price != 0 }">								
									<p class="nomal_p">₩ ${pack.price }</p> <span>₩ ${pack.total_price }</span>
								</c:if>
								<c:if test="${pack.total_price == 0 }">
									<p class="nomal_p">₩ ${pack.price }</p><span>₩ ${pack.price }</span>
								</c:if>
							</li>
						<li><input type="button" value="장바구니 담기" id="${status.index}" class="pack_btn"></li>
					</ul>
				</div>
		</div>
</c:forEach>