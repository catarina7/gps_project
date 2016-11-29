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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/product/pro_view.css">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
			<!-- 내용 넣기 -->
			<div id="user_menu">				
				<c:import url="/user_menu_bar" />
			</div>
			
			<div id="pro_view">
				<!-- game name -->
				<h3>GAME NAME</h3>
				<!-- main image -->
				<div id="first_pro">
					<div id="main_img">
						<!-- game main image -->
					</div>
				</div>
				<!-- game information -->
				<div id="second_pro">
					<div id="title_img">
						
					</div>
					<div id="game_info">
						
					</div>
					<div id="game_evalution">
						
					</div>
				</div>
				<!-- sub images -->
				<div id="third_pro">
					<button class="sub_btn" id="before"></button>
					<button class="sub_btn" id="next"></button> 
						<ul>
							<li>
								<img src="">
							</li>
							<li>
								<img src="">
							</li>
							<li>
								<img src="">
							</li>
							<li>
								<img src="">
							</li>
							<li>
								<img src="">
							</li>
						</ul>
				</div>
				<!-- product menu -->
				<div id="four_pro">
					<div id="pakage">
						<div class="item">
							<div class="tag">
								
							</div>
							
						</div>
						<div class="item">
							<div class="tag">
								
							</div>
							
						</div>
					</div>
					<div id="relationship">
						<span>연관 추천 게임</span>
						<ul>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</div>
				</div>
				<!-- game software -->
				<div id="five_pro">
					<div id="computer">
						<button>내 사양보기</button>
						<table>
							<colgroup>
								<col style="width: 40%;">
								<col style="width: 60%;">
							</colgroup>
							<tr>
								<td class="com_title" colspan="2">권장 사양</td>
							</tr>
							<tr>
								<td class="com_name">운영체제</td>
								<td></td>
							</tr>
							<tr>
								<td class="com_name">CPU</td>
								<td></td>
							</tr>
							<tr>
								<td class="com_name">메모리(RAM)</td>
								<td></td>
							</tr>
							<tr>
								<td class="com_name">그래픽 카드</td>
								<td></td>
							</tr>
							<tr>
								<td class="com_name">Direct X버전</td>
								<td></td>
							</tr>
							<tr>
								<td class="com_name">하드디스크 <br> 여유공간</td>
								<td></td>
							</tr>
						</table>
					</div>
					<div id="patch">
						<table>
							<colgroup>
								<col style="width:70%;">
								<col style="width:30%;">
							</colgroup>
							<tr>
								<td class="com_title" colspan="2">업데이트 및 패치 파일</td>
							</tr>
							<tr>
								<td class="com_name"></td>
								<td>
									<button>Download</button>
								</td>
							</tr>
							<tr>
								<td class="com_name"></td>
								<td>
									<button>Download</button>
								</td>
							</tr>
							<tr>
								<td class="com_name"></td>
								<td>
									<button>Download</button>
								</td>
							</tr>
							<tr>
								<td class="com_name"></td>
								<td>
									<button>Download</button>
								</td>
							</tr>
						</table>
					</div>
					<button class="five_btn" id="favorite">관심상품</button>
					<button class="five_btn" id="cart">장바구니</button>
				</div>
				<!-- review -->
				<div id="six_pro">
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
	</section>
	
	
	
	
	
	
	
	
	
	
	
	
	<c:import url="/footer" />
	
</body>
</html>