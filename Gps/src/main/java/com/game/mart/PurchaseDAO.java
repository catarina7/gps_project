package com.game.mart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.product.ProductDTO;
import com.game.product.ProductFileDTO;

@Repository
public class PurchaseDAO {
	
	@Autowired
	private SqlSession sqlsession;
	private String namespaceP ="PurchaseMapper.";
	private String namespaceC ="CartMapper.";
	
	
	//
	
	//구매 내역 가지고 오기 (상품정보)
	public List<ProductDTO> byeone(List<ProductDTO> pro_ar){
		return sqlsession.selectList(namespaceC+"cart_list", pro_ar);
	}
	
	//구매상품 이미지 가지고오기 
	public List<ProductFileDTO> byeimg(List<ProductDTO> pro_ar){
		return sqlsession.selectOne(namespaceC+"cart_list_img", pro_ar);
	}
	
	
	
	
	
}
