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
		
		$(".c_login").click(function(){
			$(".c").hide();
			$(".cc").show();
		});
		
		
		$("#phone").click(function(){
			$(".opinion").hide();
			$("#phone_c").show();
		});
		$("#culture").click(function(){
			$(".opinion").hide();
			$("#culture_c").show();
			$(".c").show();
			$(".cc").hide();
		});
		$("#book").click(function(){
			$(".opinion").hide();
			$("#book_c").show();
			$(".c").show();
			$(".cc").hide();
		});
		$("#happy").click(function(){
			$(".opinion").hide();
			$("#happy_c").show();
			$(".c").show();
			$(".cc").hide();
		});
		$("#bank").click(function(){
			$(".opinion").hide();
			$("#bank_c").show();
		});
		$("#pin").click(function(){
			$(".opinion").hide();
			$("#pin_c").show();
			$(".c").show();
			$(".cc").hide();
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
			<div>
				<!-- icon -->
				<img src="${pageContext.request.contextPath }/resources/css/purchase/img/list.png">
			</div>
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
								<p class="minus">
									<img src="${pageContext.request.contextPath }/resources/css/purchase/img/remove.png">
								</p>
							</td>
							<td>
								<!-- 마일리지 적용 -->
								<span id="pro_millage"></span>
								<button id="mill_in">전부 적용</button>
							</td>
							<td>
								<p class="plus">
									<img src="${pageContext.request.contextPath }/resources/css/purchase/img/add.png">
								</p>
							</td>
							<td>
								<!-- 전자결제 수수료 (VAT) -->
								<span id="vat"></span>
							</td>
							<td>
								<p class="complete">
									<img src="${pageContext.request.contextPath }/resources/css/purchase/img/chat.png">
								</p>
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
				<div id="pay_way">
					<!-- 결제 수단 -->
					<div id="choice">
						<!-- 선택 -->
						<input type="radio" id="phone" name="choice"> <label for="phone">핸드폰 결제</label><!-- 핸드폰 결제 --> <br>
						<input type="radio" id="culture" name="choice"> <label for="culture">문화상품권 결제</label> <!-- 문화상품권 결제 --><br>
						<input type="radio" id="happy" name="choice"> <label for="happy">해피머니 결제</label> <!-- 해피머니 --><br>
						<input type="radio" id="book" name="choice"> <label for="book">북앤라이트 결제</label> <!-- 북앤라이프 --><br>
						<input type="radio" id="bank" name="choice"> <label for="bank">무통장 입금 (계좌이체, 인터넷뱅킹, 폰뱅킹)</label> <!-- 무통장입금(계좌이체, 인터넷뱅킹, 폰뱅킹) --><br>
						<input type="radio" id="pin" name="choice"> <label for="pin">상품권 핀 번호 입력 결제</label> <!-- 핀 번호 직접 입력 -->
					</div>
					<div class="opinion" id="phone_c">
						<!-- 상세 설명 : 핸드폰 결제-->
						<div>
							<select>
								<option>KT</option>
								<option>SKT</option>
								<option>LGT</option>
							</select>
							<input type="text"> - <input type="text"> - <input type="text">
						</div>
						<input type="button" value="결제">
					</div>
					<div class="opinion coupon" id="culture_c">
						<!-- 상세 설명 : 문화상품권 결제 -->
						<div class="c">
							<span>아이디 : </span><input type="text"><!-- 아이디 -->
							<span>비밀번호 : </span> <input type="password"><!-- 비밀번호 -->
							<input type="button" class="c_login" value="로그인">
						</div>
						<div class="cc">
							<input type="text" class="c_price" readonly="readonly"> <span> 원</span><!-- 잔액 금액 -->
							<input type="button" value="결제">
						</div>
					</div>
					<div class="opinion coupon" id="happy_c">
						<!-- 상세 설명 : 해피머니 -->
						<div class="c">
							<span>아이디 : </span><input type="text"><!-- 아이디 -->
							<span>비밀번호 : </span> <input type="password"><!-- 비밀번호 -->
							<input type="button" class="c_login" value="로그인">
						</div>
						<div class="cc">
							<input type="text" class="c_price" readonly="readonly"> <span> 원</span><!-- 잔액 금액 -->
							<input type="button" value="결제">
						</div>
					</div>
					<div class="opinion coupon" id="book_c">
						<!-- 상세 설명 : 북앤라이프 -->
						<div class="c">
							<span>아이디 : </span><input type="text"><!-- 아이디 -->
							<span>비밀번호 : </span> <input type="password"><!-- 비밀번호 -->
							<input type="button" class="c_login" value="로그인">
						</div>
						<div class="cc">
							<input type="text" class="c_price" readonly="readonly"><span> 원</span> <!-- 잔액 금액 -->
							<input type="button" value="결제">
						</div>
					</div>
					<div class="opinion" id="bank_c">
						<!-- 상세 설명  : 무통장입금 (계좌이체, 인터넷뱅킹, 폰뱅킹)-->
						<span>
							
						</span>
					</div>
					<div class="opinion" id="pin_c">
						<!-- 상세 설명 : 핀 번호 입력-->
						<div class="c">
							<input type="text"> - <input type="text"> - <input type="text"> - <input type="text"> - <input type="text">
							<input type="button" class="c_login" value="등록">
						</div>
						<div class="cc">
							<input type="text" class="c_price" readonly="readonly"> <span> 원</span> <!-- 등록한 상품권의 금액 -->
							<input type="button" value="결제">
						</div>
					</div>
				</div>
				<div id="pay_check">
					<!-- 최종 결제 확인 -->
					<div>
						<!-- 변동 가격 -->
						
					</div>
					<div>
						<!-- 최종 결제 가격 -->
						
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>