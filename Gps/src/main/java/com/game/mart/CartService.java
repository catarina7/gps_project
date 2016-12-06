package com.game.mart;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.game.member.MemberDTO;
import com.game.product.ProductDTO;
import com.game.product.ProductFileDTO;

@Service
public class CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	//뷰에서 장바구니 추가하기
	public int cartAdd(ProductDTO productDTO, MemberDTO memberDTO) throws Exception{
		return cartDAO.cartAdd(productDTO, memberDTO);
	}
	
	//장바구니 리스트
	public void cartList(MemberDTO memberDTO, Model model) throws Exception{
		//cart에서 찾은게 완료된거 (pro_num, m_id)
		ArrayList<ProductDTO> ar = cartDAO.productList(cartDAO.cartNumFind(memberDTO));
		ArrayList<ProductFileDTO> ar1 = cartDAO.productListImg(cartDAO.cartNumFind(memberDTO));
		model.addAttribute("cart_list", ar);
		model.addAttribute("cart_list_img", ar1);
	}
}
