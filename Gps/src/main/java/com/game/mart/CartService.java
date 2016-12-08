package com.game.mart;


import java.util.ArrayList;
import java.util.List;

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
		//cart 내용
		ArrayList<ProductDTO> ar = cartDAO.productList(cartDAO.cartNumFind(memberDTO));
		//cart 대표사진
		ArrayList<ProductFileDTO> ar1 = cartDAO.productListImg(cartDAO.cartNumFind(memberDTO));
		//cart DTO
		List<CartDTO> ar2 = cartDAO.cartNumFind(memberDTO);
		
		model.addAttribute("cart_list", ar);
		model.addAttribute("cart_list_img", ar1);
		model.addAttribute("cDTO", ar2);
	}
	
	//장바구니 하나만 삭제할때
	public int carDel(MemberDTO memberDTO, Model model, int c_num) throws Exception{
		cartDAO.cartDel(c_num);
		ArrayList<ProductDTO> ar = cartDAO.productList(cartDAO.cartNumFind(memberDTO));
		ArrayList<ProductFileDTO> ar1 = cartDAO.productListImg(cartDAO.cartNumFind(memberDTO));
		List<CartDTO> ar2 = cartDAO.cartNumFind(memberDTO);
		
		model.addAttribute("cart_list", ar);
		model.addAttribute("cart_list_img", ar1);
		model.addAttribute("cDTO", ar2);
		
		return cartDAO.cartDel(c_num);
	}
	
	//여러개 삭제할때
	public void cartDeleteList(List<Integer> valueArr, MemberDTO memberDTO, Model model) throws Exception{
		cartDAO.cartDeleteList(valueArr);
		
		ArrayList<ProductDTO> ar = cartDAO.productList(cartDAO.cartNumFind(memberDTO));
		ArrayList<ProductFileDTO> ar1 = cartDAO.productListImg(cartDAO.cartNumFind(memberDTO));
		List<CartDTO> ar2 = cartDAO.cartNumFind(memberDTO);
		
		model.addAttribute("cart_list", ar);
		model.addAttribute("cart_list_img", ar1);
		model.addAttribute("cDTO", ar2);
	}
}
