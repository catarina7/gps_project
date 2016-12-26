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
	public List<CartDTO> cartNumFind(MemberDTO memberDTO) throws Exception{
		List<CartDTO> ar = sqlSession.selectList(namespace+"cartNumFind", memberDTO);
		return ar;
	}
	
	/*int [] arr = new int[ar.size()];
	for(int j=0; j<ar.size(); j++){
	System.out.println(ar.size());
	arr[j]=ar.get(j).getC_num();
	System.out.println(arr[j]);
	}
	Arrays.sort(arr);*/
	
	//장바구니 글부분
	public ArrayList<ProductDTO> productList(List<CartDTO> ar) throws Exception{
		ArrayList<ProductDTO> ar1=new ArrayList<ProductDTO>();
		
		for(int i=0; i<ar.size();i++){
			int pro_num=ar.get(i).getPro_num();
			ProductDTO  p= sqlSession.selectOne(namespace+"cart_list", pro_num);
			ar1.add(p);
		}
		
		return ar1;
	}
	
	//장바구니 사진부분
	public ArrayList<ProductFileDTO> productListImg(List<CartDTO> ar) throws Exception{
		ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
		
		for(int i=0; i<ar.size();i++){

			int pro_num=ar.get(i).getPro_num();
			ProductFileDTO p = sqlSession.selectOne(namespace+"cart_list_img", pro_num);
			ar1.add(p);
		}
		
		return ar1;
	}
	
	//장바구니 하나만 삭제할때
	public int cartDel(int c_num) throws Exception{
		return sqlSession.delete(namespace+"cart_del", c_num);
	}
	
	//여러개 삭제할때
	public void cartDeleteList(List<Integer> valueArr) throws Exception{	
		Map<String, Object> data = new HashMap<String, Object>();
		for(int i=0;i<valueArr.size();i++){
			data.put("c_num", valueArr.get(i));
			sqlSession.delete(namespace+"cart_del_list", data);
		}
	}
	
	//구매시 카드 삭제
	public int purchaseDel(PurchaseDTO purchase) throws Exception{
		return sqlSession.delete(namespace+"pur_del", purchase);
	}
}
