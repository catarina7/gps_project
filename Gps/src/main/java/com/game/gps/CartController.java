package com.game.gps;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.game.mart.CartService;
import com.game.member.MemberDTO;
import com.game.product.ProductDTO;

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
		return "redirect:/cart_favorite/cartList?m_id="+memberDTO.getM_id();
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
	
	//한개씩 삭제할때
	@RequestMapping(value="/cartDel")
	public String cartDelete(MemberDTO memberDTO, Model model, int c_num){
		try {
			cartService.carDel(memberDTO, model, c_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "cart_favorite/cart_delete";
	}
	
	//여러개 삭제할때
	@RequestMapping(value="/cartDelList", method=RequestMethod.POST)
	public String cartDeleteList(@RequestParam(value="valueArr[]") List<Integer> valueArr, MemberDTO memberDTO, Model model){
		for(int i=0;i<valueArr.size();i++){
			System.out.println(valueArr.get(i)); 
		}
		try {
			cartService.cartDeleteList(valueArr, memberDTO, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "cart_favorite/cart_delete";
	}
}
