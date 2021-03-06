package com.game.chat;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	private List<WebSocketSession> connectedUsers;
	
	public EchoHandler() {
		// TODO Auto-generated constructor stub
		connectedUsers = new ArrayList<WebSocketSession>();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		logger.info("{0} 연결됨", session.getId());
		logger.info("연결 IP", session.getRemoteAddress().getHostName());
		connectedUsers.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		logger.info("{0}로 부터 {1} 받음", session.getId(), message.getPayload());
		// 사용자의 메세지
		session.sendMessage(new TextMessage("<p id="+ "\"mine\">"+"나 : "+message.getPayload()+"</p>"));
		
		for (WebSocketSession webSocketSession : connectedUsers){
			//보낸 사용자는 받지 않기 위한 조건문
			if( !session.getId().equals(webSocketSession.getId())){
				webSocketSession.sendMessage(new TextMessage("<p id="+ "\"customer\">"+session.getRemoteAddress().getHostName() + " : " + message.getPayload()+"</p>"));
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		logger.info("{0} 연결 끊김", session.getId());
		connectedUsers.remove(session);
	}
}
