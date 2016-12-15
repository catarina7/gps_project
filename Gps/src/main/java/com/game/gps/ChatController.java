package com.game.gps;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/chat")
public class ChatController {
	
	@RequestMapping(value="/chat")
	public String viewChatPage() {
		return "chat/chat";
	}
}
