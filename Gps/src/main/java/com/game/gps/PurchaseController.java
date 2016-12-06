package com.game.gps;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/purchase")
public class PurchaseController {
	
	@RequestMapping(value="/purchase")
	public String purchase(){
		return "/purchase/purchase";
	}
	
	@RequestMapping(value="/buy")
	public String buy(){
		return "/purchase/buy";
	}
}
