package com.game.gps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.game.mart.CartDTO;
import com.game.mart.PurchaseService;

@Controller
@RequestMapping(value="/purchase")
public class PurchaseController {
	
	@Autowired
	private PurchaseService purService;
	
	@RequestMapping(value="/purchase")
	public String purchase(CartDTO carDto, Model model){
		
		
		
		return "/purchase/purchase";
	}
	
	@RequestMapping(value="/buy")
	public String buy(){
		return "/purchase/buy";
	}
}
