<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/cart_favorite/cart_favorite.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#e_cart").css("background-color","#2b394f");
		/* 체크박스 체크 */
		$(".check_box").prop("checked",true);
	});
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<c:import url="/user_menu_bar" />
		<!-- 내용 넣기 -->
			<div id="else_list">
				<div id="first_else">
					<div id="uu_menu">
						<a id="e_cart" href="${pageContext.request.contextPath}/cart">장바구니</a>
						<a id="e_favorite" href="${pageContext.request.contextPath}/favorite">관심상품</a>
						<a id="e_puchase" href="#">구매내역</a>
					</div>
				</div>
				
				<!-- 장바구니 리스트 -->
				
				<div id="second_else">
					<c:forEach items="${cart_list}" var="cart" varStatus="status">
						<div class="item">
							<div class="four_contents">
								<div class="f_g_check">
									<input class="check_box" id="checkbox1" type="checkbox">
									<label for="checkbox1"></label>
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
											<input class="pro_delete" type="button" value="X">
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
										<input type="button" value="구매하러 가기">
									</li>
								</ul>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id="third_else">
					<button>선택 구매</button>
					<button>모두 빼기</button>
				</div>
			</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>