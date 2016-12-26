package com.game.gps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.game.admin.AdminService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//상품정보관리 리스트
	@RequestMapping(value="/product_admin")
	public String product_admin_List(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20") int perPage, Model model){
		try {
			adminService.productList(curPage, perPage, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin/product_admin";
	}
	
	//상품정보관리 삭제하기
	@RequestMapping(value="/product_admin_delete")
	public String product_admin_delete(int pro_num){
		try {
			adminService.productDelete(pro_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/admin/product_admin";
	}
	
/*	//CD-key 관리
	@RequestMapping(value="/cd_key_manage", method=RequestMethod.GET)
	public void cd_key_Manage(Model model){
		
	}*/
}
