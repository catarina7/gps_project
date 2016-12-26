package com.game.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
