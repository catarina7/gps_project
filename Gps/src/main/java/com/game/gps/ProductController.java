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

import com.game.computer.Pro_ComputerDTO;
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
	public String productList(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20") int perPage, String top_category, String orderKind, Model model){
		String path="";
		//System.out.println(orderKind);
		//System.out.println("밖"+top_category);
		try {
			if(orderKind == null){
				//System.out.println("안1"+top_category);
				productService.productList(curPage, perPage, top_category, orderKind, model);
				path="product/pro_list";
			}else{
				//System.out.println(orderKind);
				//System.out.println("안2"+top_category);
				productService.productOrderList(curPage, perPage, top_category, orderKind, model);
				path="product/pro_list_product";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return path;

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
		System.out.println(pro_num);
		try {
			productService.productModify(productDTO, pro_num, mr, session);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/product/pro_list";
	}
	
	//pro_mod에서 이미지 삭제할때 check 된거
	@RequestMapping(value="/pro_mod_img_del")
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
		
	//제목 검색
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
	
	
	//인기순으로 뿌리기
	@RequestMapping(value="/pro_main_like")
	public String productMainLike(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="1") int perPage, Model model){
		try {
			productService.productMainLike(curPage, perPage, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/pro_like";
	}
	
	//최신순으로 뿌리기
	@RequestMapping(value="/pro_main_recent")
	public String productMainRecent(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="1") int perPage, Model model){
		try {
			productService.productMainRecent(curPage, perPage, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/pro_recent";
	}
	
	//초특가
	@RequestMapping(value="/pro_sub_discount")
	public String productSubDiscount(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int perPage, Model model){
		try {
			productService.productSubDiscount(curPage, perPage, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/pro_sub_discount";
	}
	
	//인기
	@RequestMapping(value="/pro_sub_favor")
	public String productSubFavor(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int perPage, Model model){
		try {
			productService.productSubFavor(curPage, perPage, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/pro_sub_favor";
	}
	
	@RequestMapping(value="/pro_sub_volume")
	public String productSubVolume(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int perPage, Model model){
		try {
			productService.productSubVolume(curPage, perPage, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/pro_sub_volume";
	}
	
	//이미지 4개뿌리기
	@RequestMapping(value="/pro_view_img_main")
	public String productViewImgMain(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="1") int perPage, @RequestParam("pro_num") int pro_num, Model model){
		try {
			productService.productViewImgMain(curPage, perPage, pro_num, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/pro_view_img";
	}
	
	//pc사양 넣기
	@RequestMapping(value="/product_computer")
	public String productComputer(Pro_ComputerDTO pro_ComputerDTO, int pro_num, Model model){
		productService.productComputer(pro_ComputerDTO, pro_num);
		return "product/pro_computer";
	}
	
	//최근본 상품 넣기
	@RequestMapping(value="/fav_product")
	public String fav_product(){
		return "product/fav_product";
	}
	
	//최근 본 상품 뿌리기
	@RequestMapping(value="/fav_list")
	public String fav_list(@RequestParam(value="valueArr[]") List<Integer> valueArr, Model model){
		//System.out.println(valueArr);			
		try {
			productService.fav_list(valueArr, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/fav_result";
	}
}
