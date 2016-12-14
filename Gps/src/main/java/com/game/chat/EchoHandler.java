package com.game.chat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		logger.info("{0} 연결됨", session.getId());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		logger.info("{0}로 부터 {1} 받음", session.getId(), message.getPayload());
		// text 내용 뿌릴때 사용
		session.sendMessage(new TextMessage("UserID:"+ message.getPayload()));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		logger.info("{0} 연결 끊김", session.getId());
	}
}
