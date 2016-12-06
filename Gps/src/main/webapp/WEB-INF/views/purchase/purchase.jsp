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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/purchase/purchase.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$(".third_purchase").click(function(){
			$(".four_purchase").toggle();
		});
	});
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		<c:import url="/user_menu_bar" />
		<h3>구매 내역</h3>
		<div id="first_purchase">
			<!-- 구매한 게임  -->
			<div class="second_purchase">
				<!-- 구매한 날짜 -->
				<p class="purchase_day">
					2016/12/06
				</p>
				<!-- 날짜에 따른 구매 리스트 (타이틀 이미지) -->
				<div class="third_purchase">
					<div>
						<!-- 게임들의 타이틀 이미지 -->
					</div>
				</div>
				<!-- 구체적인 리스트 (게임 정보 및 view로의 링크가 걸린 내용) -->
				<div class="four_purchase">
					<div class="item">
							<div class="four_contents">
								<div class="f_g_img">
									
								</div>
								<table>
									<colgroup>
										<col style="width:80%;">
										<col style="width:10%;">
										<col style="width:10%;">
									</colgroup>
									<tr>
										<td class="f_g_name">GAME PAKAGE NAME</td>
										<td>
											<span class="window">
												<img src="${pageContext.request.contextPath}/resources/css/cart_favorite/img/icon_platform_win.png">
											</span>
											<span class="mac">
												<img src="${pageContext.request.contextPath}/resources/css/cart_favorite/img/icon_platform_mac.png">
											</span>
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
										<input type="button" value="재구매">
									</li>
								</ul>
							</div>
						</div>
				</div>
			</div>
			<div class="second_purchase">
				<!-- 구매한 날짜 -->
				<p class="purchase_day">
					2016/12/07
				</p>
				<!-- 날짜에 따른 구매 리스트 (타이틀 이미지) -->
				<div class="third_purchase">
					<div>
						<!-- 게임들의 타이틀 이미지 -->
					</div>
				</div>
				<!-- 구체적인 리스트 (게임 정보 및 view로의 링크가 걸린 내용) -->
				<div class="four_purchase">
					<div class="item">
							<div class="four_contents">
								<div class="f_g_img">
									
								</div>
								<table>
									<colgroup>
										<col style="width:80%;">
										<col style="width:10%;">
										<col style="width:10%;">
									</colgroup>
									<tr>
										<td class="f_g_name">GAME PAKAGE NAME</td>
										<td>
											<span class="window">
												<img src="${pageContext.request.contextPath}/resources/css/cart_favorite/img/icon_platform_win.png">
											</span>
											<span class="mac">
												<img src="${pageContext.request.contextPath}/resources/css/cart_favorite/img/icon_platform_mac.png">
											</span>
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
										<input type="button" value="재구매">
									</li>
								</ul>
							</div>
						</div>
				</div>
			</div>
		</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>