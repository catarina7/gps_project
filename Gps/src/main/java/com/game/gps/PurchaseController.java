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
	private PurchaseService purchaseservice;
	
	
	//구매내역
	@RequestMapping(value="/purchase")
	public String purchaseList(){		
		
		
		
		return "/purchase/purchase";
	}
	
	//구매하기 
	@RequestMapping(value="/buy")
	public String buy(CartDTO cartDto, Model model){
		
		try {
			purchaseservice.purchaseList(cartDto, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/purchase/buy";
	}
}
