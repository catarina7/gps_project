package com.game.mart;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.game.member.MemberDTO;
import com.game.product.ProductDTO;
import com.game.product.ProductFileDTO;

@Service
public class FavoriteService {
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	//뷰에서 관심상품 추가하기
	public int favoriteAdd(ProductDTO productDTO, MemberDTO memberDTO) throws Exception{
		return favoriteDAO.favoriteAdd(productDTO, memberDTO);
	}
	
	//관심상품 리스트
	public void favoriteList(MemberDTO memberDTO, Model model) throws Exception{
		//내용
		ArrayList<ProductDTO> ar = favoriteDAO.productList(favoriteDAO.favoriteNumFind(memberDTO));
		//대표사진
		ArrayList<ProductFileDTO> ar1 = favoriteDAO.productListImg(favoriteDAO.favoriteNumFind(memberDTO));
		
		List<FavoriteDTO> ar2 = favoriteDAO.favoriteNumFind(memberDTO);
		
		model.addAttribute("favorite_list", ar);
		model.addAttribute("favorite_list_img", ar1);
		model.addAttribute("fDTO", ar2);
	}
	
	
	//하나 카트에 추가하기
	public void favorite_CartAdd(int f_num, int pro_num, MemberDTO memberDTO, Model model) throws Exception{
		favoriteDAO.cartAdd(pro_num, memberDTO.getM_id());
		favoriteDAO.favoriteDel(f_num);
		
		//내용
		ArrayList<ProductDTO> ar = favoriteDAO.productList(favoriteDAO.favoriteNumFind(memberDTO));
		//대표사진
		ArrayList<ProductFileDTO> ar1 = favoriteDAO.productListImg(favoriteDAO.favoriteNumFind(memberDTO));
		
		List<FavoriteDTO> ar2 = favoriteDAO.favoriteNumFind(memberDTO);
		
		model.addAttribute("favorite_list", ar);
		model.addAttribute("favorite_list_img", ar1);
		model.addAttribute("fDTO", ar2);
	}
	//하나만 삭제할때
	public void favorite_DelOne(int f_num, MemberDTO memberDTO, Model model) throws Exception{
		favoriteDAO.favoriteDel(f_num);
		//내용
		ArrayList<ProductDTO> ar = favoriteDAO.productList(favoriteDAO.favoriteNumFind(memberDTO));
		//대표사진
		ArrayList<ProductFileDTO> ar1 = favoriteDAO.productListImg(favoriteDAO.favoriteNumFind(memberDTO));
		
		List<FavoriteDTO> ar2 = favoriteDAO.favoriteNumFind(memberDTO);
		
		model.addAttribute("favorite_list", ar);
		model.addAttribute("favorite_list_img", ar1);
		model.addAttribute("fDTO", ar2);
	}
	
	//여러개 카트에 집어넣을때
	public void favorite_cartAddList(List<Integer> valueArr, MemberDTO memberDTO, Model model) throws Exception{
		favoriteDAO.cartAddList(valueArr, memberDTO.getM_id());
		favoriteDAO.favoriteDelList(valueArr);
		
		//내용
		ArrayList<ProductDTO> ar = favoriteDAO.productList(favoriteDAO.favoriteNumFind(memberDTO));
		//대표사진
		ArrayList<ProductFileDTO> ar1 = favoriteDAO.productListImg(favoriteDAO.favoriteNumFind(memberDTO));
		
		List<FavoriteDTO> ar2 = favoriteDAO.favoriteNumFind(memberDTO);
		
		model.addAttribute("favorite_list", ar);
		model.addAttribute("favorite_list_img", ar1);
		model.addAttribute("fDTO", ar2);
	}
	
	//여러개 삭제할때
	public void favorite_DelList(List<Integer> valueArr, MemberDTO memberDTO, Model model) throws Exception{
		favoriteDAO.favoriteDelList(valueArr);
		
		//내용
		ArrayList<ProductDTO> ar = favoriteDAO.productList(favoriteDAO.favoriteNumFind(memberDTO));
		//대표사진
		ArrayList<ProductFileDTO> ar1 = favoriteDAO.productListImg(favoriteDAO.favoriteNumFind(memberDTO));
			
		List<FavoriteDTO> ar2 = favoriteDAO.favoriteNumFind(memberDTO);
				
		model.addAttribute("favorite_list", ar);
		model.addAttribute("favorite_list_img", ar1);
		model.addAttribute("fDTO", ar2);
	}
}
