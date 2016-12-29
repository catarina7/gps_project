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
						<div id="game_images">
							<!-- 게임들의 타이틀 이미지 -->
							<c:forEach items="${pur.filelist}" var="mainfile" varStatus="status">
								<div class="f_g_pro_all">
									<div class="f_g_img">
										<a href="../product/pro_view?pro_num=${pur.productnum[status.index]}"> <img src="../resources/upload/${mainfile.file_name}"></a>
									</div>
									<div class="f_g_name">
										<!-- 상품 이름 넣는 div -->
										<span> ${pur.productinfo[status.index].pro_title} </span>
									</div>
								</div>
							</c:forEach> 					
						</div>
					</div>
						<!-- total price -->
						<div id="purchase_total_price"> 
							<span>결제 금액:</span> ${pur.purchase.total_price} 원
						</div>
					
					
				</div>
			</c:forEach>
			<!-- for문 end -->
			
			<!-- pageing -->
			</div>
			<div id="pro_list_paging">
				<div class="margins">
					<c:if test="${pagemaker.curBlock>1}">
						<a href="purchase?curPage=${pagemaker.startNum-1}">[이전]</a>
					</c:if>
					<c:forEach begin="${pagemaker.startNum}" end="${pagemaker.lastNum}"
						var="i">
						<a href="purchase?curPage=${i}">[ ${i} ]</a>
					</c:forEach>
					<c:if test="${pagemaker.curBlock<pageMaker.totalBlock}">
						<a href="purchase?curPage=${pagemaker.lastNum+1}">[다음]</a>
					</c:if>
				</div>
			</div>

	</section>
	<c:import url="/top_btn" />
	<c:import url="/footer" />
	
</body>
</html>