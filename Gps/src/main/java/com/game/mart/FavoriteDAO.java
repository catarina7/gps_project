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
public class FavoriteDAO {

	@Autowired
	private SqlSession sqlSession;
	private String namespace="FavoriteMapper.";
	
	//관심상품 추가하기
	public int favoriteAdd(ProductDTO productDTO, MemberDTO memberDTO) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("m_id", memberDTO.getM_id());
		data.put("pro_num", productDTO.getPro_num());
		return sqlSession.insert(namespace+"favoriteAdd", data);
	}
	
	//m_id로 pro_num 뽑아오기
	public List<FavoriteDTO> favoriteNumFind(MemberDTO memberDTO) throws Exception{
		List<FavoriteDTO> ar = sqlSession.selectList(namespace+"favoriteNumFind", memberDTO);
		return ar;
	}
	
	//관심상품 글부분
	public ArrayList<ProductDTO> productList(List<FavoriteDTO> ar) throws Exception{
		ArrayList<ProductDTO> ar1=new ArrayList<ProductDTO>();
		
		for(int i=0; i<ar.size();i++){
			int pro_num=ar.get(i).getPro_num();
			ProductDTO  p= sqlSession.selectOne(namespace+"favorite_list", pro_num);
			ar1.add(p);
		}	
		return ar1;
	}
	//관심상품 사진부분
	public ArrayList<ProductFileDTO> productListImg(List<FavoriteDTO> ar) throws Exception{
		ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
		
		for(int i=0; i<ar.size();i++){
				int pro_num=ar.get(i).getPro_num();
			ProductFileDTO p = sqlSession.selectOne(namespace+"favorite_list_img", pro_num);
			ar1.add(p);
		}	
		return ar1;
	}
	
	//관심상품 하나만 삭제할때
	public int favoriteDel(int f_num) throws Exception{
		return sqlSession.delete(namespace+"favorite_del", f_num);
	}
	//삭제와 동시에 장바구니에 추가하기
	public int cartAdd(int pro_num, String m_id) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("m_id", m_id);
		data.put("pro_num", pro_num);
		return sqlSession.insert(namespace+"cartAdd", data);
	}
	
	public void favoriteDelList(List<Integer> valueArr) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		for(int i=0; i<valueArr.size();i++){
			data.put("f_num", valueArr.get(i));
			sqlSession.delete(namespace+"favorite_del_list", data);
		}
	}
	
	public void cartAddList(List<Integer> valueArr, String m_id) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> data1 = new HashMap<String, Object>();
		for(int i=0; i<valueArr.size();i++){
			data.put("f_num", valueArr.get(i));
			int pro_num = sqlSession.selectOne(namespace+"cartAdd_f_num", data);
			data1.put("m_id", m_id);
			data1.put("pro_num", pro_num);
			sqlSession.insert(namespace+"cartAdd_list", data1);
		}
	}
}
