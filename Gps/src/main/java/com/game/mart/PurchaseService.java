package com.game.mart;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.game.product.ProductDTO;

@Service
public class PurchaseService {
	
	@Autowired
	private PurchaseDAO purchasedao;
	
	
	//구매항목 list
	public List<CartDTO> purchaseList(CartDTO cartDto, Model model) throws Exception {
		
		List<CartDTO> cartar = purchasedao.purchaseList(cartDto);
		ProductDTO proDto = new ProductDTO();
		List<ProductDTO> proList = null;
		for(int i=0;i<cartar.size();i++){
			
		}
		
		model.addAttribute("productList", cartar);
		
		return cartar;
		
	}

}
