package com.game.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.game.cd.CD_keyDTO;
import com.game.cd.Product_memberDTO;
import com.game.mart.PurchaseDTO;
import com.game.member.MemberDTO;
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
	
	//배송정보관리 리스트
	public void send_list(int curPage, int perPage, Model model) throws Exception{
		int totalCount = adminDAO.send_list_count();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		//배송정보관리 리스트
		List<Product_memberDTO> send_list = adminDAO.send_list(pageMaker);
		ArrayList<String> title_ar = new ArrayList<String>();
		
		//CD_key 있는지 판별해주기
		ArrayList<Integer> cd_ar = new ArrayList<Integer>();
		for(int i=0;i<send_list.size();i++){
			int cd_key = adminDAO.cd_key_nouse(send_list.get(i).getPro_num());
			cd_ar.add(cd_key);
		}
		
		for(int i=0; i<send_list.size();i++){
			String productDTO = adminDAO.send_list_title(send_list.get(i).getPro_num());
			title_ar.add(productDTO);
		}
		
		model.addAttribute("send_list", send_list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("productDTO", title_ar);
		model.addAttribute("cd_key", cd_ar);
	}
	
	//cd_key 업데이트도 하고 다해줌
	public void cd_key_nouse(int curPage, int perPage, int pro_num, int pm_num, int pur_num , Model model) throws Exception{
		List<CD_keyDTO> cd_ar_get = adminDAO.cd_key_get(pro_num);
		
		String cd_key_serial="";
		int cd_num=0;
		//있는거 이므로 첫번째 CD-Key만 가져온다.
		for(int i=0;i<1;i++){
			cd_key_serial = cd_ar_get.get(i).getCd_serial();
			cd_num = cd_ar_get.get(i).getCd_num();
		}
		//System.out.println(cd_key_serial);
		adminDAO.pm_update(pm_num, cd_key_serial);
		adminDAO.cd_key_update(cd_num);
		
		int totalCount = adminDAO.send_list_count();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		//배송정보관리 리스트
		List<Product_memberDTO> send_list = adminDAO.send_list(pageMaker);
		ArrayList<String> title_ar = new ArrayList<String>();
		
		//CD_key 있는지 판별해주기
		ArrayList<Integer> cd_ar = new ArrayList<Integer>();
		for(int i=0;i<send_list.size();i++){
			int cd_key = adminDAO.cd_key_nouse(send_list.get(i).getPro_num());
			cd_ar.add(cd_key);
		}
		
		for(int i=0; i<send_list.size();i++){
			String productDTO = adminDAO.send_list_title(send_list.get(i).getPro_num());
			title_ar.add(productDTO);
		}
		
		List<Product_memberDTO> cd_check = adminDAO.cd_key_check(pur_num);
		System.out.println(cd_check.size());
		if(cd_check.size()==0){
			adminDAO.status_change(pur_num);
		}
		
		model.addAttribute("send_list", send_list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("productDTO", title_ar);
		model.addAttribute("cd_key", cd_ar);
	}
	
	//매출정보관리
	public void sales_list(int curPage, int perPage, Model model) throws Exception{
		int totalCount = adminDAO.sales_list_count();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		List<PurchaseDTO> sales_list = adminDAO.sales_list(pageMaker);
		
		model.addAttribute("sales_list", sales_list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("total_count", totalCount);
		model.addAttribute("sum_price", adminDAO.sales_list_total_price());
	}
	
	//회원정보관리 
	public void member_list(int curPage, int perPage, Model model) throws Exception{
		int totalCount = adminDAO.member_list_count();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		List<MemberDTO> member_list = adminDAO.member_list(pageMaker);
		
		model.addAttribute("member_list", member_list);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//회원탈퇴
	public void member_delete(int curPage, int perPage, Model model, int m_num) throws Exception{
		adminDAO.member_delete(m_num);
		
		int totalCount = adminDAO.member_list_count();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		List<MemberDTO> member_list = adminDAO.member_list(pageMaker);
		
		model.addAttribute("member_list", member_list);
		model.addAttribute("pageMaker", pageMaker);
	}
}
