<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/user_menu_bar.css">

<script type="text/javascript">
	$(function(){
		
		var clicks = false;
		
		$("#user_tx").click(function(){
			if(clicks){				
				$("#user_tag").html("▼");
				$("#user").hide();
				clicks = false;
			}else {
				$("#user_tag").html("▲");
				$("#user").show();
				clicks = true;
			}
		});
		
		$("#product_tx").click(function(){
			if(clicks){				
				$("#product_tag").html("▼");
				$("#product").hide();
				clicks = false;
			}else {
				$("#product_tag").html("▲");
				$("#product").show();
				clicks = true;
			}
		});
		
		$("#software_tx").click(function(){
			if(clicks){				
				$("#software_tag").html("▼");
				$("#software").hide();
				clicks = false;
			}else {
				$("#software_tag").html("▲");
				$("#software").show();
				clicks = true;
			}
		});
		
		$("#notice_tx").click(function(){
			location.href="${pageContext.request.contextPath}/notice/noticeList";
		});
		
		$("#search_button").click(function (){
			var search = $("#search_area").val();
			location.href="${pageContext.request.contextPath}/product/pro_list_search?pro_title="+search;
		});
	});
</script>
</head>
<body>
	<div id="sub_header">
			<div class="h_menu" id="user_tx">
				<span>My Store</span>
				<span id="user_tag" class="h_icon">▼</span>
			</div>
			<div class="h_menu" id="product_tx">
				<span>Games</span>
				<span id="product_tag" class="h_icon">▼</span>
			</div>
			<div class="h_menu" id="software_tx">
				<span>Others</span>
				<span id="software_tag" class="h_icon">▼</span>
			</div>
			<div id="blink_tx">
				<span></span>
			</div>
			<div class="h_menu" id="notice_tx">
				<span>Notice</span>
			</div>
			<div id="search_input">
				<input id="search_area" type="text" placeholder="검색어를 입력하세요">
				<div id="search_btn">
					<button id="search_button">
						<img src="${pageContext.request.contextPath}/resources/css/common/img/search_icon.png">
					</button>
				</div>
			</div>
		</div>
		<div id="sub_header_menu">
				<div class="H_list" id="user">
					<ul>
						<li><a href="${pageContext.request.contextPath}/member/member_info">마이페이지</a></li>
						<li><a href="${pageContext.request.contextPath}/cart_favorite/cartList?m_id=${member.m_id}">장바구니</a></li>
						<li><a href="${pageContext.request.contextPath}/favorite/favoriteList?m_id=${member.m_id}">관심상품</a></li>
						<li><a href="${pageContext.request.contextPath}/purchase/purchase">구매내역</a></li>
					</ul>
				</div>
				<div class="H_list" id="product">
					<ul>
						<li><a href="${pageContext.request.contextPath}/product/pro_list">All Games</a></li>
						<li><a href="${pageContext.request.contextPath}/product/pro_list?top_category=action">Action</a></li>
						<li><a href="${pageContext.request.contextPath}/product/pro_list?top_category=rpg">RPG</a></li>
						<li><a href="${pageContext.request.contextPath}/product/pro_list?top_category=strategy">Strategy</a></li>
						<li><a href="${pageContext.request.contextPath}/product/pro_list?top_category=simulation">Simulation</a></li>
						<li><a href="${pageContext.request.contextPath}/product/pro_list?top_category=adventure">Adventure</a></li>
						<li><a href="${pageContext.request.contextPath}/product/pro_list?top_category=sports">Sports</a></li>
						<li><a href="${pageContext.request.contextPath}/product/pro_list?top_category=racing">Racing</a></li>
						<li><a href="${pageContext.request.contextPath}/product/pro_list?top_category=casual">Casual</a></li>
						<li><a href="${pageContext.request.contextPath}/product/pro_list?top_category=indi">INDI</a></li>
						<li><a href="${pageContext.request.contextPath}/product/pro_list?top_category=etc">MMO/ETC</a></li>
					</ul>
				</div>
				<div class="H_list" id="software">
					<ul>
						<li><a href="${pageContext.request.contextPath}/product/fav_product">오늘 본 게임</a></li>
						<li><a href="${pageContext.request.contextPath}/qna/qnaList">QnA</a></li>

						<c:if test="${member.m_kind == 2 }">						
							<li><a href="${pageContext.request.contextPath}/admin_main">관리자 페이지</a></li>
						</c:if>
					</ul>
				</div>
		</div>
</body>
</html>