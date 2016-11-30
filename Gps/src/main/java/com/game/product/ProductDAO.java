package com.game.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.util.PageMaker;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace="ProductMapper.";
	
	//Product_글 작성
	public int productWrite(ProductDTO productDTO, ArrayList<String> fileNames, ArrayList<String> origineNames) throws Exception{
		//일반 글 쓰기
		sqlSession.insert(namespace + "productWrite", productDTO);
		//pro_num 가져오기
		int pro_num= Integer.valueOf(productDTO.getPro_num());

		Map<String, Object> data = new HashMap<>();
		for(int i=0; i<fileNames.size();i++){
			data.put("pro_num", pro_num);
			data.put("file_name", fileNames.get(i));
			data.put("origine", origineNames.get(i));
			sqlSession.insert(namespace+"pro_fileWrite", data);
		}
		return 1;
	}
	
	//Product 글 리스트
	public List<ProductDTO> productList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"pro_list", pageMaker);
	}
	
	//Product 글 전체 갯수 가져오기
	public int productCount() throws Exception{
		return sqlSession.selectOne(namespace+"pro_boardCount");
	}
	
	//product 메인사진
	public ProductFileDTO productImgList(int pro_num) throws Exception{
		return sqlSession.selectOne(namespace+"pro_main_Img", pro_num);
	}
}
