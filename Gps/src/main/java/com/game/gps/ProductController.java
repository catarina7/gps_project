package com.game.gps;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String productList(){
		return "product/pro_list";
	}
	
	@RequestMapping(value="/pro_view")
	public String productView(){
		return "product/pro_view";
	}
}
