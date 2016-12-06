package com.game.mart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.member.MemberDTO;
import com.game.product.ProductDTO;
import com.game.product.ProductFileDTO;


@Repository
public class CartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace="CartMapper.";
	
	//장바구니 추가하기
	public int cartAdd(ProductDTO productDTO, MemberDTO memberDTO) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("m_id", memberDTO.getM_id());
		data.put("pro_num", productDTO.getPro_num());
		return sqlSession.insert(namespace+"cartAdd", data);
	}
	
	//cart에 m_id로 pro_num 뽑아오기
	public List<CartDTO> cartNumFind(MemberDTO memberDTO){
		List<CartDTO> ar = sqlSession.selectList(namespace+"cartNumFind", memberDTO);
		for(int i=0;i<ar.size();i++){
			System.out.println(ar.get(i).getC_num());
			System.out.println(ar.get(i).getPro_num());
		}
		return ar;
	}
	
	public ArrayList<ProductDTO> productList(List<CartDTO> ar){
		ArrayList<ProductDTO> ar1=new ArrayList<ProductDTO>();
		
		for(int i=0; i<ar.size();i++){
			int pro_num=ar.get(i).getPro_num();
			ProductDTO  p= sqlSession.selectOne(namespace+"cart_list", pro_num);
			ar1.add(p);
		}
		
		return ar1;
	}
	
	public ArrayList<ProductFileDTO> productListImg(List<CartDTO> ar){
		ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
		
		for(int i=0; i<ar.size();i++){
			int pro_num=ar.get(i).getPro_num();
			ProductFileDTO p = sqlSession.selectOne(namespace+"cart_list_img", pro_num);
			ar1.add(p);
		}
		
		return ar1;
	}
}
