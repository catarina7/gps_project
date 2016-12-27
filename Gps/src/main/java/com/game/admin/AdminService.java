package com.game.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.game.cd.CD_keyDTO;
import com.game.mart.PurchaseDTO;
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
		
		//리스트에 뿌릴 pro_num >> String
		ArrayList<String> pro_num_ar = new ArrayList<>();
		int pro_numI;
		//리스트에 뿌릴 pro_num >> Integer
		ArrayList<Integer> pro_num_arI = new ArrayList<>();
		
		//리스트에 뿌릴 m_id
		ArrayList<String> m_id_ar = new ArrayList<>();
		
		//리스트에 뿌릴 Status
		ArrayList<String> status_ar = new ArrayList<>();
		
		//리스트에 뿌릴 pro_title
		ArrayList<String> pro_title_ar = new ArrayList<>();
		
		List<PurchaseDTO> send_list = adminDAO.send_list(pageMaker);
		for(int i=0; i<send_list.size();i++){
			int sizeNum=0;			
			//pro_num String
			String pro_numS = send_list.get(i).getPro_num();
			
			//m_id
			String m_idS= send_list.get(i).getM_id();
			String status_S= send_list.get(i).getStatus();
			
			StringTokenizer st = new StringTokenizer(pro_numS, ":");
			while(st.hasMoreTokens()){
				pro_num_ar.add(st.nextToken());
				sizeNum++;
			}
			//System.out.println(sizeNum);
			for(int j=0;j<sizeNum;j++){
				status_ar.add(status_S);
				m_id_ar.add(m_idS);
			}
		}
		
		//pro_num을 integer로 바꾸기
		for(int i=0;i<pro_num_ar.size();i++){
			//System.out.println(i+"번째 : "+ pro_num_ar.get(i)+" > " + m_id_ar.get(i));
			pro_numI=Integer.parseInt(pro_num_ar.get(i));
			
			pro_num_arI.add(pro_numI);
			System.out.println(pro_num_arI.get(i));
		}
		
		//int인 pro_num으로 제목가져오기
		for(int i=0;i<pro_num_arI.size();i++){
			int s = pro_num_arI.get(i);
			String pro_title = adminDAO.send_list_title(s);
			pro_title_ar.add(pro_title);
		}

		model.addAttribute("pro_num", pro_num_arI);
		model.addAttribute("m_id", m_id_ar);
		model.addAttribute("status_ar", status_ar);
		model.addAttribute("pro_title", pro_title_ar);
	}
}
