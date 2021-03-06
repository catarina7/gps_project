package com.game.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.cd.Product_memberDTO;
import com.game.computer.Pro_ComputerDTO;
import com.game.util.PageMaker;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	private String namespace="ProductMapper.";

	//Product_글 작성
	public int productWrite(ProductDTO productDTO, ArrayList<String> fileNames, ArrayList<String> origineNames) throws Exception{
		//일반 글 쓰기
		sqlSession.insert(namespace + "productWrite", productDTO);
		//pro_num 가져오기
		int pro_num= Integer.valueOf(productDTO.getPro_num());

		Map<String, Object> data = new HashMap<String, Object>();
		for(int i=0; i<fileNames.size();i++){
			data.put("pro_num", pro_num);
			data.put("file_name", fileNames.get(i));
			data.put("origine", origineNames.get(i));
			sqlSession.insert(namespace+"pro_fileWrite", data);
		}
		return 1; 
	}

	//Product 글 리스트
	public List<ProductDTO> productList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"pro_list", pageMaker);
	}

	//Product 글 전체 갯수 가져오기
	public int productCount() throws Exception{
		return sqlSession.selectOne(namespace+"pro_boardCount");
	}

	//product 메인사진
	public ProductFileDTO productImgList(int pro_num) throws Exception{
		return sqlSession.selectOne(namespace+"pro_main_Img", pro_num);
	}

	//product View 부분
	public ProductDTO productView(int pro_num) throws Exception{
		return sqlSession.selectOne(namespace+"productView", pro_num);
	}

	public List<ProductFileDTO> productViewImgList(int pro_num) throws Exception{
		return sqlSession.selectList(namespace+"pro_view_img_list", pro_num);
	}

	//product View 이미지 부분
	public List<ProductFileDTO> productViewImg(PageMaker pageMaker, int pro_num) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pro_num", pro_num);
		data.put("pageMaker", pageMaker);
		return sqlSession.selectList(namespace+"pro_view_img", data);
	}
	
	//product View 이미지 갯수 가져오기
	public int productViewImgCount(int pro_num) throws Exception{
		return sqlSession.selectOne(namespace+"pro_view_img_count", pro_num);
	}
	//product View 패치파일 부분
	public List<PatchDTO> productViewPatch(int pro_num) throws Exception{
		return sqlSession.selectList(namespace+"pro_view_patch", pro_num);
	}
	
	//pro_mod에다가 이미지 가져오기
	public List<ProductFileDTO> productModImg(int pro_num) throws Exception{
		return sqlSession.selectList(namespace+"pro_mod_img", pro_num);
	}
	
	//pro_mod에 이미지 삭제
	public void productModDeleteList(List<Integer> valueArr) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		for(int i=0; i<valueArr.size();i++){
			data.put("file_num", valueArr.get(i));
			sqlSession.delete(namespace+"pro_mod_del_img", data);
		}
	}
	
	//pro_mod에 이미지 추가
	public void productModAddImg(int pro_num, ArrayList<String> fileNames, ArrayList<String> origineNames) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		for(int i=0; i<fileNames.size();i++){
			data.put("pro_num", pro_num);
			data.put("file_name", fileNames.get(i));
			data.put("origine", origineNames.get(i));
			sqlSession.insert(namespace+"pro_mod_add_img", data);
		}
	}
	
	//pro_mod에 패치파일 추가
	public void productModAddPatch(int pro_num, ArrayList<String> patchNames, ArrayList<String> originePatchesNames) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		for(int i=0; i<patchNames.size();i++){
			data.put("pro_num", pro_num);
			data.put("patch_file_name", patchNames.get(i));
			data.put("patch_origine_name", originePatchesNames.get(i));
			sqlSession.insert(namespace+"pro_mod_add_patch", data);
		}
	}
	
	//pro_mod 내용
	public void productMod(ProductDTO productDTO){
		sqlSession.update(namespace+"pro_mod", productDTO);
	}
	
	//product 삭제
	public int productDelete(int pro_num) throws Exception{
		return sqlSession.delete(namespace+"pro_del", pro_num);
	}
	
	//category별 List
	public List<ProductDTO> productListCategory(PageMaker pageMaker, String top_category) throws Exception{
		Map<String, Object> data  = new HashMap<String, Object>();
		data.put("pageMaker", pageMaker);
		data.put("top_category", top_category);
		return sqlSession.selectList(namespace+"pro_list_category", data);
	}
	//category별 글갯수
	public int productCountCategory(String top_category) throws Exception{
		return sqlSession.selectOne(namespace+"pro_boardCount_category", top_category);
	}
	
	//평점
	public List<ReplyDTO> scored(int pro_num){
		return sqlSession.selectList(namespace+"score", pro_num);
	}
	
	public void total_score(int pro_num, int total_score){
		Map<String, Object> data  = new HashMap<String, Object>();
		data.put("pro_num", pro_num);
		data.put("total_score", total_score);
		sqlSession.update(namespace+"total_score", data);
	}
	
	//search별 List
	public List<ProductDTO> productListSearch(PageMaker pageMaker, String pro_title) throws Exception{
		Map<String, Object> data  = new HashMap<String, Object>();
		data.put("pageMaker", pageMaker);
		data.put("pro_title", pro_title);
		return sqlSession.selectList(namespace+"productList_search", data);
	}
	
	//search별 글 갯수
	public int productCountSearch(String pro_title) throws Exception{
		return sqlSession.selectOne(namespace+"pro_boardCount_search", pro_title);
	}
	
	//*****************************************************************************************************************
	//Product 글 리스트 (최신순)
	public List<ProductDTO> productListRecent(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"pro_list_recent", pageMaker);
	}
	
	//Product 글 리스트 (이름순)
	public List<ProductDTO> productListName(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"pro_list_name", pageMaker);
	}
	
	//Product 글 리스트 (평점순)
	public List<ProductDTO> productListScore(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"pro_list_score", pageMaker);
	}
	
	//Product 글 리스트 (높은 가격순)
	public List<ProductDTO> productListHigh(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"pro_list_high", pageMaker);
	}
		
	//Product 글 리스트 (낮은순)
	public List<ProductDTO> productListLow(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"pro_list_low", pageMaker);
	}
	// ********************************************************************************************************
	
	//category별 List (최신순)
	public List<ProductDTO> productListCategoryRecent(PageMaker pageMaker, String top_category) throws Exception{
		Map<String, Object> data  = new HashMap<String, Object>();
		data.put("pageMaker", pageMaker);
		data.put("top_category", top_category);
		return sqlSession.selectList(namespace+"pro_list_category_recent", data);
	}
	
	//category별 List (이름순)
	public List<ProductDTO> productListCategoryName(PageMaker pageMaker, String top_category) throws Exception{
		Map<String, Object> data  = new HashMap<String, Object>();
		data.put("pageMaker", pageMaker);
		data.put("top_category", top_category);
		return sqlSession.selectList(namespace+"pro_list_category_name", data);
	}
	
	//category별 List (평점순)
	public List<ProductDTO> productListCategoryScore(PageMaker pageMaker, String top_category) throws Exception{
		Map<String, Object> data  = new HashMap<String, Object>();
		data.put("pageMaker", pageMaker);
		data.put("top_category", top_category);
		return sqlSession.selectList(namespace+"pro_list_category_score", data);
	}
	
	//category별 List (높은 가격순)
	public List<ProductDTO> productListCategoryHigh(PageMaker pageMaker, String top_category) throws Exception{
		Map<String, Object> data  = new HashMap<String, Object>();
		data.put("pageMaker", pageMaker);
		data.put("top_category", top_category);
		return sqlSession.selectList(namespace+"pro_list_category_high", data);
	}	
	
	//category별 List (낮은 가격순)
	public List<ProductDTO> productListCategoryLow(PageMaker pageMaker, String top_category) throws Exception{
		Map<String, Object> data  = new HashMap<String, Object>();
		data.put("pageMaker", pageMaker);
		data.put("top_category", top_category);
		return sqlSession.selectList(namespace+"pro_list_category_low", data);
	}
	
	//***************************************************************************************
	//main 인기순으로 뿌리기
	public List<ProductDTO> productListLikeMain(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"pro_main_like", pageMaker);
	}
	
	//main 최신순 뿌리기
	public List<ProductDTO> productListRecentMain(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"pro_main_recent", pageMaker);
	} 
	
	//초특가
	public List<ProductDTO> productSubDiscount(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"pro_sub_discount", pageMaker);
	}
	
	//인기
	public List<ProductDTO> productSubFavor(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"pro_sub_favor", pageMaker);
	}
	
	//판매량순
	public List<Product_memberDTO> productSubVolume(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"pro_sub_volume", pageMaker);
	}
	//판매량순 갯수가져오기
	public int pro_sub_volume_count() throws Exception{
		return sqlSession.selectOne(namespace+"pro_sub_volume_count");
	}
	//판매량 내용 가져오기
	public ProductDTO pro_sub_volume_title(int pro_num) throws Exception{
		return sqlSession.selectOne(namespace+"pro_sub_volume_title", pro_num);
	}
	
	
	//이미지 4개 뿌리기 
	public List<ProductFileDTO> productViewImgMain(PageMaker pageMaker, int pro_num) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pro_num", pro_num);
		data.put("pageMaker", pageMaker);
		return sqlSession.selectList(namespace+"pro_view_img_main", data);
	}
	
	
	//pc_computer 사양
	public void productComputer(Pro_ComputerDTO pro_ComputerDTO, int pro_num){
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pro_num", pro_num);
		data.put("pro_com", pro_ComputerDTO);
		sqlSession.insert(namespace+"pro_computer_add", data);
	}
	
	public Pro_ComputerDTO productComputerSelect(int pro_num){
		return sqlSession.selectOne(namespace+"pro_computer_select", pro_num);
	}
	
	//댓글 갯수
	public int replyCount(int pro_num){
		return sqlSession.selectOne(namespace+"replyCount", pro_num);
	}
	
	//연관 게임 찾기
	public List<ProductDTO> mappingCategory(int pro_num, PageMaker pageMaker){
		String sub_category = sqlSession.selectOne(namespace+"mapping_category_search", pro_num);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pageMaker", pageMaker);
		data.put("sub_category", sub_category);
		return sqlSession.selectList(namespace+"mapping_category", data);
	}
	
	//쿠키 내용
	public List<ProductDTO> fav_list(List<Integer> valueArr) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		List<ProductDTO> fav_list = new ArrayList<ProductDTO>();
		for(int i=0; i<valueArr.size();i++){
			if(valueArr.get(i) != null){
				data.put("pro_num", valueArr.get(i));
				ProductDTO productDTO = sqlSession.selectOne(namespace+"fav_list", data);
				fav_list.add(productDTO);
			}else{
				break;
			}
		}
		return fav_list;
	}
		
}
