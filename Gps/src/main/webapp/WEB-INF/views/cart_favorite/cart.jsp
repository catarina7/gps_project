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
					<a href="/cart">장바구니</a>
					<a href="#">관심상품</a>
					<a href="#">구매내역</a>
				</div>
				<div id="second_else">
					<div class="item">
							<div class="four_contents">
								<table>
									<colgroup>
										<col style="width:450px;">
										<col style="width:100px;">
									</colgroup>
									<tr>
										<td class="f_g_name">GAME PAKAGE NAME</td>
										<td>
											
										</td>
									</tr>
									<tr>
										<td class="f_g_ex" colspan="2">game explanation</td>
									</tr>
								</table>
							</div>
							<div class="tag">
								<ul>
									<li class="discount">-20%</li>
									<li class="price">
										<p class="nomal_p">₩ 17000</p>
										<span>₩ 15000</span>
									</li>
									<li>
										<input type="button" value="구매하기">
									</li>
								</ul>
							</div>
						</div>
						<div class="item">
							<div class="four_contents">
								<table>
									<colgroup>
										<col style="width:450px;">
										<col style="width:100px;">
									</colgroup>
									<tr>
										<td class="f_g_name">GAME PAKAGE NAME</td>
										<td>
											
										</td>
									</tr>
									<tr>
										<td class="f_g_ex" colspan="2">game explanation</td>
									</tr>
								</table>
							</div>
							<div class="tag">
								<ul>
									<li class="discount">-20%</li>
									<li class="price">
										<p class="nomal_p">₩ 17000</p>
										<span>₩ 15000</span>
									</li>
									<li>
										<input type="button" value="구매하기">
									</li>
								</ul>
							</div>
						</div>
				</div>
			</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>