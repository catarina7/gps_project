<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/admin_contents.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/common/img/icons.ico">
<script type="text/javascript">
	$(function(){
		$("#create_package").click(function(){
			$("#create_pack").show();
		});
		
		$("#create_pack").on("click","#pack_close", function(){
			$("#create_pack").hide();
			$("#show_product").hide();
		});
		
		$("#create_pack").on("click","#pack_lis", function(){
			if($("#pack_lis").val() == "상품목록보기"){				
				$("#show_product").show();
				$("#pack_lis").val("상품목록닫기");
			}else{
				$("#show_product").hide();
				$("#pack_lis").val("상품목록보기");
			}
		});
		
		
	});
</script>
</head>
<body>
	<c:import url="/admin_main" />
	<section>
		<div class="admin_product_first">
			<h2>패키지 상품 관리</h2>
			<table>
				<colgroup>
					<col style="width:5%;">
					<col style="width:13%;">
					<col style="width:13%;">
					<col style="width:13%;">
					<col style="width:8%;">
					<col style="width:8%;">
					<col style="width:8%;">
					<col style="width:8%;">
					<col style="width:10%;">
					<col style="width:10%;">
				</colgroup>
				<tr id="title">
					<td>번호</td>
					<td>상품정보</td>
					<td>이름</td>
					<td>내용</td>
					<td>가격</td>
					<td>할인율</td>
					<td>최종가격</td>
					<td>마일리지</td>
					<td>연관카테고리</td>
					<td>수정</td>
				</tr>
				<c:forEach items="${packAllList }" var="allList">
					<tr>
						<td>${allList.pack_num }</td>
						<td>${allList.pro_num }</td>
						<td>${allList.pack_title }</td>
						<td>${allList.pack_contents }</td>
						<td>${allList.price }</td>
						<td>${allList.discount }</td>
						<td>${allList.total_price }</td>
						<td>${allList.millage }</td>
						<td>${allList.sub_category }</td>
						<td>
							<script type="text/javascript">
								$(function(){
									
									/* input number 부분 숫자 정수로만 제한  */
									$(".pack_price").change(function(){
										if($(this).val() < 0){
											$(".pack_price").val(0);
										}else {
											var discount = $("#pack_discount_${allList.pack_num }").val();
											var price = $("#pack_price_${allList.pack_num }").val();
											var total_price = ((price*1)/100)*(100-(discount*1));
											total_price = total_price.toFixed(0);
											$("#pack_total_${allList.pack_num }").val(total_price);
										}
									});
									
									$("#save_btn_${allList.pack_num}").click(function(){
										if($("#save_btn_${allList.pack_num}").val() == "닫기"){										
											$("#total_discount_${allList.pack_num}").hide();
											$("#save_btn_${allList.pack_num}").val("할인");
										}else {
											$("#total_discount_${allList.pack_num}").show();
											$(this).val("닫기");
										}
									});
									
									$("#mod_btn_${allList.pack_num }").click(function(){
										$.ajax({
											url : "packMod",
											data : {
												pack_num : $("#pack_num_${allList.pack_num}").val(),
												total_price : $("#pack_total_${allList.pack_num}").val(),
												discount : $("#pack_discount_${allList.pack_num}").val()
											},
											type : "POST", 
											success: function(result){
												location.href="${pageContext.request.contextPath}/package_pro/packAllList";
											}
										});
									});
								});
							</script>
							<input type="button" id="save_btn_${allList.pack_num }" value="할인">
							<input type="button" onclick="location.href='${pageContext.request.contextPath}/package_pro/packDelete?pack_num=${allList.pack_num }'" value="삭제">
						</td>
					</tr>
					<tr class="total_discount" id="total_discount_${allList.pack_num }">
						<td colspan="3"></td>
						<td colspan="2">
							할인률 : <input class="pack_price" id="pack_discount_${allList.pack_num }" type="number" value="${allList.discount }">
							<input type="hidden" id="pack_num_${allList.pack_num }" value="${allList.pack_num }">
							
						</td>
						<td colspan="3">
							결제 금액 : <input class="pack_price" id="pack_total_${allList.pack_num }" type="number">
							<input type="hidden" id="pack_price_${allList.pack_num }" value="${allList.price }">
						</td>
						<td>
							<input type="button" id="mod_btn_${allList.pack_num }" value="등록">
						</td>
						<td></td>
					</tr>
				</c:forEach>
			</table>
			<div class="first_button">			
				<input type="button" id="create_package" value="패키지 생성">
			</div>
		</div>
			<!-- 패키지 정보 작성 -->
			<div id="create_pack">
				<c:import url="/package_pro/pack_write" />
			</div>
			<div id="show_product">
				<!-- 상뭎 정보 뿌리기 -->
					<table>
						<colgroup>
							<col style="width:18%;">
							<col style="width:78%;">
						</colgroup>
						<tr id="pro_title">
							<td> 상품 번호 </td>
							<td> 상품 이름 </td>
						</tr>
				<c:forEach items="${pro_list}" var="pro_list">
						<tr>
							<td id="pro_titi"> ${pro_list.pro_num} </td>
							<td> ${pro_list.pro_title} </td>
						</tr>
				</c:forEach>
					</table>
			</div>
	</section>
</body>
</html>