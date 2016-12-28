package com.game.cd;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.member.MemberDTO;
import com.game.util.PageMaker;

@Repository
public class Product_MemberDAO {
	
	@Autowired
	private SqlSession sqlsession;
	private String namespace="Cd_keyMapper.";
	

	//구매정보 입력
	public int pro_meminsert(Product_memberDTO pro_mem) throws Exception{
		return sqlsession.insert(namespace+"Purchasing", pro_mem);
	}
	
	//구매정보 확인
	public ArrayList<Product_memberDTO> pro_memsearch(MemberDTO mDto) throws Exception{
			ArrayList<Product_memberDTO> prm = new ArrayList<Product_memberDTO>();		
			List<Product_memberDTO> ar = sqlsession.selectList(namespace+"PMSearchList", mDto);
			prm.addAll(ar);
		return prm;
	}
	
	//구매정보 list
	public ArrayList<Product_memberDTO> pro_memlist(MemberDTO mDto, PageMaker pm) throws Exception{
		ArrayList<Product_memberDTO> prm = new ArrayList<>();
		Map<String, Object> data = new HashMap<>();
		data.put("m_id", mDto.getM_id());
		data.put("pm", pm);
		List<Product_memberDTO> ar = sqlsession.selectList(namespace+"PMCheckList", data);
		prm.addAll(ar);
		return prm;
	}
	
}
