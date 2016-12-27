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
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
			/* input number 부분 숫자 정수로만 제한  */
			$(".pack_price").change(function(){
				if($(this).val() < 0){
					$(".pack_price").val(0);
				}else {
					var price = $("#pack_p").val();
					var millage = ((price*1)/100)*5;
					millage = millage.toFixed(0);
					$("#pack_millage").val(millage);
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
	<form id="frm" action="packWrite" method="post">		
		
		등록상품 : <input type="text" name="pro_num"><br>
		패키지 이름 : <input type="text" name="pack_title"><br>
		패키지 내용 : <textarea id="smarteditor" name="pack_contents"></textarea><br>
		가격 : <input type="number" name="price" id="pack_p" class="pack_price"><br>
		서브 카테고리 : <input type="text" name="sub_category"><br>
		마일리지 : <input type="number" name="millage" id="pack_millage" class="pack_price"><br>
		
		<input type="button" value="만들기" id="savebutton">
	</form>
	
</body>
</html>