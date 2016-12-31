<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${cart_list}" var="cart" varStatus="status">
						<div class="item">
							<div class="four_contents">
								<div class="f_g_check">
									<input type="hidden" name="m_id" id="check_m_id" value="${member.m_id}">
									<input class="check_box" id="checkbox${status.index}" name="c_num" value="${cDTO[status.index].c_num}" type="checkbox">
									<label for="checkbox${status.index}"></label>
								</div>
								<div class="f_g_img">
									<img src="../resources/upload/${cart_list_img[status.index].file_name}">
								</div>
								<table>
									<colgroup>
										<col style="width:80%;">
										<col style="width:10%;">
										<col style="width:10%;">
									</colgroup>
									<tr>
										<td class="f_g_name">${cart.pro_title}</td>
										<td>
											<span class="window">
												<img src="${pageContext.request.contextPath}/resources/css/cart_favorite/img/icon_platform_win.png">
											</span>
											<span class="mac">
												<img src="${pageContext.request.contextPath}/resources/css/cart_favorite/img/icon_platform_mac.png">
											</span>
										</td>
										<td>
											<input type="hidden" name="c_num" id="c_num${status.index}" value="${cDTO[status.index].c_num}">
											<input type="hidden" name="pro_num" id="pro_num${status.index}" value="${cDTO[status.index].pro_num}" class="check_pro_num">
											<input type="hidden" name="m_id" id="m_id${status.index}" value="${member.m_id}">
											<input class="pro_delete" type="button" value="X" onclick="one_delete(${status.index})">
										</td>
									</tr>
									<tr>
										<td class="f_g_ex" colspan="3">${cart.pro_contents}</td>
									</tr>
								</table>
							</div>
							<div class="tag">
								<ul>
									<li class="discount">-20%</li>
									<li class="price">
										<p class="nomal_p">${cart.price}</p>
										<span>₩ 15000</span>
									</li>
									<li>
										<input type="button" value="구매하러 가기" onclick="one_bye(${status.index})">
									</li>
								</ul>
							</div>
						</div>
					</c:forEach>