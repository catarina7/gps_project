package com.game.mart;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.product.ProductDTO;
import com.game.product.ProductFileDTO;

@Repository
public class PurchaseDAO {
	
	@Autowired
	private SqlSession sqlsession;
	private String namespaceP="PurchaseMapper.";
	
	
	// 구매 목록 가져오기
	
	
	// 구매상품 정보 가져오기
	public ProductDTO product(CartDTO cartDto){
		return sqlsession.selectOne(namespaceP+"productSet", cartDto);				
	}
	
	
	// 구매상품 사진 가져오기
	public ProductFileDTO profile(CartDTO cartDto){
		return sqlsession.selectOne(namespaceP+"Pro_list_img", cartDto);
	}
	
	
	

}
