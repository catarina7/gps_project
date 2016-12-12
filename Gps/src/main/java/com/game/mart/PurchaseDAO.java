package com.game.mart;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.product.ProductDTO;

@Repository
public class PurchaseDAO {
	
	@Autowired
	private SqlSession sqlsession;
	private String namespaceP="PurchaseMapper.";
	private String namespaceC="CartMapper.";
	
	// 구매 목록 가져오기
	public List<CartDTO> purchaseList(CartDTO cartDto) throws Exception {
		return sqlsession.selectList(namespaceP+"cartList", cartDto);
	}
	
	// 구매상품 정보 가져오기
	/*public List<ProductDTO> productList(List<ProductDTO> prolist) throws Exception{
		
		
		
	}*/
	
	// 구매상품 사진 가져오기
	
	
	

}
