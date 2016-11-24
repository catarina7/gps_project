package com.game.gps;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	
	@RequestMapping(value="/join")
	public void join(){}
	
	

}
