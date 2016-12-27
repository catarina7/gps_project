package com.game.package_pro;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PackageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "packageMapper.";
	
	//패키지 게임 입력
	public int packageWrite(PackageDTO packageDTO) throws Exception{
		return sqlSession.insert(namespace+"packAdd", packageDTO);
	}
	
	//패키지 게임 수정
	public int packageMod(PackageDTO packageDTO) throws Exception{
		return sqlSession.update(namespace+"packMod", packageDTO);
	}
	
	//패키지 게임 삭제
	public int packageDelete(int pack_num) throws Exception{
		return sqlSession.delete(namespace+"packDelete", pack_num);
	}
	
	//서브 카테고리로 패키지 게임 목록 가져오기
	public ArrayList<PackageDTO> packageList(String sub_category) throws Exception {
		
		ArrayList<PackageDTO> pack = new ArrayList<>();
		List<PackageDTO> packageList = sqlSession.selectList(namespace+"packList", sub_category);
		pack.addAll(packageList);
		
		return pack;
	}
	
	//구매 시 패키지 가져오기
	public PackageDTO packageBuy(int pack_num) throws Exception{
		return sqlSession.selectOne(namespace+"packBuy", pack_num);
	}
	
	
}
