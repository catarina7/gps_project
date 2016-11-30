<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<style type="text/css">
	.WriteTable{
		width: 400px;
	}
	
	#Btn{
		text-align: right;
	}
</style>
</head>
<body>
	<center>
	<h1>공지사항</h1><hr>
	<form action="noticeWrite" method="post">
		<table class="WriteTable" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td>작성자</td>
				<td><input type="text" readonly="readonly" name="n_writer" value="test" size="50"></td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td><input type="text" name="n_title" size="50"></td>
				
			</tr>
			
			<tr>
				<td colspan="2">
					<textarea rows="20" cols="60" name="n_contents" ></textarea>
				</td>
			</tr>
		</table>
		
		<table class="WriteTable">
			<tr>
				<td colspan="2" id="Btn">
					<input type="submit" value="작성완료">
					<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList';">
				</td>
			</tr>
			
		</table>
	</form>
	</center>
</body>
</html>