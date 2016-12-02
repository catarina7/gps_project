<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/product/pro_view.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#my_pc_btn").click(function(){
			if($(this).html() == "내 사양보기"){
				$(this).html("내 사양닫기");
			}else {
				$(this).html("내 사양보기");
			}
			$("#my_pc").toggle();
		});
	});
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
			<h3>${pro_view.pro_title}</h3>
			<!-- main image -->
			<div id="first_pro">
				<div id="main_img" class="w3-content">
					<!-- game main image -->
					<c:forEach items="${pro_img}" var="img">
						<img class="mySlides" src="../resources/upload/${img.file_name}">
					</c:forEach>
				</div>
			</div>
			<!-- game information -->
			<div id="second_pro">
				<div id="title_img">
					<img src="../resources/upload/${pro_main.file_name}">
				</div>
				<div id="game_info">${pro_view.pro_contents}</div>
				<div id="game_evalution"></div>
			</div>
			<!-- sub images -->
			<div id="third_pro">
				<button class="sub_btn" id="before"></button>
				<button class="sub_btn" id="next"></button>
				<ul>
					<c:forEach items="${pro_img}" var="img" varStatus="status">
						<li><img
							class="demo w3-opacity w3-hover-opacity-off"
							src="../resources/upload/${img.file_name}"
							onclick="currentDiv(${status.index+1})">
						</li>
					</c:forEach>
				</ul>
			</div>
			<script type="text/javascript">
				var slideIndex = 1;
				showDivs(slideIndex);
				
				function plusDivs(n) {
				  showDivs(slideIndex += n);
				}
				
				function currentDiv(n) {
				  showDivs(slideIndex = n);
				}
				
				function showDivs(n) {
					  var i;
					  var x = document.getElementsByClassName("mySlides");
					  var dots = document.getElementsByClassName("demo");
					  if (n > x.length) {slideIndex = 1}
					  if (n < 1) {slideIndex = x.length}
					  for (i = 0; i < x.length; i++) {
					     x[i].style.display = "none";
					  }
					  for (i = 0; i < dots.length; i++) {
					     dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
					  }
					  x[slideIndex-1].style.display = "block";
					  dots[slideIndex-1].className += " w3-opacity-off";
					}
			</script>
			<!-- product menu -->
			<div id="four_pro">
				<div id="pakage">
					<div class="item">
						<div class="four_contents">
							<table>
								<colgroup>
									<col style="width: 450px;">
									<col style="width: 100px;">
								</colgroup>
								<tr>
									<td class="f_g_name">GAME PAKAGE NAME</td>
									<td></td>
								</tr>
								<tr>
									<td class="f_g_ex" colspan="2">game explanation</td>
								</tr>
							</table>
						</div>
						<div class="tag">
							<ul>
								<li class="discount">-20%</li>
								<li class="price">
									<p class="nomal_p">₩ ${pro_view.price}</p> <span>₩ 15000</span>
								</li>
								<li><input type="button" value="장바구니 담기"></li>
							</ul>
						</div>
					</div>
					<div class="item">
						<div class="four_contents">
							<table>
								<colgroup>
									<col style="width: 450px;">
									<col style="width: 100px;">
								</colgroup>
								<tr>
									<td class="f_g_name">GAME PAKAGE NAME</td>
									<td></td>
								</tr>
								<tr>
									<td class="f_g_ex" colspan="2">game explanation</td>
								</tr>
							</table>
						</div>
						<div class="tag">
							<ul>
								<li class="discount">할인률</li>
								<li class="price">
									<p class="nomal_p">기존 가격</p> <span>판매 가격</span>
								</li>
								<li><input type="button" value="장바구니 담기"></li>
							</ul>
						</div>
					</div>
					<div class="item">
						<div class="four_contents">
							<table>
								<colgroup>
									<col style="width: 450px;">
									<col style="width: 100px;">
								</colgroup>
								<tr>
									<td class="f_g_name">GAME PAKAGE NAME</td>
									<td></td>
								</tr>
								<tr>
									<td class="f_g_ex" colspan="2">game explanation</td>
								</tr>
							</table>
						</div>
						<div class="tag">
							<ul>
								<li class="discount">-50%</li>
								<li class="price">
									<p class="nomal_p">₩ 20000000</p> <span>₩ 10000000</span>
								</li>
								<li><input type="button" value="장바구니 담기"></li>
							</ul>
						</div>
					</div>
				</div>
				<div id="relationship">
					<span>연관 추천 게임</span>
					<ul>
						<li>
							<dl>
								<dt></dt>
								<dd class="rel_name">게임 이름</dd>
								<dd>가격</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt></dt>
								<dd class="rel_name">게임 이름</dd>
								<dd>가격</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt></dt>
								<dd class="rel_name">게임 이름</dd>
								<dd>가격</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt></dt>
								<dd class="rel_name">게임 이름</dd>
								<dd>가격</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt></dt>
								<dd class="rel_name">게임 이름</dd>
								<dd>가격</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
			<!-- game software -->
			<div id="five_pro">
				<div id="computer">
					<button id="my_pc_btn">내 사양보기</button>
					<div id="my_pc">
						<table>
							<colgroup>
								<col style="width: 40%;">
								<col style="width: 60%;">
							</colgroup>
							<tr>
								<td class="com_title" colspan="2">내 사양</td>
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
								<td class="com_name">하드디스크 <br> 여유공간
								</td>
								<td></td>
							</tr>
						</table>
					</div>
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
							<td class="com_name">하드디스크 <br> 여유공간
							</td>
							<td></td>
						</tr>
					</table>
				</div>
				<div id="patch">
					<table>
						<colgroup>
							<col style="width: 70%;">
							<col style="width: 30%;">
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
				<div id="pro_grade"></div>
				<div id="reply_write">
					<div class="re_title">
						<span>의견 쓰기</span> <span id="review_count">0</span>
					</div>
					<div class="re_contents">
						<div class="re_user">user name</div>
						<textarea></textarea>
					</div>
					<div class="re_sub">
						<button id="save">등록</button>
					</div>
				</div>
				<div id="reply_contents">
					<div class="re_title"></div>
					<div class="re_contents">
						<div class="re_user">user name</div>
						<textarea readonly="readonly"></textarea>
					</div>
					<div class="re_sub"></div>
				</div>
			</div>
		</div>
	</section>












	<c:import url="/footer" />

</body>
</html>