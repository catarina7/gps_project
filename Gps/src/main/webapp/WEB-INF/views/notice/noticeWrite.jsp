<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/board_write.css">
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
});
</script>
</head>
<body>
	
		<c:import url="/header" />
		<section>
		<c:import url="/user_menu_bar"/>
		<div id="board_w">
		<h2 style="text-align: center;">※ 공지사항 ※</h2>
			<form action="noticeWrite" method="post" id="frm">
				<table>
					<colgroup>
						<col style="width:15%;">
						<col style="width:89%;">
					</colgroup>
					<tr>
						<td class="title">작성자 : </td>
						<td><input type="text" class="board_in" name="n_writer" value="${member.m_name}" readonly="readonly" ></td>
					</tr>
					
					<tr>
						<td class="title">제목 : </td>
						<td><input type="text" name="n_title" placeholder="제목을 입력하세요."></td>
					</tr>
					
					<tr>
						<td class="title">내용</td>					
						<td>
							<div id="n_textarea">
								<textarea id="smarteditor" name="n_contents"></textarea>
							</div>
						</td>
					</tr>
					
				</table>
				<div id="board_w_btn">
					<input type="button" value="작성완료" class="btn" id="savebutton">
					<input type="button" class="btn" value="목록" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList';">
				</div>
			</form>
			</div>
	</section>
	<c:import url="/footer" />
</body>
</html>