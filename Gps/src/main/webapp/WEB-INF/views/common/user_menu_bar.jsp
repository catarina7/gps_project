<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/user_menu_bar.css">
<title>Insert title here</title>
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
				<span>SoftWare</span>
				<span id="software_tag" class="h_icon">▼</span>
			</div>
			<div class="h_menu">
				<span>menu</span>
			</div>
			<div class="h_menu">
				<span>Notice</span>
			</div>
			<div id="search_input">
				<input id="search_area" type="text" placeholder="검색어를 입력하세요">
				<div id="search_btn">
					<button>
						<img src="${pageContext.request.contextPath}/resources/css/common/img/search_icon.png">
					</button>
				</div>
			</div>
		</div>
		<div id="sub_header_menu">
				<div class="H_list" id="user">
					<ul>
						<li><a href="#">마이페이지</a></li>
						<li><a href="${pageContext.request.contextPath}/cart">장바구니</a></li>
						<li><a href="${pageContext.request.contextPath}/favorite">관심상품</a></li>
						<li><a href="#">구매내역</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
					</ul>
				</div>
				<div class="H_list" id="product">
					<ul>
						<li><a href="#">관심게임</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
					</ul>
				</div>
				<div class="H_list" id="software">
					<ul>
						<li><a href="#">한글패치</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
						<li><a href="#">list</a></li>
					</ul>
				</div>
		</div>
</body>
</html>