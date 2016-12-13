package com.game.mart;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.game.product.ProductDTO;
import com.game.product.ProductFileDTO;

@Service
public class PurchaseService {
	
	@Autowired
	private PurchaseDAO purchasedao;
	
	
	//구매항목 list
	public void purchaseList(CartDTO cartDto, Model model) throws Exception {
		
		//구매상품 정보 
		ProductDTO proDto = new ProductDTO();		
		proDto = purchasedao.product(cartDto);
		
		//구매 상품 사진 가져오기
		ProductFileDTO pFileDto = new ProductFileDTO();
		pFileDto = purchasedao.profile(cartDto);
		
		model.addAttribute("productOne", proDto);
		model.addAttribute("proFileOne", pFileDto);
		
		
	}

}
