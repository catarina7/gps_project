package com.game.package_pro;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.product.ProductDTO;

@Repository
public class PackageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "PackageMapper.";
	
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
	
	//패키지 전부 가져오기
	public ArrayList<PackageDTO> packAllList() throws Exception{
		ArrayList<PackageDTO> ars = new ArrayList<PackageDTO>();
		List<PackageDTO> list = sqlSession.selectList(namespace+"packAllList");
		ars.addAll(list);
		
		return ars;
	}
	
	//product에서 sub_category 가져오기 
	public String packageSearch(int pro_num) throws Exception{
		return sqlSession.selectOne(namespace+"packSearch", pro_num);
	}
	
	//서브 카테고리로 패키지 게임 목록 가져오기
	public ArrayList<PackageDTO> packageList(String sub_category) throws Exception {
		
		ArrayList<PackageDTO> pack = new ArrayList<PackageDTO>();
		List<PackageDTO> packageList = sqlSession.selectList(namespace+"packList", sub_category);
		pack.addAll(packageList);
		
		return pack;
	}
	
	//구매 시 패키지 가져오기
	public PackageDTO packageBuy(int pack_num) throws Exception{
		return sqlSession.selectOne(namespace+"packBuy", pack_num);
	}
	
	public String packageProduct(int pack_num) throws Exception {
		return sqlSession.selectOne(namespace+"packProduct", pack_num);
	}
	
	//패키지 보기위해 상품정보 모두 가져오기
	public List<ProductDTO> pakage_list() throws Exception{
		return sqlSession.selectList(namespace+"package_list");
	}
}
