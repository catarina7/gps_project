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
				
			/* 1. smarteditor 시작 */
			//전역변수선언
			var editor_object = [];
		
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : editor_object,
				elPlaceHolder : "smarteditor",
				sSkinURI : "/gps/resources/SE2/SmartEditor2Skin.html",
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,
				}
			});
		
			//전송버튼 클릭이벤트
			$("#savebutton").click(
					function() {
						//id가 smarteditor인 textarea에 에디터에서 대입
						editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
		
						// 이부분에 에디터 validation 검증
		
						if($(".pack_price").val() < 0){
							$(".pack_price").val(0);
						}else {						
							//폼 submit
							$("#frm").submit();
						}
					});
			/* smarteditor 끝 */
	
			
			
			
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