package com.game.cd;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Product_MemberDAO {
	
	@Autowired
	private SqlSession sqlsession;
	private String namespace="Cd_keyMapper.";
	

	//구매정보 입력
	public int pro_meminsert(Product_memberDTO pro_mem) throws Exception{
		return sqlsession.insert(namespace+"Purchasing", pro_mem);
	}
	
}
