package com.game.gps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.game.mart.CartService;
import com.game.member.MemberDTO;
import com.game.product.ProductDTO;
import com.game.product.ProductFileDTO;

@Controller
@RequestMapping(value="/cart_favorite")
public class CartController {

	@Autowired
	private CartService cartService;
	
	//카트 추가하기(View에서 장바구니로 추가해줌)
	@RequestMapping(value="/cartAdd")
	public String cartAdd(ProductDTO productDTO, MemberDTO memberDTO){
		try {
			cartService.cartAdd(productDTO, memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "cart_favorite/cart";
	}
	
	//cart 리스트
	@RequestMapping(value="/cartList")
	public String cartList(MemberDTO memberDTO, Model model){
		try {
			cartService.cartList(memberDTO, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "cart_favorite/cart";
	}
}
