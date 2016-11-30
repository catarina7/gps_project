<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="index">main</a>
<a href="member/join">join</a>

<a href="notice/noticeList">Notice</a>
<a href="product/pro_write">product</a>


<a href="member/login">login</a>

</body>
</html>
