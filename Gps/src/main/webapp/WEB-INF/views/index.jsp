<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		
		
		
		if ($("#pas_kind").val() == 10) {
			alert("비밀번호 변경을 바로 진행 합니다.");
			location.href = "member/pw_check?category=2";
		}


		$("#pack_1").click(function() {
			$(this).css("background-color", "#777777");
			$(this).css("border", "2px solid #777777");
			$("#pack_2").css("background-color", "#666666");
			$("#pack_3").css("background-color", "#666666");
			$("#pack_4").css("background-color", "#666666");
			$("#pack_2").css("border", "2px solid #666666");
			$("#pack_3").css("border", "2px solid #666666");
			$("#pack_4").css("border", "2px solid #666666");
		});

		$("#pack_2").click(function() {
			$(this).css("background-color", "#777777");
			$(this).css("border", "2px solid #777777");
			$("#pack_1").css("background-color", "#666666");
			$("#pack_3").css("background-color", "#666666");
			$("#pack_4").css("background-color", "#666666");
			$("#pack_1").css("border", "2px solid #666666");
			$("#pack_3").css("border", "2px solid #666666");
			$("#pack_4").css("border", "2px solid #666666");
		});

		$("#pack_3").click(function() {
			$(this).css("background-color", "#777777");
			$(this).css("border", "2px solid #777777");
			$("#pack_1").css("background-color", "#666666");
			$("#pack_2").css("background-color", "#666666");
			$("#pack_4").css("background-color", "#666666");
			$("#pack_1").css("border", "2px solid #666666");
			$("#pack_2").css("border", "2px solid #666666");
			$("#pack_4").css("border", "2px solid #666666");
		});

		$("#pack_4").click(function() {
			$(this).css("background-color", "#777777");
			$(this).css("border", "2px solid #777777");
			$("#pack_1").css("background-color", "#666666");
			$("#pack_2").css("background-color", "#666666");
			$("#pack_3").css("background-color", "#666666");
			$("#pack_1").css("border", "2px solid #666666");
			$("#pack_2").css("border", "2px solid #666666");
			$("#pack_3").css("border", "2px solid #666666");
		});

		
		
		$("#all_list").click(function() {
			location.href = "${pageContext.request.contextPath}/product/pro_list";
		});
		$("#mem_cart").click(function(){
			location.href = "${pageContext.request.contextPath}/cart_favorite/cartList?m_id=${member.m_id}";
		});
		$("#mem_fav").click(function(){
			location.href = "${pageContext.request.contextPath}/favorite/favoriteList?m_id=${member.m_id}";
		});
		//공지사항 불러오기
		$.ajax({
			url : 'notice/mainList',
			type : 'POST',
			success : function(data) {
				data = data.trim();
				$("#mainList1").html(data);
			}
		});
		
		$("#chat_open_click").click(function(){
			 $("#chat_open").show();
		 });
		$("#chat_closes").click(function(){
			$("#chat_open").hide();
		});
		$("#chat_top").click(function(){
			$("#data").scrollTop(0);
		});
		
		//카테고리 url 시작
		$("#action").click(function(){
			location.href = "${pageContext.request.contextPath}/product/pro_list?top_category=action";
		});
		$("#rpg").click(function(){
			location.href = "${pageContext.request.contextPath}/product/pro_list?top_category=rpg";
		});
		$("#simulation").click(function(){
			location.href = "${pageContext.request.contextPath}/product/pro_list?top_category=simulation";
		});
		$("#adventure").click(function(){
			location.href = "${pageContext.request.contextPath}/product/pro_list?top_category=adventure";
		});
		$("#sports").click(function(){
			location.href = "${pageContext.request.contextPath}/product/pro_list?top_category=sports";
		});
		$("#racing").click(function(){
			location.href = "${pageContext.request.contextPath}/product/pro_list?top_category=racing";
		});
		$("#casual").click(function(){
			location.href = "${pageContext.request.contextPath}/product/pro_list?top_category=casual";
		});
		$("#indi").click(function(){
			location.href = "${pageContext.request.contextPath}/product/pro_list?top_category=indi";
		});
		$("#etc").click(function(){
			location.href = "${pageContext.request.contextPath}/product/pro_list?top_category=etc";
		});
		//카테고리 url 끝
		
		
		//인기순
		$.ajax({
			url : 'product/pro_main_like',
			type : 'POST',
			success : function(data){
				data=data.trim();
				$("#main_first").html(data);
			}
		});
		//최신순
	
		$.ajax({
			url : 'product/pro_main_recent',
			type : 'POST',
			success : function(data){
				data=data.trim();
				$("#main_second").html(data);
			}
		});
		
		
		//마우스오버 함수
		
		$("#main_first").on("mouseenter", ".img", function(){
			$(this).children().last().show();
			$("#main_first").stop();
		});
		$("#main_first").on("mouseleave", ".img", function(){
			$(this).children().last().hide();
			setInterval();
		});
		
		$("#main_second").on("mouseenter", ".img", function(){
			$(this).children().last().show();
		});
		$("#main_second").on("mouseleave", ".img", function(){
			$(this).children().last().hide();
		});
		
		//추천 게임 세로 슬라이드
		var fav_count = 0;
		var fav_max_height = 0 - 382;
		
		var auto_count = 0;
		
		setInterval(function() {
            if(fav_count == 0 || fav_count != fav_max_height){            	
            	if(auto_count == 1){
            		fav_count = fav_count + 191;
    				$("#main_first").animate({top : fav_count+'px'},"slow");
    				auto_count = 0;
            	}else{            		
		            fav_count = fav_count - 191;
			        $("#main_first").animate({top : fav_count+'px'},"slow");
            	}
            }else{
				fav_count = fav_count + 191;
				$("#main_first").animate({top : fav_count+'px'},"slow");
				auto_count = 1;
            }
			
        }, 5000);
		
		//클릭 이벤트
		
		$("#next").click(function(){
			$("#main_first").stop();
			if(fav_count == fav_max_height){
				$("#main_first").animate({top : '0px'});
				fav_count = 0;
			}else {
				fav_count = fav_count - 191;
				$("#main_first").animate({top : fav_count+'px'});
			}
		});
		
		$("#before").click(function(){
			$("#main_first").stop();
			if(fav_count == 0){
				$("#main_first").animate({top : fav_max_height});
				fav_count = fav_max_height;
			}else {
				fav_count = fav_count + 191;
				$("#main_first").animate({top : fav_count+'px'});
			}
		});
		
		//신작 게임 넘기기
		var count = 0;
		var max_height = 0 - 382;
		
		$("#new_next").click(function(){
			if(count == max_height){
				$("#main_second").css("top", "0px");
				count = 0;
			}else {
				count = count - 191;
				$("#main_second").css("top", count+"px");
			}
		});
		
		$("#new_before").click(function(){
			if(count == 0){
				$("#main_second").css("top", max_height);
				count = max_height;
			}else {
				count = count + 191;
				$("#main_second").css("top", count+"px");
			}
		});
		
		//초특가
		$.ajax({
			url : 'product/pro_sub_discount',
			type : 'POST',
			success : function(data){
				data=data.trim();
				$("#sub_first").html(data);
			}
		});
		
	});
	//초특가
	$(document).ready(function(){
		$("#pack_1").on("click", function(){
			$.ajax({
				url : 'product/pro_sub_discount',
				type : 'POST',
				success : function(data){
					data=data.trim();
					$("#sub_first").html(data);
				}
			});
		});
		
		$("#noticeList").click(function(){
			location.href="${pageContext.request.contextPath}/notice/noticeList";
		});
		
		$("#qnaList").click(function(){
			location.href="${pageContext.request.contextPath}/qna/qnaList";
		});
	});
	
	$(document).ready(function(){
		$("#pack_2").on("click", function(){
			$.ajax({
				url: 'product/pro_sub_favor',
				type: 'POST',
				success: function(data){
					data=data.trim();
					$("#sub_first").html(data);
				}
			});
		});
	});
	
	function mouse(i){
		var pro_num = $("#check_"+i).val();
		$.ajax({
			url: 'product/pro_view_img_main',
			type: 'POST',
			data:{
				pro_num: pro_num
			},
			success: function(data){
				data=data.trim();
				$("#sub_second").html(data);
			}
		});
	}
