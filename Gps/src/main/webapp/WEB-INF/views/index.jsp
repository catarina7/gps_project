<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$(window).scroll(function(){
			
		});
		
		$("#pack_1").click(function(){
			$(this).css("background-color","#777777");
			$(this).css("border","2px solid #777777");
			$("#pack_2").css("background-color","#666666");
			$("#pack_3").css("background-color","#666666");
			$("#pack_4").css("background-color","#666666");
			$("#pack_2").css("border","2px solid #666666");
			$("#pack_3").css("border","2px solid #666666");
			$("#pack_4").css("border","2px solid #666666");
		});
		
		$("#pack_2").click(function(){
			$(this).css("background-color","#777777");
			$(this).css("border","2px solid #777777");
			$("#pack_1").css("background-color","#666666");
			$("#pack_3").css("background-color","#666666");
			$("#pack_4").css("background-color","#666666");
			$("#pack_1").css("border","2px solid #666666");
			$("#pack_3").css("border","2px solid #666666");
			$("#pack_4").css("border","2px solid #666666");
		});
		
		$("#pack_3").click(function(){
			$(this).css("background-color","#777777");
			$(this).css("border","2px solid #777777");
			$("#pack_1").css("background-color","#666666");
			$("#pack_2").css("background-color","#666666");
			$("#pack_4").css("background-color","#666666");
			$("#pack_1").css("border","2px solid #666666");
			$("#pack_2").css("border","2px solid #666666");
			$("#pack_4").css("border","2px solid #666666");
		});
		
		$("#pack_4").click(function(){
			$(this).css("background-color","#777777");
			$(this).css("border","2px solid #777777");
			$("#pack_1").css("background-color","#666666");
			$("#pack_2").css("background-color","#666666");
			$("#pack_3").css("background-color","#666666");
			$("#pack_1").css("border","2px solid #666666");
			$("#pack_2").css("border","2px solid #666666");
			$("#pack_3").css("border","2px solid #666666");
		});
	});
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<div id="advertisement">
			
		</div>
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
				<p>GATEGORY</p>
				<ul>
					<li>list</li>
					<li>list</li>
					<li>list</li>
					<li>list</li>
					<li>list</li>
					<li>list</li>
					<li>list</li>
					<li>list</li>
					<li>list</li>
					<li>list</li>
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
					<button>◁</button>
					<table>
						<tr>
							<td rowspan="2">
								<!-- discount -->
								<input type="text" readonly="readonly" class="discount" value="할인률 %">
								<div class="img" onclick="location.href='${pageContext.request.contextPath}/product/pro_view'">
									
								</div>
							</td>
							<td>
								<input type="text" readonly="readonly" class="discount" value="할인률 %">
								<div class="img">
									
								</div>
							</td>
							<td>
								<input type="text" readonly="readonly" class="discount" value="할인률 %">
								<div class="img">
									
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" readonly="readonly" class="discount" value="할인률 %">
								<div class="img">
									
								</div>
							</td>
							<td>
								<input type="text" readonly="readonly" class="discount" value="할인률 %">
								<div class="img">
									
								</div>
							</td>
						</tr>
					</table>
					<button>▷</button>
				</div>
				<h3>신작 게임</h3>
				<div id="main_second">
					<!-- new game -->
					<button>◁</button>
							<div class="product">
								<input type="text" readonly="readonly" class="discount" value="할인률 %">
								<div class="img">
									
								</div>
							</div>
							<div class="product">
								<input type="text" readonly="readonly" class="discount" value="할인률 %">
								<div class="img">
									
								</div>
							</div>
							<div class="product">
								<input type="text" readonly="readonly" class="discount" value="할인률 %">
								<div class="img">
									
								</div>
							</div>
							<div class="product">
								<input type="text" readonly="readonly" class="discount" value="할인률 %">
								<div class="img">
									
								</div>
							</div>
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
								<table>
										<tr>
											<td>
												
											</td>
										</tr>
										<tr>
											<td>
												
											</td>
										</tr>
										<tr>
											<td>
												
											</td>
										</tr>
										<tr>
											<td>
												
											</td>
										</tr>
										<tr>
											<td>
												
											</td>
										</tr>
										<tr>
											<td>
												
											</td>
										</tr>
								</table>
							</div>
							<div id="sub_second">
								<!-- image -->
									<div class="sub_secon_img">
										
									</div>
									<div class="sub_secon_img">
										
									</div>
									<div class="sub_secon_img">
										
									</div>
									<div class="sub_secon_img">
										
									</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>