package com.game.mart;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.game.cd.Product_MemberDAO;
import com.game.cd.Product_memberDTO;
import com.game.member.MemberDTO;
import com.game.product.ProductDAO;
import com.game.product.ProductDTO;
import com.game.product.ProductFileDTO;

@Service
public class PurchaseService {
	
	@Autowired
	private PurchaseDAO purchasedao;
	
	@Autowired
	private Product_MemberDAO pro_memdao;
	
	@Autowired
	private ProductDAO productDao;
	
	
	//구매항목 list
	public void purchaseList(ArrayList<CartDTO> cartlist, Model model) throws Exception {
		
		ArrayList<ProductDTO> proDto = new ArrayList<ProductDTO>();		
		ArrayList<ProductFileDTO> pFileDto = new ArrayList<ProductFileDTO>();
		
		for(int i=0;i<cartlist.size();i++){
		//구매상품 정보 
		proDto.add(purchasedao.product(cartlist.get(i)));		
		//구매 상품 사진 가져오기
		pFileDto.add(purchasedao.profile(cartlist.get(i)));
		}
		model.addAttribute("productOne", proDto);
		model.addAttribute("proFileOne", pFileDto);		
		
	}
	
	//상품권 생성
	public void makecupon() throws Exception{
		
		for(int k=0;k<10;k++){
			String password = "";			
			Random r = new Random();
			Random r2 = new Random();
			for(int j =0;j<5;j++){
				String var = (j>0)?"-":"";
				int r_num = r2.nextInt(2);
				password += var;
				for(int i =0; i<3; i++){
					if(i == r_num){
						int rand = r.nextInt(26)+65;
						password += (char)rand;
					}else{
						int rand = r.nextInt(10);
						password += rand;
					}
				}
			}		
		int result = purchasedao.makecupon(password);
		}
		
	}
	
	 
	//상품권 정보 확인 
	public CuponDTO cuponcheck(CuponDTO cupon) throws Exception {
		return purchasedao.checkcupon(cupon);
	}
	
	//상품권 정보 수정
	public int cuponMod(CuponDTO cupon) throws Exception{
		return purchasedao.cuponmod(cupon);
	}
	
	//구매 정보 입력
	public int purchasing (PurchaseDTO purchase) throws Exception{
		return purchasedao.purchasing(purchase);
	}
	
	
	//구매정보 확인 리스트
	public void purchasedList(HttpSession session, Model model) throws Exception{
		
		MemberDTO mDto = new MemberDTO();
		mDto = (MemberDTO)session.getAttribute("member");
		
		//구매날짜 가져오기
		ArrayList<PurchaseDTO> purar = purchasedao.purchaseList(mDto);		
		//구매날짜 중복제거
		//중복 제거 용
		ArrayList<PurchaseDTO> purar2 = new ArrayList<>();
		for(int i=0;i<purar.size();i++){			
			System.out.println("purar: "+purar.get(i).getReg_date());
		}
		for(int i=0;i<purar.size()-1;i++){
			for(int j=1;j<purar.size();j++){
				if(purar.get(i).getReg_date() == purar.get(j).getReg_date()){
				
				}else if(purar.get(i).getReg_date() != purar.get(j).getReg_date()){
					purar2.add(purar.get(i));
				}else {
					purar2.add(purar.get(j));
				}
			}
		}
		for(int i=0;i<purar2.size();i++){			
			System.out.println("purar2: "+purar2.get(i).getReg_date());
		}
		model.addAttribute("Purchasing_List", purar2);
		
		
	}
	
	public ProductDTO productcheck(int p_nar) throws Exception{
		ProductDTO pdDto = productDao.productView(p_nar);		
		return pdDto;
	}

	public int purcheck() {
		// TODO Auto-generated method stub
		int pur_num = purchasedao.purcheck();
		return pur_num;
	}
	

}
