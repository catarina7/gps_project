package com.game.cd;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.game.member.MemberDTO;
import com.game.util.PageMaker;

@Service
public class Product_memberService {

	@Autowired
	private Product_MemberDAO pro_memDao;
	
	//구매정보 입력
	public int pro_meminsert(Product_memberDTO pro_mem) throws Exception{
		return pro_memDao.pro_meminsert(pro_mem);
	}
	
	
	
	
}
