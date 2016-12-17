package com.game.gps;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.game.mart.FavoriteService;
import com.game.member.MemberDTO;
import com.game.product.ProductDTO;

@Controller
@RequestMapping(value="/favorite")
public class FavoriteController {
	
	@Autowired
	private FavoriteService favoriteService;
	
	//관심상품에 추가하기
	@RequestMapping(value="/favoriteAdd")
	public String favoriteAdd(ProductDTO productDTO, MemberDTO memberDTO){
		try {
			favoriteService.favoriteAdd(productDTO, memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/favorite/favoriteList?m_id="+memberDTO.getM_id();
	}
	
	//관심상품 리스트
	@RequestMapping(value="/favoriteList")
	public String favoriteList(MemberDTO memberDTO, Model model){
		try {
			favoriteService.favoriteList(memberDTO, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "cart_favorite/favorite";
	}
	
	//한개 삭제하기
	@RequestMapping(value="/favorite_del")
	public String favoriteDelOne(int f_num, MemberDTO memberDTO, Model model){
		try {
			favoriteService.favorite_DelOne(f_num, memberDTO, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "cart_favorite/favorite_cartAdd";
	}
	
	//한개씩 삭제하고 장바구니에 넣기
	@RequestMapping(value="/favorite_cartAdd")
	public String favoriteDelete(int f_num, int pro_num, MemberDTO memberDTO, Model model){
		try {
			favoriteService.favorite_CartAdd(f_num, pro_num, memberDTO, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "cart_favorite/favorite_cartAdd";
	}
	
	//여러개 장바구니에 넣기
	@RequestMapping(value="/favorite_cartAddList")
	public String favorite_CartAddList(@RequestParam(value="valueArr[]") List<Integer> valueArr, MemberDTO memberDTO, Model model){
		try {
			favoriteService.favorite_cartAddList(valueArr, memberDTO, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "cart_favorite/favorite_cartAdd";
	}
	
	//여러개 삭제하기
	@RequestMapping(value="/favorite_delList")
	public String favorite_DelList(@RequestParam(value="valueArr[]") List<Integer> valueArr, MemberDTO memberDTO, Model model){
		try {
			favoriteService.favorite_DelList(valueArr, memberDTO, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "cart_favorite/favorite_cartAdd";
	}
}
