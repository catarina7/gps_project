<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery/sockjs-0.3.4.js""></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sendBtn").click(function(){
			sendMessage();
		});	
		
		var sock;
		function sendMessage() {
			sock = new SockJS("<c:url value="/echo"/>");
			sock.onmessage = onMessage;
			sock.onclose = onClose;
			sock.onopen = function() {
				sock.send($("#mesage").val());
			};
		};
		
		function onMessage(evt) {
			var data = evt.data;
			$("#data").append(data);
			sock.close();
		};
		
		function onClose(evt) {
			$("#data").append("연결 끊김");
		};
	});
</script>
</head>
<body>
	<input type="text" id="message">
	<input type="button" id="sendBtn" value="전송">
	<div id="data"></div>
</body>
</html>