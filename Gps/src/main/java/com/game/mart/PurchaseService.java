package com.game.mart;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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
	
	//상품권 생성
	public void makecupon() throws Exception{
		
		for(int k=0;k<10;k++){
			String password = "";			
			Random r = new Random();
			Random r2 = new Random();
			for(int j =0;j<5;j++){
				String var = (j>0)?"-":"";
				int r_num = r2.nextInt(2);
				password += var;
				for(int i =0; i<3; i++){
					if(i == r_num){
						int rand = r.nextInt(26)+65;
						password += (char)rand;
					}else{
						int rand = r.nextInt(10);
						password += rand;
					}
				}
			}		
		int result = purchasedao.makecupon(password);
		}
		
	}
	
	 
	//상품권 정보 확인 
	public CuponDTO cuponcheck(CuponDTO cupon) throws Exception {
		return purchasedao.checkcupon(cupon);
	}
	
	//상품권 정보 수정
	public int cuponMod(CuponDTO cupon) throws Exception{
		return purchasedao.cuponmod(cupon);
	}
	
	//구매 정보 입력
	public int purchasing (PurchaseDTO purchase) throws Exception{
		return purchasedao.purchasing(purchase);
	}

}
