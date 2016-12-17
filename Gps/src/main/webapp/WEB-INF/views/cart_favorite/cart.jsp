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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/cart_favorite/cart_favorite.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#e_cart").css("background-color","#2b394f");
		/* 체크박스 체크 */
		$(".check_box").prop("checked",true);

	});
	
	//하나만 장바구니 삭제할때 (X표로 삭제할때)
	function one_delete(i){
		var c_num = $("#c_num"+i).val();
		var m_id = $("#m_id"+i).val();
		
		$.ajax({
			url: 'cartDel' ,
			type: 'POST',
			data:{
				c_num : c_num,
				m_id : m_id
			},
			success:function(data){
				data=data.trim();
				$("#second_else").html(data);
			}
		});

	}
	
	
	//checked 된 것만 삭제 할때
	$(document).ready(function(){
		$("#all_delete").on("click", function(){
			var checkArr = [];
			
			$("input[name='c_num']:checked").each(function() {
				checkArr.push($(this).val());
			});
			
			$.ajax({
				url: 'cartDelList' ,
				type: 'POST',
				dataType: 'text',
				data:{
					valueArr : checkArr,
					m_id : $("#check_m_id").val()
				},
				success:function(data){
					data=data.trim();
					$("#second_else").html(data);
				}
			});
			
		});
	});
		
	//하나만 구매하기 
	function one_bye(i){
		var c_num = $("#c_num"+i).val();
		var pro_num = $("#pro_num"+i).val();
		location.href="/gps/purchase/buy?c_num="+c_num+"&pro_num="+pro_num;
	}
	

</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<c:import url="/user_menu_bar" />
		<!-- 내용 넣기 -->
			<div id="else_list">
				<div id="first_else">
					<div id="uu_menu">
						<a id="e_cart" href="${pageContext.request.contextPath}/cart_favorite/cartList?m_id=${member.m_id}">장바구니</a>
						<a id="e_favorite" href="${pageContext.request.contextPath}/favorite/favoriteList?m_id=${member.m_id}">관심상품</a>
						<a id="e_puchase" href="${pageContext.request.contextPath}/purchase/purchase">구매내역</a>
					</div>
				</div>
				
				<!-- 장바구니 리스트 -->
				
				<div id="second_else">
					<c:forEach items="${cart_list}" var="cart" varStatus="status">
						<div class="item">
							<div class="four_contents">
								<div class="f_g_check">
									<input type="hidden" name="m_id" id="check_m_id" value="${member.m_id}">
									<input class="check_box" id="checkbox${status.index}" name="c_num" value="${cDTO[status.index].c_num}" type="checkbox">
									<label for="checkbox${status.index}"></label>
								</div>
								<div class="f_g_img">
									<img src="../resources/upload/${cart_list_img[status.index].file_name}">
								</div>
								<table>
									<colgroup>
										<col style="width:80%;">
										<col style="width:10%;">
										<col style="width:10%;">
									</colgroup>
									<tr>
										<td class="f_g_name">${cart.pro_title}</td>
										<td>
											<span class="window">
												<img src="${pageContext.request.contextPath}/resources/css/cart_favorite/img/icon_platform_win.png">
											</span>
											<span class="mac">
												<img src="${pageContext.request.contextPath}/resources/css/cart_favorite/img/icon_platform_mac.png">
											</span>
										</td>
										<td>
											<input type="hidden" name="c_num" id="c_num${status.index}" value="${cDTO[status.index].c_num}">
											<input type="hidden" name="pro_num" id="pro_num${status.index}" value="${cDTO[status.index].pro_num}">
											<input type="hidden" name="m_id" id="m_id${status.index}" value="${member.m_id}">
											<input class="pro_delete" type="button" value="X" onclick="one_delete(${status.index})">
										</td>
									</tr>
									<tr>
										<td class="f_g_ex" colspan="3">${cart.pro_contents}</td>
									</tr>
								</table>
							</div>
							<div class="tag">
								<ul>
									<li class="discount">-20%</li>
									<li class="price">
										<p class="nomal_p">${cart.price}</p>
										<span>₩ 15000</span>
									</li>
									<li>
										<input type="button" value="구매하러 가기" onclick="one_bye(${status.index})">
									</li>
								</ul>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id="third_else">
					<button>선택 구매</button>
					<button id="all_delete">모두 빼기</button>
				</div>
			</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>