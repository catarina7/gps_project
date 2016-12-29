package com.game.mart;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.member.MemberDTO;
import com.game.product.ProductDTO;
import com.game.product.ProductFileDTO;
import com.game.util.PageMaker;

@Repository
public class PurchaseDAO {
	
	@Autowired
	private SqlSession sqlsession;
	private String namespaceP="PurchaseMapper.";
	
	
	// 구매 확인 목록 가져오기
	public ArrayList<PurchaseDTO> purchaseList(MemberDTO mDto){
		ArrayList<PurchaseDTO> purar = new ArrayList<PurchaseDTO>();
		List<PurchaseDTO> plist = sqlsession.selectList(namespaceP+"purchaseList", mDto);
		purar.addAll(plist);
		return purar;
	}
	
	// 구매 목록 페이징
	public ArrayList<PurchaseDTO> purlist(PageMaker pm, String m_id){
		ArrayList<PurchaseDTO> ar = new ArrayList<PurchaseDTO>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("m_id", m_id);
		data.put("pm", pm);
		List<PurchaseDTO> list = sqlsession.selectList(namespaceP+"purlist", data);
		ar.addAll(list);
		return ar;
	}
	
	
	// 구매상품 정보 가져오기
	public ProductDTO product(CartDTO cartDto){
		return sqlsession.selectOne(namespaceP+"productSet", cartDto);				
	}
	
	
	// 구매상품 사진 가져오기
	public ProductFileDTO profile(CartDTO cartDto){
		return sqlsession.selectOne(namespaceP+"Pro_list_img", cartDto);
	}
	
	
	//상품권 생성하기
	public int makecupon(String cupon) throws Exception{
		return sqlsession.insert(namespaceP+"MakeCupon", cupon);
	}
	
	//상풍권 번호 확인
	public CuponDTO checkcupon(CuponDTO cupon) throws Exception{
		return sqlsession.selectOne(namespaceP+"CheckCupon", cupon);
	}
	
	//사용된 쿠폰 정보 수정
	public int cuponmod(CuponDTO cupon) throws Exception{
		System.out.println(cupon.getCup_check());
		return sqlsession.update(namespaceP+"CuponMod", cupon);
	}
	
	//구매정보 입력
	public int purchasing(PurchaseDTO purchase) throws Exception{
		return sqlsession.insert(namespaceP+"Purchasing", purchase);
	}


	public int purcheck() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespaceP+"Purcheck");
	}

}
