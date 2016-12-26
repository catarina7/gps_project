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

import com.game.computer.Pro_ComputerDTO;
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
	public void productList(int curPage, int perPage, String top_category, String orderKind ,Model model) throws Exception{
		//1. 전체 리스트 뿌리기(일반)
		if(top_category==null){
			//product 글 갯수 가져오기
			int totalCount=productDAO.productCount();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCurPage(curPage);
			pageMaker.setPerPage(perPage);
			pageMaker.makeRow();
			pageMaker.makePage(totalCount);

			List<ProductDTO> ar = productDAO.productList(pageMaker);
			ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();

			for(int i=0;i<ar.size();i++){
				productDAO.productImgList(ar.get(i).getPro_num());
				ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
			}

			model.addAttribute("pro_list", ar);
			model.addAttribute("pro_main_img", ar1);
			model.addAttribute("pageMaker", pageMaker);
		}else{
			//카테고리가 있을때
			//PageMaker
			int totalCount = productDAO.productCountCategory(top_category);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCurPage(curPage);
			pageMaker.setPerPage(perPage);
			pageMaker.makeRow();
			pageMaker.makePage(totalCount);

			//일반 내용 리스트(카테고리별)
			List<ProductDTO> ar = productDAO.productListCategory(pageMaker, top_category);
			//이미지 담을거 새로 만듬
			ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
			for(int i=0;i<ar.size();i++){
				productDAO.productImgList(ar.get(i).getPro_num());
				ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
			}
			model.addAttribute("pro_list", ar);
			model.addAttribute("pro_main_img", ar1);
			model.addAttribute("pageMaker", pageMaker);
		}
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
		List<PatchDTO> patch = productDAO.productViewPatch(pro_num);
		
		int score_total=0;
		int score_avg=0;
		List<ReplyDTO> score = productDAO.scored(pro_num);
		for(int i=0; i<score.size();i++){
			score_total = score_total + score.get(i).getR_score();
			score_avg=score_total/score.size();
		}
		//평점가져오기
		productDAO.total_score(pro_num, score_avg);
		//컴퓨터 사양 가져오기
		Pro_ComputerDTO pro_ComputerDTO = productDAO.productComputerSelect(pro_num);
		//연관 검색 가져오기
		List<ProductDTO> mapping = productDAO.mappingCategory(pro_num, pageMaker);
		
		ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
		for(int i=0;i<mapping.size();i++){
			System.out.println(mapping.get(i).getPro_num());
			int mapping_num=mapping.get(i).getPro_num();
			productDAO.productImgList(mapping_num);
			ar1.add(productDAO.productImgList(mapping_num));
			
		}
		
		model.addAttribute("computer", pro_ComputerDTO);
		model.addAttribute("pageImg", pageMaker);
		model.addAttribute("pro_view", productDTO);
		model.addAttribute("pro_main", pro_main);
		model.addAttribute("pro_img", ar);
		model.addAttribute("pro_patch", patch);
		model.addAttribute("score_avg", score_avg);
	
		int replyCount = productDAO.replyCount(pro_num);
		model.addAttribute("reply_count1", replyCount);
		
		model.addAttribute("mapping", mapping);
		model.addAttribute("mapping_img", ar1);
		
	}

	//modify 할때 기본적으로 가져오는것들
	public void productMod(int pro_num, Model model) throws Exception{
		//productView 일반
		ProductDTO productDTO = productDAO.productView(pro_num);
		List<ProductFileDTO> modImg = productDAO.productModImg(pro_num);
		Pro_ComputerDTO pro_ComputerDTO = productDAO.productComputerSelect(pro_num);
		model.addAttribute("computer", pro_ComputerDTO);
		model.addAttribute("pro_view", productDTO);
		model.addAttribute("pro_mod_img", modImg);
	}

	//modify 할때 넣는것
	public void productModify(ProductDTO productDTO, int pro_num, MultipartHttpServletRequest mr, HttpSession session) throws Exception{
		String path = session.getServletContext().getRealPath("resources/upload");
		//이미지
		List<MultipartFile> file = mr.getFiles("file");
		List<MultipartFile> patch = mr.getFiles("patches");
		
	
		//실제 저장된 파일네임
		ArrayList<String> fileNames = new ArrayList<String>();
		//올릴때 파일네임
		ArrayList<String> origineNames=new ArrayList<String>();

		//패치파일 올릴때 네임
		ArrayList<String> patchNames = new ArrayList<String>();
		ArrayList<String> originePatchesNames = new ArrayList<String>();
		
		//이미지
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

		//패치파일
		for(int i=0;i<patch.size();i++){
			MultipartFile mf = patch.get(i);
			String patchName= UUID.randomUUID().toString()+"_"+mf.getOriginalFilename();
			String originePatchName = mf.getOriginalFilename();
			File f = new File(path, patchName);
			mf.transferTo(f);
			patchNames.add(patchName);
			originePatchesNames.add(originePatchName);
			System.out.println(patchName);
		}
		
		
		productDAO.productMod(productDTO);
		productDAO.productModAddImg(pro_num, fileNames, origineNames);
		productDAO.productModAddPatch(pro_num, patchNames, originePatchesNames);
	}

	//checked된거 이미지 삭제할때
	public void productModDeleteList(List<Integer> valueArr,int pro_num ,Model model) throws Exception{
		productDAO.productModDeleteList(valueArr);

		List<ProductFileDTO> modImg = productDAO.productModImg(pro_num);
		model.addAttribute("pro_mod_img", modImg);
	}

	//product 삭제
	public int productDelete(int pro_num) throws Exception{
		return productDAO.productDelete(pro_num);
	}

	//검색시 리스트
	public void productListSearch(int curPage, int perPage, String pro_title, Model model) throws Exception{
		//pageMaker
		int totalCount = productDAO.productCountSearch(pro_title);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);

		//일반 내용 리스트(카테고리별)
		List<ProductDTO> ar = productDAO.productListSearch(pageMaker, pro_title);
		//이미지 담을거 새로 만듬
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

	//분류별 리스트
	public void productOrderList(int curPage, int perPage, String top_category, String orderKind,  Model model) throws Exception{
		//카테고리 없을때 (전체 상품)
		if(top_category==null){
			//product 글 갯수 가져오기
			int totalCount=productDAO.productCount();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCurPage(curPage);
			pageMaker.setPerPage(perPage);
			pageMaker.makeRow();
			pageMaker.makePage(totalCount);

			if(orderKind.equals("recent")){
				//최신순
				List<ProductDTO> ar = productDAO.productListRecent(pageMaker);
				ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
				for(int i=0;i<ar.size();i++){
					productDAO.productImgList(ar.get(i).getPro_num());
					ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
				}
				model.addAttribute("pro_list", ar);
				model.addAttribute("pro_main_img", ar1);
				model.addAttribute("pageMaker", pageMaker);
			}else if(orderKind.equals("name")){
				//이름순
				List<ProductDTO> ar = productDAO.productListName(pageMaker);
				ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
				for(int i=0;i<ar.size();i++){
					productDAO.productImgList(ar.get(i).getPro_num());
					ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
				}
				model.addAttribute("pro_list", ar);
				model.addAttribute("pro_main_img", ar1);
				model.addAttribute("pageMaker", pageMaker);
			}else if(orderKind.equals("score")){
				//평점순
				List<ProductDTO> ar = productDAO.productListScore(pageMaker);
				ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
				for(int i=0;i<ar.size();i++){
					productDAO.productImgList(ar.get(i).getPro_num());
					ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
				}
				model.addAttribute("pro_list", ar);
				model.addAttribute("pro_main_img", ar1);
				model.addAttribute("pageMaker", pageMaker);
			}else if(orderKind.equals("high")){
				//높은 가격순
				List<ProductDTO> ar = productDAO.productListHigh(pageMaker);
				ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
				for(int i=0;i<ar.size();i++){
					productDAO.productImgList(ar.get(i).getPro_num());
					ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
				}
				model.addAttribute("pro_list", ar);
				model.addAttribute("pro_main_img", ar1);
				model.addAttribute("pageMaker", pageMaker);
			}else if(orderKind.equals("low")){
				//낮은 가격순
				List<ProductDTO> ar = productDAO.productListLow(pageMaker);
				ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
				for(int i=0;i<ar.size();i++){
					productDAO.productImgList(ar.get(i).getPro_num());
					ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
				}
				model.addAttribute("pro_list", ar);
				model.addAttribute("pro_main_img", ar1);
				model.addAttribute("pageMaker", pageMaker);
			}
		}else{
			//카테고리 있을때 
			//PageMaker
			int totalCount = productDAO.productCountCategory(top_category);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCurPage(curPage);
			pageMaker.setPerPage(perPage);
			pageMaker.makeRow();
			pageMaker.makePage(totalCount);

			if(orderKind.equals("recent")){
				//최신순
				List<ProductDTO> ar = productDAO.productListCategoryRecent(pageMaker, top_category);
				ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
				for(int i=0;i<ar.size();i++){
					productDAO.productImgList(ar.get(i).getPro_num());
					ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
				}
				model.addAttribute("pro_list", ar);
				model.addAttribute("pro_main_img", ar1);
				model.addAttribute("pageMaker", pageMaker);
			}else if(orderKind.equals("name")){
				//이름순
				List<ProductDTO> ar = productDAO.productListCategoryName(pageMaker, top_category);
				ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
				for(int i=0;i<ar.size();i++){
					productDAO.productImgList(ar.get(i).getPro_num());
					ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
				}
				model.addAttribute("pro_list", ar);
				model.addAttribute("pro_main_img", ar1);
				model.addAttribute("pageMaker", pageMaker);
			}else if(orderKind.equals("score")){
				//평점순
				List<ProductDTO> ar = productDAO.productListCategoryScore(pageMaker, top_category);
				ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
				for(int i=0;i<ar.size();i++){
					productDAO.productImgList(ar.get(i).getPro_num());
					ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
				}
				model.addAttribute("pro_list", ar);
				model.addAttribute("pro_main_img", ar1);
				model.addAttribute("pageMaker", pageMaker);
			}else if(orderKind.equals("high")){
				//높은 가격순
				List<ProductDTO> ar = productDAO.productListCategoryHigh(pageMaker, top_category);
				ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
				for(int i=0;i<ar.size();i++){
					productDAO.productImgList(ar.get(i).getPro_num());
					ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
				}
				model.addAttribute("pro_list", ar);
				model.addAttribute("pro_main_img", ar1);
				model.addAttribute("pageMaker", pageMaker);
			}else if(orderKind.equals("low")){
				//낮은 가격순
				List<ProductDTO> ar = productDAO.productListCategoryLow(pageMaker, top_category);
				ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
				for(int i=0;i<ar.size();i++){
					productDAO.productImgList(ar.get(i).getPro_num());
					ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
				}
				model.addAttribute("pro_list", ar);
				model.addAttribute("pro_main_img", ar1);
				model.addAttribute("pageMaker", pageMaker);
			}

		}
	}


	//product 인기순 메인에 뿌리기
	public void productMainLike(int curPage, int perPage, Model model) throws Exception{
		int totalCount=productDAO.productCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);

		List<ProductDTO> ar = productDAO.productListLikeMain(pageMaker);
		ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
		for(int i=0;i<ar.size();i++){
			productDAO.productImgList(ar.get(i).getPro_num());
			ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
		}
		model.addAttribute("pro_list", ar);
		model.addAttribute("pro_main_img", ar1);
		model.addAttribute("pageMaker", pageMaker);
	}

	//product 최신순 메인에 뿌리기
	public void productMainRecent(int curPage, int perPage, Model model) throws Exception{
		int totalCount=productDAO.productCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);

		List<ProductDTO> ar = productDAO.productListRecentMain(pageMaker);
		ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
		for(int i=0;i<ar.size();i++){
			productDAO.productImgList(ar.get(i).getPro_num());
			ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
		}
		model.addAttribute("pro_list_recent", ar);
		model.addAttribute("pro_main_img_recent", ar1);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//초특가
	public void productSubDiscount(int curPage, int perPage, Model model) throws Exception{
		int totalCount=productDAO.productCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		List<ProductDTO> ar = productDAO.productSubDiscount(pageMaker);
		ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
		for(int i=0;i<ar.size();i++){
			productDAO.productImgList(ar.get(i).getPro_num());
			ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
		}
		model.addAttribute("pro_list_sub_discount", ar);
		model.addAttribute("pro_main_img_sub_discount", ar1);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//인기
	public void productSubFavor(int curPage, int perPage, Model model) throws Exception{
		int totalCount=productDAO.productCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		List<ProductDTO> ar = productDAO.productSubFavor(pageMaker);
		ArrayList<ProductFileDTO> ar1 = new ArrayList<ProductFileDTO>();
		for(int i=0;i<ar.size();i++){
			productDAO.productImgList(ar.get(i).getPro_num());
			ar1.add(productDAO.productImgList(ar.get(i).getPro_num()));
		}
		model.addAttribute("pro_list_sub_favor", ar);
		model.addAttribute("pro_main_img_sub_favor", ar1);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	
	//이미지 4개 뿌리기
	public void productViewImgMain(int curPage, int perPage, int pro_num, Model model) throws Exception{
		int totalCount = productDAO.productViewImgCount(pro_num);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		//productView 사진들
		List<ProductFileDTO> ar = productDAO.productViewImgMain(pageMaker, pro_num);
		model.addAttribute("pro_img_main", ar);
	}
	public void productComputer(Pro_ComputerDTO pro_ComputerDTO, int pro_num){
		productDAO.productComputer(pro_ComputerDTO, pro_num);
	}

}
