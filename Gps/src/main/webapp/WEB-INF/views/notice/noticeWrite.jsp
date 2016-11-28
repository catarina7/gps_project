<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="noticeWrite" method="post">
		작성자<input type="text" readonly="readonly" name="n_writer" value="test"><br>
		제목<input type="text" name="n_title"><br>
		내용<input type="text" name="n_contents"><br>
		<input type="submit" value="작성완료">
	</form>
</body>
</html>