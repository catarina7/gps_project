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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/member_info.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/member_info.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		$(".mem_in").show();
		
		$("#member_information").click(function(){
			$(".mem_in").show();
			$(".mem_mill").hide();
			$(".mem_game").hide();
		});
		$("#member_millage").click(function(){
			$(".mem_mill").show();
			$(".mem_in").hide();
			$(".mem_game").hide();
		});
		$("#member_product").click(function(){
			$(".mem_game").show();
			$(".mem_mill").hide();
			$(".mem_in").hide();
		});
		
		$("#purchase_buy").click(function(){
			location.href="${pageContext.request.contextPath}/purchase/purchase";
		});
		
		$("#mem_millage").click(function(){
			location.href="${pageContext.request.contextPath}/member/millage";
		});
		$("#mem_computer").click(function(){
			location.href="${pageContext.request.contextPath}/member/computer_info";
		});
	});
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section id="my_page">
		
		<c:import url="/user_menu_bar" />
		<h3>마이페이지</h3>
		<div id="mem_info_all">
			<div id="mem_info_menu">
				<div id="lineline">
					<!-- 회원 -->
					<div id="member_information">
						<div class="information">
							<dl>
								<dt></dt>
								<dd class="title">회원정보</dd>
								<dd>회원 정보를 확인하세요!</dd>
							</dl>
						</div>
					</div>
					<!-- 마일리지 -->
					<div id="member_millage">
						<div class="information">
							<dl>
								<dt></dt>
								<dd class="title">마일리지&사양</dd>
								<dd>마일리지와 컴퓨터사양을 확인하세요!</dd>
							</dl>
						</div>
					</div>
					<!-- 내 게임 -->
					<div id="member_product">
						<div class="information">
							<dl>
								<dt></dt>
								<dd class="title">내 게임정보</dd>
								<dd>내 게임을 관리해보세요!</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
			<div id="mem_info_category">
				<!-- 회원 -->
					<!-- 회원정보 수정 -->
				<div class="mem_in">
					<div class="information" id="meminfo_mod">
						<dl>
							<dt></dt>
							<dd class="title">회원정보 관리</dd>
							<dd>회원 정보를 관리합니다.</dd>
						</dl>
					</div>
				</div>
					<!-- 비밀번호 변경 -->
				<div class="mem_in">
					<div class="information" id="mempw_mod">
						<dl>
							<dt></dt>
							<dd class="title">비밀번호 변경</dd>
							<dd>비밀번호를 변경합니다.</dd>
						</dl>
					</div>
				</div>
					<!-- 회원 탈퇴 -->
				<div class="mem_in">
					<div class="information" id="mem_dropout">
						<dl>
							<dt></dt>
							<dd class="title">회원 탈퇴</dd>
							<dd>회원 탈퇴 하시는건가요?</dd>
						</dl>
					</div>
				</div>
				<!-- 마일리지 -->
					<!-- 마일리지 내역 -->
				<div id="mem_millage" class="mem_mill">
					<div class="information">
						<dl>
							<dt></dt>
							<dd class="title">내 마일리지</dd>
							<dd>마일리지를 확인하세요.</dd>
						</dl>
					</div>
				</div>
				<div id="mem_computer" class="mem_mill">
					<div class="information">
						<dl>
							<dt></dt>
							<dd class="title">내 컴퓨터</dd>
							<dd>내 컴퓨터 사양을 수정하세요.</dd>
						</dl>
					</div>
				</div>
				<!-- 내 게임 -->
					<!-- 보유 게임 -->
				<div class="mem_game">
					<div class="information">
						<dl>
							<dt></dt>
							<dd class="title">내 게임</dd>
							<dd>구매한 게임의 시디키를 확인하세요!</dd>
						</dl>
					</div>
				</div>
					<!-- 구매내역 -->
				<div id="purchase_buy" class="mem_game">
					<div class="information">
						<dl>
							<dt></dt>
							<dd class="title">구매내역</dd>
							<dd>구매 하신 게임을 확인하세요!</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>