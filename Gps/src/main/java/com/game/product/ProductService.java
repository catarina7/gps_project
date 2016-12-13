package com.game.product;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.game.util.PageMaker;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	//Product 글쓰기
	public int productWrite(ProductDTO productDTO, MultipartHttpServletRequest mr, HttpSession session) throws Exception{
		String path = session.getServletContext().getRealPath("resources/upload");
		List<MultipartFile> file = mr.getFiles("file");
		
		//실제 저장된 파일네임
		ArrayList<String> fileNames = new ArrayList<String>();
		//올릴때 파일네임
		ArrayList<String> origineNames=new ArrayList<String>();
		
		for(int i=0;i<file.size();i++){
			MultipartFile mf = file.get(i);
			String fileName = UUID.randomUUID().toString()+"_"+mf.getOriginalFilename();
			String origineName=mf.getOriginalFilename();
			File f = new File(path, fileName);
			//UUID 붙은 File
			mf.transferTo(f);
			
			fileNames.add(fileName);
			origineNames.add(origineName);
		}
		return productDAO.productWrite(productDTO, fileNames, origineNames);
	}
	
	//Product 리스트
	public void productList(int curPage, int perPage, Model model) throws Exception{
		//product 글 갯수 가져오기
		int totalCount=productDAO.productCount();
		PageMaker pageMaker = new PageMaker();
		System.out.println("(service)curPage : " + curPage);
		pageMaker.setCurPage(curPage);
		System.out.println("(service)curPage : " + pageMaker.getCurPage());
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		//System.out.println(pageMaker.getStartRowNum());
		List<ProductDTO> ar = productDAO.productList(pageMaker);
		ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
		
		for(int i=0;i<ar.size();i++){
			productDAO.productImgList(ar.get(i).getPro_num());
			//System.out.println("숫자 :"  + ar.get(i).getPro_num());
			ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
		}
		
		model.addAttribute("pro_list", ar);
		model.addAttribute("pro_main_img", ar1);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//Product 뷰
	public void productView(int curPage, int perPage, int pro_num, Model model) throws Exception{
		int totalCount = productDAO.productViewImgCount(pro_num);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		//productView 일반
		ProductDTO productDTO = productDAO.productView(pro_num);
		//productView 사진들
		List<ProductFileDTO> ar = productDAO.productViewImg(pageMaker, pro_num);
		//productView 대표사진
		ProductFileDTO pro_main = productDAO.productImgList(pro_num);
			
		/*for(int i=0; i<ar.size();i++){
			System.out.println(ar.get(i).getFile_name());
		}*/
		
		model.addAttribute("pageImg", pageMaker);
		model.addAttribute("pro_view", productDTO);
		model.addAttribute("pro_main", pro_main);
		model.addAttribute("pro_img", ar);
	}
	
	//modify 할때 기본적으로 가져오는것들
	public void productMod(int pro_num, Model model) throws Exception{
		//productView 일반
		ProductDTO productDTO = productDAO.productView(pro_num);
		List<ProductFileDTO> modImg = productDAO.productModImg(pro_num);
		model.addAttribute("pro_view", productDTO);
		model.addAttribute("pro_mod_img", modImg);
	}
	
	//modify 할때 넣는것
	public void productModify(ProductDTO productDTO, int pro_num, MultipartHttpServletRequest mr, HttpSession session) throws Exception{
		String path = session.getServletContext().getRealPath("resources/upload");
		List<MultipartFile> file = mr.getFiles("file");
		
		//실제 저장된 파일네임
		ArrayList<String> fileNames = new ArrayList<String>();
		//올릴때 파일네임
		ArrayList<String> origineNames=new ArrayList<String>();
		
		for(int i=0;i<file.size();i++){
			MultipartFile mf = file.get(i);
			String fileName = UUID.randomUUID().toString()+"_"+mf.getOriginalFilename();
			String origineName=mf.getOriginalFilename();
			File f = new File(path, fileName);
			//UUID 붙은 File
			mf.transferTo(f);
			
			fileNames.add(fileName);
			origineNames.add(origineName);
		}
		productDAO.productMod(productDTO);
		productDAO.productModAddImg(pro_num, fileNames, origineNames);
	}
	
	//checked된거 이미지 삭제할때
	public void productModDeleteList(List<Integer> valueArr,int pro_num ,Model model) throws Exception{
		productDAO.productModDeleteList(valueArr);
		
		List<ProductFileDTO> modImg = productDAO.productModImg(pro_num);
		model.addAttribute("pro_mod_img", modImg);
	}
}
