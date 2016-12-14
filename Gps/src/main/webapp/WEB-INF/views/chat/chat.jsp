<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/js/jquery/sockjs-0.3.4.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		/* 채팅 버튼 */
		$("#sendBtn").click(function(){
			if($("#message").val() != ""){				
				sendMessage();
			}else {
				alert("내용을 입력해주세요!");
			}
		});	
		/* 채팅 끄기 버튼 */
		$("#closes").click(function(){
			closeMessage();
		});
		
		var sock;
		/* 전송 메소드 */
		function sendMessage() {
			sock = new SockJS("<c:url value="/echo"/>");
			sock.onmessage = onMessage;
			sock.onopen = function() {
				sock.send($("#message").val()+"<br/>");
			};
		};
		/* 닫는 메소드 */
		function closeMessage() {
			sock.onclose = onClose;
			sock.close();
		}
		
		function onMessage(evt) {
			var data = evt.data;
			$("#data").append("나 :" + data + "<br/>");
			$("message").val("");
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
	<input type="button" id="closes" value="나오기">
	<div id="data"></div>
</body>
</html>