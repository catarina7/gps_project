package com.game.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.game.cd.CD_keyDTO;
import com.game.product.ProductDTO;
import com.game.util.PageMaker;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;
	
	//상품정보관리 리스트
	public void productList(int curPage, int perPage, Model model) throws Exception{
		int totalCount = adminDAO.productCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		List<ProductDTO> prolist = adminDAO.productList(pageMaker);
		
		model.addAttribute("pro_list", prolist);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//상품정보관리 삭제하기
	public void productDelete(int pro_num) throws Exception{
		adminDAO.productDelete(pro_num);
	}
	
	//Cd_key 리스트
	public void cd_keyList(int curPage, int perPage, Model model) throws Exception{
		int totalCount = adminDAO.cd_keyCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		List<CD_keyDTO> cd_key_list = adminDAO.cd_keyList(pageMaker);
		
		model.addAttribute("cd_key_list", cd_key_list);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//cd_key 추가
	public void cd_keyAdd(int curPage, int perPage, Model model, int pro_num, String cd_serial) throws Exception{
		adminDAO.cd_keyAdd(pro_num, cd_serial);
		
		int totalCount = adminDAO.cd_keyCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		List<CD_keyDTO> cd_key_list = adminDAO.cd_keyList(pageMaker);
		
		model.addAttribute("cd_key_list", cd_key_list);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//cd_key 삭제
	public void cd_keyDelete(int curPage, int perPage, Model model, int cd_num) throws Exception{
		adminDAO.cd_keyDelete(cd_num);
		
		int totalCount = adminDAO.cd_keyCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		List<CD_keyDTO> cd_key_list = adminDAO.cd_keyList(pageMaker);
		
		model.addAttribute("cd_key_list", cd_key_list);
		model.addAttribute("pageMaker", pageMaker);
	}
}
