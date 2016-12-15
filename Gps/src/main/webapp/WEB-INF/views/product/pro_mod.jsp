<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/gps/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/product/pro_mod.css">
<script type="text/javascript">
	$(function() {
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
	
					if($(".pro_in_num").val() < 0){
						$(".pro_in_num").val(0);
					}else {						
						//폼 submit
						$("#frm").submit();
					}
		});
		/* smarteditor 끝 */
		
		/* 2. file Tag 추가 및 삭제 시작*/
		var num = 0;
		$("#imgPlus").click(function() {
			if (num >= 0) {
				num = num * 1 + 1;
			}
			//file Tag 생성
			$("#fileinput").append('<div id="btn'+num+'" class="files_import"><input type="file" name="file" id="btn'+num+'"> <input type="button" id="btn'+num+'" class="butn btn" value="삭제"> <br id="btn'+num+'"></div>');

			//삭제 버튼 클릭 시
			$(".butn").click(function() {
				var n = $(this).attr("id");
				$("#" + n).remove();
				$(this).remove();
			});

		});
		/* file Tag 추가 및 삭제 끝*/
		
		/* input number 부분 숫자 정수로만 제한  */
		/* 가격,최종가격,마일리지,할인율 시작 */
		$("#calculate").click(function(){
			if($("#p_discount").val()<0){
				$("#p_discount").val(0);
			}else{
				var discount = $("#p_discount").val();
				var price = $("#p_price").val();
				var total_price = (price*1) - ((price*1)*(discount/100));
				total_price = total_price.toFixed(0);
				$("#p_total_price").val(total_price);
				
				if($("#p_total_price").val() < 0){
					$("#p_total_price").val(0);
				}else {
					var total_price = $("#p_total_price").val();
					var millage = ((total_price*1)/100)*5;
					millage = millage.toFixed(0);
					$("#p_millage").val(millage);
				}
			}
		});

		$("#p_millage").change(function(){
			if($(this).val() < 0){
				$("#p_millage").val(0);
			}
		});
		/* 가격,최종가격,마일리지,할인율 끝 */	
	});
	
	$(document).ready(function() {
		$("#img_delete").on("click", function(){
			var checkArr = [];
			
			$("input[name='file_num']:checked").each(function() {
				checkArr.push($(this).val());
			});
			
			$.ajax({
				url: 'pro_mod_img_del',
				type: 'POST',
				dataType: 'text',
				data:{
					valueArr : checkArr,
					pro_num : $("#pro_num").val()
				},
				success:function(data){
					data=data.trim();
					$("#img_delete_div").html(data);
				}
			});
		});
	});
</script>
</head>
<body>
<c:import url="/header" />
<section>
	<div>
		<c:import url="/user_menu_bar" />
	</div>
	<div id="pro_mod_first">
		<h2>게임 상품 수정 </h2>
		<div id="pro_mod_second">
			<form action="pro_mod" method="post" id="frm" enctype="multipart/form-data">
				<table>
					<colgroup>
						<col style="width:20%;">
						<col style="width:66%;">
						<col style="width:10%;">
					</colgroup>
					<tr>
						<td class="mod_titi"> 게임명 : </td>
						<td colspan="2"> <input type="text" name="pro_title" value="${pro_view.pro_title}"> </td>
					</tr>
					<tr>
						<td class="mod_titi"> 게임설명 </td>
						<td colspan="2">
							<div id="pro_textarea">
								<textarea id="smarteditor" name="pro_contents"> ${pro_view.pro_contents} </textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td class="mod_titi"> 할인율 : </td>
						<td colspan="2"> <input type="number" class="pro_in_num" id="p_discount" name="discount" value="${pro_view.discount}"> </td>
					</tr>
					<tr>
						<td class="mod_titi"> 게임가격 : </td>
						<td colspan="2"> 
							<input type="number" class="pro_in_num" id="p_price" name="price" value="${pro_view.price}">
							<input type="button" id="calculate" value="최종가격계산">
						</td>
					</tr>
					<tr>
						<td class="mod_titi"> 최종가격 : </td>
						<td colspan="2"> <input type="number" class="pro_in_num" id="p_total_price" name="total_price" value="${pro_view.total_price }"> </td>
					</tr>
					<tr>
						<td class="title mod_titi"> 마일리지 : </td>
						<td colspan="2"><input type="number" class="pro_in_num" name="millage" id="p_millage" value="${pro_view.millage }"></td>
					</tr>
					<tr>
						<td class="mod_titi"> 카테고리 : </td>
						<td colspan="2">
							<select name="top_category">
								<option value="action">Action</option>
								<option value="rpg">RPG</option>
								<option value="simulation">Simulation</option>
								<option value="strategy">Strategy</option>
								<option value="adventure">Adventure</option>
								<option value="sports">Sports</option>
								<option value="racing">Racing</option>
								<option value="casual">Casual</option>
								<option value="indi">INDI</option>
								<option value="etc">MMO/ETC</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="title mod_titi">하위 카테고리 : </td>
						<td colspan="2"><input type="text" class="pro_in" name="sub_category" value="${pro_view.sub_category}"></td>
					</tr>
					<tr>
						<td class="mod_titi"> 게임회사 : </td>
						<td colspan="2"> <input type="text" name="company" value="${pro_view.company}"> </td>
					</tr>
					<tr>
						<td class="mod_titi"> 이미지 삭제 </td>
						<td colspan="2">
							<div id="img_delete_div">
								<input type="hidden" name="pro_num" id="pro_num" value="${pro_view.pro_num}">
									<c:forEach items="${pro_mod_img}" var="img" varStatus="status">
										<div id="pro_mod_images">
											<input class="check_box" id="checkbox${status.index}" name="file_num" value="${img.file_num}" type="checkbox">
											<input type="hidden" name="file_name" id="img_${status.index}" value="${img.file_name}">
											<label for="checkbox${status.index}"><img src="../resources/upload/${img.file_name}"></label>
										</div>
									</c:forEach>
							</div>
								<input type="button" id="img_delete" value="이미지 삭제">
						</td>
					</tr>
					<tr>
						<td class="mod_titi"> 이미지 추가 </td>
						<td colspan="2"> 
							<span class="title"></span> <input type="button" id="imgPlus" class="btn" value="추가하기">
							<div id="fileinput"></div>
						</td>
					</tr>
				</table>
			</form>
			<input type="button" class="btn" id="savebutton" value="글수정">
		</div>
	</div>
</section>
<c:import url="/footer" />
</body>
</html>