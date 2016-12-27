package com.game.package_pro;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PackageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "packageMapper.";
	
	
}
