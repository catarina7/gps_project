<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/gps/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/package_pro/pack_write.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
				/* input number 부분 숫자 정수로만 제한  */
				$(".pack_price").change(function(){
					if($(this).val() < 0){
						$(".pack_price").val(0);
					}else {
						var discount = $("#pack_discount").val();
						var total_price = ((price*1)/100)*(discount*1);
						total_price = total_price.toFixed(0);
						$("#pack_total").val(total_price);
					}
				});
			
			
			
	});
</script>
</head>
<body>
	<div id="pack_write">
		<form id="frm" action="packMod" method="post">		
			<table>
				<colgroup>
					<col style="width:25%;">
					<col style="width:70%;">
				</colgroup>
				<tr>
					<td class="pack_title">할인률 :</td>
					<td>
						<input type="number" id="pack_discount" name="discount" value="${package_buy.discount }">
					</td>
				</tr>
				<tr>
					<td class="pack_title">가격 :</td>
					<td>
						<input type="number" name="price" id="pack_p" class="pack_price" value="${package_buy.price }">
					</td>
				</tr>
				<tr>
					<td class="pack_title">총 가격 :</td>
					<td>
						<input type="number" id="pack_total" name="total_price" value="${package_buy.total_price }">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>