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
	$("#e_favorite").css("background-color","#2b394f");
	/* 체크박스 체크 */
	$(".check_box").prop("checked",true);
});

//하나만 카트에 넣기
function one_cart(i){
	var f_num = $("#f_num"+i).val();
	var pro_num = $("#pro_num"+i).val();
	var m_id = $("#m_id"+i).val();
	
	$.ajax({
		url : 'favorite_cartAdd',
		type : 'POST',
		data :{
			f_num : f_num,
			pro_num : pro_num,
			m_id : m_id
		},
		success:function(data){
			data=data.trim();
			$("#second_else").html(data);
		}
	});
}
//한개만 삭제하기(X표로)
function one_delete(i){
	var f_num = $("#f_num"+i).val();
	var m_id = $("#m_id"+i).val();
	
	$.ajax({
		url : 'favorite_del',
		type : 'POST',
		data:{
			f_num : f_num,
			m_id : m_id
		},
		success:function(data){
			data=data.trim();
			$("#second_else").html(data);
		}
	});
}
//여러개 카트에 넣기(체크된거)
$(document).ready(function(){
	$("#all_cart").on("click", function(){
		var checkArr = [];
		
		$("input[name='f_num']:checked").each(function(){
			checkArr.push($(this).val());
		});
		
		$.ajax({
			url : 'favorite_cartAddList',
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
//여러개 삭제하기(체크된거)
$(document).ready(function(){
	$("#all_delete").on("click", function(){
		var checkArr=[];
		
		$("input[name='f_num']:checked").each(function(){
			checkArr.push($(this).val());
		});
		
		$.ajax({
			url: 'favorite_delList',
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
				<div id="second_else">
				<c:forEach items="${favorite_list}" var="favor" varStatus="status">
					<div class="item">
							<div class="four_contents">
								<div class="f_g_check">
									<input type="hidden" name="m_id" id="check_m_id" value="${member.m_id}">
									<input class="check_box" id="checkbox${status.index}" name="f_num" value="${fDTO[status.index].f_num}" type="checkbox">
									<label for="checkbox${status.index}"></label>
								</div>
								<div class="f_g_img">
									<img src="../resources/upload/${favorite_list_img[status.index].file_name}">
								</div>
								<table>
									<colgroup>
										<col style="width:80%;">
										<col style="width:10%;">
										<col style="width:10%;">
									</colgroup>
									<tr>
										<td class="f_g_name">${favor.pro_title}</td>
										<td>
											<span class="window">
												<img src="${pageContext.request.contextPath}/resources/css/cart_favorite/img/icon_platform_win.png">
											</span>
											<span class="mac">
												<img src="${pageContext.request.contextPath}/resources/css/cart_favorite/img/icon_platform_mac.png">
											</span>
										</td>
										<td>
											<input class="pro_delete" type="button" value="X" onclick="one_delete(${status.index})">
										</td>
									</tr>
									<tr>
										<td class="f_g_ex" colspan="3">${favor.pro_contents }</td>
									</tr>
								</table>
							</div>
							<div class="tag">
								<ul>
									<li class="discount">-${favor.discount}%</li>
									<li class="price">
										<p class="nomal_p">${favor.price}</p>
										<span>${favor.total_price}</span>
									</li>
									<li>
										<input type="hidden" name="f_num" id="f_num${status.index}" value="${fDTO[status.index].f_num}">
										<input type="hidden" name="pro_num" id="pro_num${status.index}" value="${fDTO[status.index].pro_num}">
										<input type="hidden" name="m_id" id="m_id${status.index}" value="${member.m_id}">
										<input type="button" onclick="one_cart(${status.index})" value="장바구니 넣기">
									</li>
								</ul>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id="third_else">
					<button id="all_cart">선택 장바구니 넣기</button>
					<button id="all_delete">모두 빼기</button>
				</div>
			</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>