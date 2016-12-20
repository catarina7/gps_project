package com.game.gps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.mart.CartDTO;
import com.game.mart.CuponDTO;
import com.game.mart.PurchaseService;
import com.game.member.MemberDTO;

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
	
	//상품권 확인
	@RequestMapping(value="/Cupon" , method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> cuponcheck(CuponDTO cupon, Model model){
		int result=0;
		CuponDTO cup = new CuponDTO();
		try {
			cup = purchaseservice.cuponcheck(cupon);
			if(cup != null){
				result = cup.getCup_price();
				//쿠폰 사용 
				cupon.setCup_check(1);
				purchaseservice.cuponMod(cupon);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = 0;
		}		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	
	//상품권 사용취소
		@RequestMapping(value="/CuponDel" , method = RequestMethod.POST, produces="application/json; charset=utf-8")
		@ResponseBody
		public ResponseEntity<Integer> cupondel(CuponDTO cupon, Model model){
			int result=0;
			cupon.setCup_check(0);
			try {
				result = purchaseservice.cuponMod(cupon);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				result = 0;
			}		
			return new ResponseEntity<Integer>(result, HttpStatus.OK);
		}
}
