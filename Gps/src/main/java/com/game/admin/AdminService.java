package com.game.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
}
