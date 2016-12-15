package com.game.gps;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.game.product.ProductDTO;
import com.game.product.ProductService;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/pro_write", method=RequestMethod.GET)
	public void productWrite(){}
	
	@RequestMapping(value="/pro_write", method=RequestMethod.POST)
	public String productWrite(ProductDTO productDTO, MultipartHttpServletRequest mr, HttpSession session){	
		try {
			productService.productWrite(productDTO, mr, session);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/product/pro_list";
	}
	
	@RequestMapping(value="/pro_list")
	public String productList(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20") int perPage, Model model){
		try {
			//System.out.println("(control)curPage : "+ curPage);
			productService.productList(curPage, perPage, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/pro_list";
	}
		
	@RequestMapping(value="/pro_view")
	public String productView(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="1") int perPage, @RequestParam("pro_num") int pro_num, Model model){
		try {
			productService.productView(curPage, perPage, pro_num, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/pro_view";
	}
	
	//get방식 product 수정
	@RequestMapping(value="/pro_mod", method=RequestMethod.GET)
	public void productMod(int pro_num, Model model){
		try {
			productService.productMod(pro_num, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//post방식 product 수정
	@RequestMapping(value="/pro_mod", method=RequestMethod.POST)
	public String productMod(ProductDTO productDTO, int pro_num, MultipartHttpServletRequest mr, HttpSession session, Model model){
		try {
			productService.productModify(productDTO, pro_num, mr, session);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/product/pro_list";
	}
	
	//pro_mod에서 이미지 삭제할때 check 된거
	@RequestMapping(value="/pro_mod_img_del", method=RequestMethod.POST)
	public String productModDeleteList(@RequestParam(value="valueArr[]") List<Integer> valueArr, int pro_num , Model model){
		try {
			productService.productModDeleteList(valueArr, pro_num, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/pro_mod_img";
	}
	
	//product_delete
	@RequestMapping(value="/pro_del")
	public String productDelete(int pro_num){
		try {
			productService.productDelete(pro_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/product/pro_list";
	}
	
	//카테고리별 리스트 뿌리기
	@RequestMapping(value="/pro_list_category")
	public String productCategory(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20") int perPage, String top_category, Model model){
		try {
			productService.productCategory(curPage, perPage, top_category, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/pro_list";
	}
	
	@RequestMapping(value="/pro_list_search")
	public String productSearch(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20") int perPage, String pro_title, Model model){
		try {
			productService.productListSearch(curPage, perPage, pro_title, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/pro_list";
	}
}
