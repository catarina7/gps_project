package com.game.package_pro;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PackageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "packageMapper.";
	
	public int packageWrite(PackageDTO packageDTO) throws Exception{
		return sqlSession.insert(namespace+"packAdd", packageDTO);
	}
	
	public int packageMod(PackageDTO packageDTO) throws Exception{
		return sqlSession.update(namespace+"packMod", packageDTO);
	}
	
	public int packageDelete(int pack_num) throws Exception{
		return sqlSession.delete(namespace+"packDelete", pack_num);
	}
	
	public List<PackageDTO> packageList(String sub_category) throws Exception {
		return sqlSession.selectList(namespace+"packList", sub_category);
	}
	
	public List<PackageDTO> packageBuy(int pack_num) throws Exception{
		return sqlSession.selectList(namespace+"packBuy", pack_num);
	}
	
	
}
