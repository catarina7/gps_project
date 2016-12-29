package com.game.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.cd.CD_keyDTO;
import com.game.cd.Product_memberDTO;
import com.game.mart.PurchaseDTO;
import com.game.member.MemberDTO;
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
	
	//배송 정보관리 리스트
	public List<Product_memberDTO> send_list(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"send_list", pageMaker);
	}
	
	//배송정보관리 리스트갯수
	public int send_list_count() throws Exception{
		return sqlSession.selectOne(namespace+"send_list_count");
	}
	
	//배송정보관리에서 제목가져오기
	public String send_list_title(int pro_num) throws Exception{
		return sqlSession.selectOne(namespace+"send_list_title", pro_num);
	}
	
	//cd_key 사용안된거 찾기
	public int cd_key_nouse(int pro_num) throws Exception{
		return sqlSession.selectOne(namespace+"cd_key_nouse", pro_num);
	}
	
	//cd_key 가져오기 pm에 담으려고
	public List<CD_keyDTO> cd_key_get(int pro_num) throws Exception{
		return sqlSession.selectList(namespace+"cd_key_get", pro_num);
	}
	
	//cd_key update
	public void cd_key_update(int cd_num) throws Exception{
		sqlSession.update(namespace+"cd_key_update", cd_num);
	}
	
	//product_member에다가 cd_serial 입력하기
	public void pm_update(int pm_num, String cd_serial) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pm_num", pm_num);
		data.put("cd_serial", cd_serial);
		sqlSession.update(namespace+"pm_update", data);
	}
	
	//purchase 대기>>완료
	public List<Product_memberDTO> cd_key_check(int pur_num) throws Exception{
		return sqlSession.selectList(namespace+"cd_key_check", pur_num);
	}
	
	//purchase update
	public void status_change(int pur_num) throws Exception{
		sqlSession.update(namespace+"status_change", pur_num);
	}
	
	//매출정보관리
	public List<PurchaseDTO> sales_list(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"sales_list", pageMaker);
	}
	//매출정보관리 갯수
	public int sales_list_count() throws Exception{
		return sqlSession.selectOne(namespace+"sales_list_count");
	}
	//매출정보관리 총가격
	public int sales_list_total_price() throws Exception{
		return sqlSession.selectOne(namespace+"sales_list_total_price");
	}
	
	//회원정보관리 리스트
	public List<MemberDTO> member_list(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"member_list", pageMaker);
	}
	//회원정보관리 갯수
	public int member_list_count() throws Exception{
		return sqlSession.selectOne(namespace+"member_list_count");
	}
	//회원정보관리 탈퇴
	public void member_delete(int m_num) throws Exception{
		sqlSession.delete(namespace+"member_delete", m_num);
	}
}
