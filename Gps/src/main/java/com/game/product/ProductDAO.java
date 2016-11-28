package com.game.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace="ProductMapper.";
	
	//Product_글 작성
	public int productWrite(ProductDTO productDTO, ArrayList<String> fileNames) throws Exception{
		//일반 글 쓰기
		sqlSession.insert(namespace + "productWrite", productDTO);
		//pro_num 가져오기
		int pro_num= Integer.valueOf(productDTO.getPro_num());

		Map<String, Object> data = new HashMap<>();
		for(int i=0; i<fileNames.size();i++){
			data.put("pro_num", pro_num);
			data.put("file_name", fileNames.get(i));
			sqlSession.insert(namespace+"pro_fileWrite", data);
		}
		return 1;
	}
	
}
