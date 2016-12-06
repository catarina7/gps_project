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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/purchase/buy.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$(".pg_cart").css("color","#666666");
		$(".pg_buy").css("color","white");
		$("#pg_comple").css("color","#666666");
		
		$("#coments").keyup(function(){
			if($(this).val().length > 50){
				alert("50자 이하로 작성해주세요");
				$("#coments").val("");
			}
		});
	});
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<c:import url="/user_menu_bar" />
		<!-- 내용 넣기 -->
		<div id="buy_progress">
			<!-- 결제단계 만들기 -->
			<div><!-- icon --></div>
			<p id="titi">
				<!-- title -->
				주문서
			</p>
			<p id="sub">
				<!-- progress -->
				<span class="pg_cart">장바구니</span>
				<span class="pg_cart">></span>
				<span class="pg_buy">주문서</span>
				<span class="pg_buy">></span>
				<span id="pg_comple">결제완료</span>
			</p>
		</div>
		<div id="first_buy">
			<!-- 구매하고자 하는 게임 리스트 -->
			<div class="title"><span>◎</span> 구매 게임</div>
			<div id="second_buy">
				<div>
					
				</div>
			</div>
			<!-- 구매하고자 하는 상품들의 가격 합계(최종 구매 가격) -->
			<div class="title"><span>◎</span> 결제 금액</div>
			<div id="third_buy">
				<div id="th_contents">
					<table>
						<colgroup>
							<col style="width:15%;">
							<col style="width:8%;">
							<col style="width:20%;">
							<col style="width:8%;">
							<col style="width:15%;">
							<col style="width:8%;">
							<col style="width:20%;">
						</colgroup>
						<tr>
							<td class="th_title" colspan="2">결제 금액</td>
							<td class="th_title" colspan="2">마일리지</td>
							<td class="th_title" colspan="2">전자결제 수수료</td>
							<td class="th_title">최종결제 금액</td>
						</tr>
						<tr>
							<td>
								<!-- 상품의 합계가격 -->
								<span id="pro_price"></span>
							</td>
							<td>
								<p class="minus"></p>
							</td>
							<td>
								<!-- 마일리지 적용 -->
								<span id="pro_millage"></span>
								<button id="mill_in">전부 적용</button>
							</td>
							<td>
								<p class="plus"></p>
							</td>
							<td>
								<!-- 전자결제 수수료 (VAT) -->
								<span id="vat"></span>
							</td>
							<td>
								<p class="complete"></p>
							</td>
							<td>
								<!-- 최종 합계 가격 -->
								<span id="total_price"></span>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 남기고자 하는 말 -->
			<div class="title"><span>◎</span> 구매 코멘트</div>
			<div id="four_buy">
				<input id="coments" type="text" placeholder="남기고자 하는 글을 작성해 주세요 (최대: 50자)">
			</div>
			<!-- 결제 -->
			<div class="title"><span>◎</span> 결제 수단</div>
			<div id="five_buy">
				
			</div>
		</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>