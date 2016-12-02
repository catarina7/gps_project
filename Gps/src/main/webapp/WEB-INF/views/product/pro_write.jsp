<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="/gps/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/product/pro_write.css">
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
							$("#fileinput")
									.append('<div id="btn'+num+'" class="files_import"><input type="file" name="file" id="btn'+num+'"> <input type="button" id="btn'+num+'" class="butn btn" value="삭제"> <br id="btn'+num+'"></div>');

							//삭제 버튼 클릭 시
							$(".butn").click(function() {
								var n = $(this).attr("id");
								$("#" + n).remove();
								$(this).remove();
							});

						});
		/* file Tag 추가 및 삭제 끝*/
		
		/* input number 부분 숫자 정수로만 제한  */
		$("#p_price").change(function(){
			if($(this).val() < 0){
				$("#p_price").val(0);
			}else {
				var price = $("#p_price").val();
				var millage = ((price*1)/100)*5;
				millage = millage.toFixed(0);
				$("#p_millage").val(millage);
			}
		});
		
		
		$("#p_millage").change(function(){
			if($(this).val() < 0){
				$("#p_millage").val(0);
			}
		});
	})
</script>
</head>

<body>
	<c:import url="/header" />
	<section>
		<c:import url="/user_menu_bar" />
		<div id="pro_w">
		<h2>게임 등록</h2>
			<form action="pro_write" method="post" id="frm" enctype="multipart/form-data">
				<table>
					<colgroup>
						<col style="width:20%;">
						<col style="width:80%;">
					</colgroup>
					<tr>
						<td class="title">게임명</td>
						<td><input type="text" class="pro_in" name="pro_title"></td>
					</tr>
					<tr>
						<td class="title">게임 회사명</td>
						<td><input type="text" class="pro_in" name="company"></td>
					</tr>
					<tr>
						<td class="title">게임설명 :</td>
						<td>
							<div id="pro_textarea">
								<textarea id="smarteditor" name="pro_contents"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td class="title">게임가격</td>
						<td><input type="number" class="pro_in_num" id="p_price" name="price" value="0"></td>
					</tr>
					<tr>
						<td class="title">카테고리</td>
						<td>
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
						<td class="title">하위 카테고리</td>
						<td><input type="text" class="pro_in" name="sub_category"></td>
					</tr>
					<tr>
						<td class="title">마일리지</td>
						<td><input type="number" class="pro_in_num" name="millage" id="p_millage"></td>
					</tr>
					<tr>
						<td class="title">이미지 추가</td>
						<td>
							<div id="files">
								<span class="title">[대표사진등록]</span> <input type="file" name="file">
							</div>
							<span class="title">[세부사진등록]</span> <input type="button" id="imgPlus" class="btn" value="추가하기">
							<div id="fileinput"></div>
						</td>
					</tr>
				</table>
				<div id="pro_w_btn">
					<input type="button" class="btn" id="savebutton" value="글작성">
				</div>
			</form>
		</div>
	</section>
	<c:import url="/footer" />
</body>
</html>