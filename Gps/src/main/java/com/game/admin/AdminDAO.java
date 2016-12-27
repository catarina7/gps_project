package com.game.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.cd.CD_keyDTO;
import com.game.product.ProductDTO;
import com.game.util.PageMaker;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSession sqlSession;
	private String namespace="AdminMapper.";
	
	//상품정보관리 리스트
	public List<ProductDTO> productList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"product_list", pageMaker);
	}
	
	//상품 전체 갯수
	public int productCount() throws Exception{
		return sqlSession.selectOne(namespace+"product_list_count");
	}
	
	//상품관리 삭제하기
	public void productDelete(int pro_num) throws Exception{
		sqlSession.delete(namespace+"product_delete", pro_num);
	}
	
	//*******************************************//
	
	//CD_key 관리 리스트
	public List<CD_keyDTO> cd_keyList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"cd_key_list", pageMaker);
	}
	
	//CD_key 전체 갯수
	public int cd_keyCount() throws Exception{
		return sqlSession.selectOne(namespace+"cd_key_list_count");
	}
	
	//CD_key 추가
	public void cd_keyAdd(int pro_num, String cd_serial) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pro_num", pro_num);
		data.put("cd_serial", cd_serial);
		sqlSession.insert(namespace+"cd_key_add", data);
	}
	
	//CD_key 삭제
	public void cd_keyDelete(int cd_num) throws Exception{
		sqlSession.delete(namespace+"cd_key_delete", cd_num);
	}
}
