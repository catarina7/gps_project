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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common/index.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common/common.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {

		if ($("#pas_kind").val() == 10) {
			alert("비밀번호 변경을 바로 진행 합니다.");
			location.href = "member/pw_check?category=2";
		}

		$(window).scroll(function() {

		});

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

		$(".img").mouseenter(function() {
			$(this).css("cursor", "pointer");
			$(this).css("border", "2px solid #aaaaaa");
			$(".img").mouseout(function() {
				$(this).css("border", "1px solid #aaaaaa");
			});
		});

		$("#all_list")
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}/product/pro_list";
						});

		//공지사항 불러오기
		$.ajax({
			url : 'mainList',
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
				<p>RECOMMENDED</p>
				<ul>
					<li>list</li>
					<li>list</li>
					<li>list</li>
				</ul>
				<p>BEST/NEW</p>
				<ul>
					<li>list</li>
					<li>list</li>
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
				<p>USER SERVICE</p>
				<ul>
					<li>list</li>
					<li>list</li>
				</ul>
			</div>

			<div id="game_list">

				<h3>추천 게임</h3>
				<div id="main_first">
					<!-- best game -->
					<!-- <button id="before">◁</button> -->

					<c:forEach items="${pro_list}" var="pro_list" varStatus="status">
						<div class="product">
							<input type="text" readonly="readonly" class="discount"	value="${pro_list.discount} %">
							<div class="img">
								<img src="resources/upload/${pro_main_img[status.index].file_name }">
							</div>
						</div>
					</c:forEach>
					
					<!-- <button id="next">▷</button> -->
				</div>
				<h3>신작 게임</h3>
				<div id="main_second">
					<!-- new game -->
					<button>◁</button>
					<c:forEach items="${pro_list_recent}" var="pro_list" varStatus="status">
					<div class="product">
						<input type="text" readonly="readonly" class="discount"
							value="${pro_list.discount}%">
						<div class="img">
							<img src="resources/upload/${pro_main_img_recent[status.index].file_name }">
						</div>
					</div>
					</c:forEach>
					<button>▷</button>
				</div>
				<h3>할인 게임</h3>
				<div id="main_third">
					<button id="pack_1">초특가</button>
					<button id="pack_2">인기</button>
					<button id="pack_3">예약</button>
					<button id="pack_4">패키지</button>
					<!-- category discount game -->
					<div id="sub_cate">
						<div id="sub_first">
							<c:forEach items="${pro_list_sub_discount}" var="discount" varStatus="status">
								<div onmouseover="mouse(${status.index})">
								<table>
								<tr>
									<td><img src="resources/upload/${pro_main_img_sub_discount[status.index].file_name}" > </td>
									<td>
										<input type="hidden" id="check_${status.index}" value="${discount.pro_num}">
										제목: ${discount.pro_title} <br>
										내용: ${discount.pro_contents}
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
												<td><a href="noticeView?n_num=${m.n_num}">${m.n_title}</a></td>
												<td>${m.reg_date}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" style="text-align: center;">게시된 등록글이
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
			<c:import url="/footer" />
		</div>
	</section>


</body>
</html>