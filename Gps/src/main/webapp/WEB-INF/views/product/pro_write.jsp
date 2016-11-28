<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/gps/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	
	/* 1. smarteditor 시작 */
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/gps/resources/SE2/SmartEditor2Skin.html", 
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
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    });
    /* smarteditor 끝 */
    
    /* 2. file Tag 추가 및 삭제 시작*/
    var num=0;
    $("#imgPlus").click(function(){
		if(num>=0){
			num=num*1+1;
		}
		//file Tag 생성
		$("#fileinput").append('<input type="file" name="file" id="btn'+num+'"> <input type="button" id="btn'+num+'" class="butn" value="삭제"> <br id="btn'+num+'">');
		
		//삭제 버튼 클릭 시
		$(".butn").click(function() {
			var n = $(this).attr("id");
			$("#"+n).remove();
			$(this).remove();
		});
		
	});
    /* file Tag 추가 및 삭제 끝*/
})
</script>
</head>

<body>

<h2> Product 글 쓰기 </h2>
<form action="pro_write" method="post" id="frm" enctype="multipart/form-data">
<table>
	<tr>
		<td>게임명</td>
		<td><input type="text" name="pro_title"></td>
	</tr>
	<tr>
		<td>게임 회사명</td>
		<td><input type="text" name="company"></td>
	</tr>
	<tr>
		<td>게임설명 : </td>
		<td><textarea id="smarteditor" name="pro_contents" rows="" cols=""></textarea></td>
	</tr>
	<tr>
		<td>게임가격</td>
		<td><input type="number" name="price"></td>
	</tr>
	<tr>
		<td>카테고리</td>
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
		<td>하위 카테고리</td>
		<td><input type="text" name="sub_category"></td>
	</tr>
	<tr>
		<td>마일리지</td>
		<td><input type="number" name="millage"></td>
	</tr>
	<tr>
		<td>이미지 추가</td>
		<td>
			<input type="button" id="imgPlus" value="추가하기">
			<div id="fileinput"></div>
		</td>
	</tr>
</table>
	<input type="button" id="savebutton" value="글작성">
</form>
</body>
</html>