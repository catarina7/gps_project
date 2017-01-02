<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/js/jquery/sockjs-0.3.4.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat/chat.css">
<script type="text/javascript">
	var sock = null;
	
	$(document).ready(function(){
		
		sock = new SockJS("<c:url value="/echo"/>");
		sock.onopen = function() {
			sock.send("사용자가 접속했습니다.");
		}
		
		/* 채팅 버튼 */
		$("#sendBtn").click(function(){
			if($("#message").val() != ""){				
				sendMessage();
				$("#message").val("");
				$("#message").focus();
			}else {
				alert("내용을 입력해주세요!");
			}
			$("#data").scrollTop($("#data")[0].scrollHeight);
		});	
		/* 채팅 끄기 버튼 */
		$("#chat_closes").click(function(){
			closeMessage();
		});
		
		/* 전송 메소드 */
		function sendMessage() {
			sock.onmessage = onMessage;
			sock.send($("#message").val());
		};
		/* 닫는 메소드 */
		function closeMessage() {
			sock.onclose = onClose;
			sock.close();
		}
		
		function onMessage(evt) {
			var data = evt.data;
			$("#data").append(data + "<br/>");
		};
		
		function onClose(evt) {
			$("#data").append("상담이 종료되었습니다.");
		};
		
	});
</script>
</head>
<body>
	<div id="chat_form">		
		<div id="data"></div>
		<div id="write">
			<input type="text" id="message">
			<input type="button" id="sendBtn" value="전송">
		</div>
	</div>	
</body>
</html>