</script>
</head>
<body>

	<c:import url="/header" />

	<!-- session 정리용 -->
	<input type="hidden" id="pas_kind" value="${member.m_kind}">

	<!-- section -->
	<section>
		<div id="advertisement"></div>
		<div id="index_story">

			<div id="decoration">
				<!-- decoration image -->

			</div>
			<c:import url="/user_menu_bar" />
			<div id="menu_bar">
				<!-- menu -->
				<!-- <p>RECOMMENDED</p>
				<ul>
					<li>list</li>
					<li>list</li>
					<li>list</li>
				</ul> -->
				<p>USER SERVICE</p>
				<ul>
					<li id="mem_cart">장바구니</li>
					<li id="mem_fav">관심상품</li>
				</ul>
				<p>CATEGORY</p>
				<ul>
					<li id="all_list">전체 상품</li>
					<li id="action">Action</li>
					<li id="rpg">RPG</li>
					<li id="simulation">Simulation</li>
					<li id="strategy">Strategy</li>
					<li id="adventure">Adventure</li>
					<li id="sports">Sports</li>
					<li id="racing">Racing</li>
					<li id="casual">Casual</li>
					<li id="indi">INDI</li>
					<li id="etc">MMO/ETC</li>
				</ul>
				<p>COMMUNICATE</p>
				<ul>
					<li id="noticeList">공지사항</li>
					<li id="qnaList">FAQ</li>
				</ul>
			</div>

			<div id="game_list">

				<h3>추천 게임</h3>
				<div id="main_first_div">
					<button id="before">◁</button>
					<button id="next">▷</button>
					<div id="main_first_screen">
						<div id="main_first">
							<!-- best game -->
						</div>
					</div>
				</div>
				<h3>신작 게임</h3>
				<div id="main_second_div">	
					<button id="new_before">◁</button>			
					<button id="new_next">▷</button>
					<div id="main_second_screen">						
						<div id="main_second">
							<!-- new game -->
						</div>
					</div>
				</div>
				<h3>할인 게임</h3>
				<div id="main_third">
					<button id="pack_1">초특가</button>
					<button id="pack_2">인기</button>
					<button id="pack_3">출시예정 게임</button>
					<button id="pack_4">패키지</button>
					<!-- category discount game -->
					<div id="sub_cate">
						<div id="sub_first">
							<c:forEach items="${pro_list_sub_discount}" var="discount" varStatus="status">
							<div onmouseover="mouse(${status.index})">
								<table>
								<tr>
									<td colspan="2">
										<div class="discount_sub_img">						
											<img src="resources/upload/${pro_main_img_sub_discount[status.index].file_name}">
										</div>
									<div class="discount_sub_contents" onclick="location.href='product/pro_view?pro_num=${discount.pro_num}'">
										<input type="hidden" id="check_${status.index}" value="${discount.pro_num}"> 
										<span>게임 : </span> ${discount.pro_title} <br>
											${discount.pro_contents}						
									</div>
									</td>
								</tr>
								</table>
							</div>
							</c:forEach>
							<c:forEach items="${pro_list_sub_favor}" var="favor" varStatus="status">
							<div onmouseover="mouse(${status.index})">
								<table>
								<tr>
									<td colspan="2">
										<div class="discount_sub_img">						
											<img src="resources/upload/${pro_main_img_sub_favor[status.index].file_name}">
										</div>
									<div class="discount_sub_contents" onclick="location.href='product/pro_view?pro_num=${favor.pro_num}'">
										<input type="hidden" id="check_${status.index}" value="${favor.pro_num}"> 
										<span>게임 : </span> ${favor.pro_title} <br>
											${favor.pro_contents}						
									</div>
									</td>
								</tr>
								</table>
							</div>
							</c:forEach>
						</div>
						<div id="sub_second">
							<!-- image -->
							<c:forEach items="${pro_img_main}" var="img">
								<div class="sub_secon_img">
									<img src="resources/upload/${img.file_name}">
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div id="main_four">
				<div id="main_menu">
					<span>사용자 메뉴</span>
					<div id="main_notice">
						<div class="main_step1">
							<div class="titi">
								<span>공지사항</span>
							</div>
							<div class="other line">
								<a href="${pageContext.request.contextPath}/notice/noticeList">모두보기</a>
							</div>
						</div>
						<div class="main_step2" id="mainList1">
							<table>
								<c:choose>
									<c:when test="${fn:length(mainList) > 0 }">
										<c:forEach items="${mainList}" var="m">
											<tr>
												<td><a href="notice/noticeView?n_num=${m.n_num}">${m.n_title}</a></td>
												<td>${m.reg_date}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="2" style="text-align: center;">게시된 등록글이
												없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
					</div>
					<div id="main_reply">
						<div class="main_step1">
							<div class="other">
								<button id="chat_open_click">문의하기</button>
							</div>
							<div class="titi line">
								<span>운영자에게 1:1 문의</span>
							</div>
						</div>
						<div class="main_step2">
							<ul>
								<li id="tiit">※ 1:1 문의 유의사항</li>
								<li>1. 전 채팅 내용은 재로그인 시 보이지않습니다.</li>
								<li>(열람을 원하시면 운영자에게 문의부탁드립니다.)</li>
								<li>2. 게임 추가문의도 1:1문의로 부탁드립니다.</li>
								<li>3. 비방 및 욕설을 작성 시 불이익을 당하실 수 있습니다.</li>
								<li>4. 운영시간은 09:00 ~ 20:00 까지 입니다. (일요일 미포함)</li>
								<li>5. 신속한 답변은 되도록 전화상담을 이용해주시기 바랍니다.</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="main_company">
					<div id="main_company_step1"></div>
					<div id="main_company_step2">
						<div id="step2"></div>
					</div>
				</div>
			</div>
			<div id="chat_open">
				<div id="chat_title">
					<h2>실시간 문의창</h2>
				</div>
				<div id="chat_contents">
					<c:import url="/chat/chat" />
				</div>
				<div id="chat_btn">
					<button id="chat_closes">닫기</button>
					<button id="chat_top">위로 올리기</button>
				</div>
			</div>
			<c:import url="/top_btn" />
			<c:import url="/footer" />
		</div>
	</section>


</body>
</html>