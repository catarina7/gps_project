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
<a href="member/comInfo">comInfo</a>

<a href="notice/noticeList">Notice</a>
<a href="qna/qnaList">QnA</a>
<a href="product/pro_write">product</a>


<a href="member/login">login</a>

<a href="product/pro_list">Product List</a>


<a href="cart_favorite/cartList?m_id=${member.m_id}">cart</a>

<a href="cart">cart</a>


</body>
</html>
