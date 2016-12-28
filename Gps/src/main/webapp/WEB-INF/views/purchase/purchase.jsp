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
		
		$("#e_puchase").css("background-color","#2b394f");
	});
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		<c:import url="/user_menu_bar" />
		<div id="else_list">
			<div id="first_else">
				<div id="uu_menu">
					<a id="e_cart" href="${pageContext.request.contextPath}/cart">장바구니</a>
					<a id="e_favorite" href="${pageContext.request.contextPath}/favorite">관심상품</a>					
					<a id="e_puchase" href="${pageContext.request.contextPath}/purchase/purchase">구매내역</a>
				</div>
			</div>
		</div>
		
		
		<div id="first_purchase">
			<!-- 구매한 게임  -->
			<!-- foreach -->
			<c:forEach items="${pulisted}" var="pur" varStatus="status">
								
				<div class="second_purchase">
					<!-- 구매한 날짜 -->
					<p class="purchase_day">
						${pur.purchase.reg_date}
					</p>
					<!-- 날짜에 따른 구매 리스트 (타이틀 이미지) -->
					<div class="third_purchase">
					</div>
						<div>
							<!-- 게임들의 타이틀 이미지 -->
							<c:forEach items="${pur.filelist}" var="mainfile" varStatus="status">
								<div class="f_g_img">
									<a href="../product/pro_view?pro_num=${pur.productnum[status.index]}"> <img src="../resources/upload/${mainfile.file_name}"></a>
								</div>	
							</c:forEach> 					
						</div>
							<!-- total price -->
						<div>
							<span>total price: ${pur.purchase.total_price}</span>
						</div>
					<!-- 구체적인 리스트 (게임 정보 및 view로의 링크가 걸린 내용) -->
					<div class="four_purchase">
						<div class="item">
								<div class="four_contents">
									
									<table>
										<colgroup>
											<col style="width:80%;">
											<col style="width:10%;">
											<col style="width:10%;">
										</colgroup>
										<tr>
											<%-- <td class="f_g_name">${ProductPur_List[status.index].pro_title}</td> --%>
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
									<%-- <c:if test="${ProductPur_List[status.index].total_price != 0}">
									<ul>
										<li class="discount">${ProductPur_List[status.index].discount} %</li>
										<li class="price">
											<p class="nomal_p">₩ ${ProductPur_List[status.index].price}</p>
											<span>₩ ${ProductPur_List[status.index].total_price}</span>
										</li>
										<li>
											<input type="button" value="재구매">
										</li>
									</ul>
									</c:if>
									<c:if test="${ProductPur_List[status.index].total_price == 0}">
									<ul>
										<li class="discount">${ProductPur_List[status.index].discount} %</li>
										<li class="price">
											<p class="nomal_p">₩ ${ProductPur_List[status.index].price}</p>
											<span>₩ ${ProductPur_List[status.index].price}</span>
										</li>
										<li>
											<input type="button" value="재구매">
										</li>
									</ul>
									</c:if> --%>
								</div>
							</div>
					</div>
				</div>
			</c:forEach>
			<!-- for문 end -->
			
		</div>
		
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>