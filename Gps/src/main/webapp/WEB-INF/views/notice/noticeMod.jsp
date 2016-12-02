<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 수정</title>
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/templete.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/gps/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<style type="text/css">
	.WriteTable{
		width: 600px;
	}
	
	#Btn{
		text-align: right;
	}
</style>
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
	
		<!-- section -->
			<section>
			<!-- 내용 넣기 -->
	<center>
	<h1>공지사항 수정하기</h1><hr>
	<form action="noticeMod" method="post" id="frm">
		<table class="WriteTable" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td>작성자</td>
				<td>${param.n_writer}</td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td>${param.n_title}</td>
				
			</tr>
			
			<tr>
				<td colspan="2">
					<textarea id="smarteditor" rows="20" cols="60" name="n_contents" >${param.n_contents}</textarea>
				</td>
			</tr>
		</table>
		
		<table class="WriteTable">
			<tr>
				<td colspan="2" id="Btn">
					<input type="hidden" value="${param.n_num}" name="n_num">
					<input type="submit" id="savebutton" value="작성완료">
					<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList';">
				</td>
			</tr>
			
		</table>
	</form>
	</center>
	
	</section>
	
		<c:import url="/footer"/>
</body>
</html>