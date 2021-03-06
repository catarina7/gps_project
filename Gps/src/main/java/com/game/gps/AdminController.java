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
	
	//CD-key 관리 리스트
	@RequestMapping(value="/cd_key_manage", method=RequestMethod.GET)
	public void cd_key_Manage(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20") int perPage, Model model){
		try {
			adminService.cd_keyList(curPage, perPage, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//CD-key 추가
	@RequestMapping(value="/cd_key_add")
	public String cd_key_Add(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20") int perPage, Model model, int pro_num, String cd_serial){
		try {
			adminService.cd_keyAdd(curPage, perPage, model, pro_num, cd_serial);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin/cd_result";
	}
	
	//CD-key 삭제
	@RequestMapping(value="/cd_key_delete")
	public String cd_key_delete(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20") int perPage, Model model, int cd_num){
		try {
			adminService.cd_keyDelete(curPage, perPage, model, cd_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin/cd_result";
	}
	
	//배송정보관리 리스트
	@RequestMapping(value="/send_list",  method=RequestMethod.GET)
	public String send_list(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20") int perPage, Model model){
		try {
			adminService.send_list(curPage, perPage, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin/send_admin";
	}
	
	//CD_KEY 사용안된거 가져오기
	@RequestMapping(value="/cd_key_no")
	public String cd_key_nouse(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20") int perPage, int pro_num , int pm_num, int pur_num, Model model){
		try {
			adminService.cd_key_nouse(curPage, perPage, pro_num, pm_num, pur_num, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin/send_result";

	}
	
	//매출정보관리
	@RequestMapping(value="/sales_list")
	public String sales_list(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20") int perPage, Model model){
		try {
			adminService.sales_list(curPage, perPage, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin/sales_admin";
		}

	//회원정보관리
	@RequestMapping(value="/member_list")
	public String member_list(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20") int perPage, Model model){
		try {
			adminService.member_list(curPage, perPage, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin/member_admin";
	}

	//회원정보 탈퇴
	@RequestMapping(value="/member_delete")
	public String member_delete(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20") int perPage, Model model, int m_num){
		try {
			adminService.member_delete(curPage, perPage, model, m_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin/member_result";
	}
}
