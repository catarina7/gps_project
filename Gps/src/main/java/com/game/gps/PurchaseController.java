package com.game.gps;

import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.cd.Product_memberDTO;
import com.game.cd.Product_memberService;
import com.game.mart.CartDTO;
import com.game.mart.CartService;
import com.game.mart.CuponDTO;
import com.game.mart.PurchaseDTO;
import com.game.mart.PurchaseService;
import com.game.member.MemberDTO;
import com.game.member.MemberService;
import com.game.product.ProductDTO;
import com.game.product.ProductService;

@Controller
@RequestMapping(value="/purchase")
public class PurchaseController {
	
	@Autowired
	private PurchaseService purchaseservice;
	@Autowired
	private MemberService MemberService;
	@Autowired
	private CartService cartservice;
	@Autowired
	private Product_memberService pro_memService;
	
	
	//구매내역
	@RequestMapping(value="/purchase")
	public String purchaseList(HttpSession session, Model model, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int perPage){				
		
		if(session.getAttribute("member") != null){
			try {
				purchaseservice.purchasedList(session, model, curPage, perPage);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		};
		
		return "/purchase/purchase";
	}
	
	//구매하기 
	@RequestMapping(value="/buy")
	public String buy(@RequestParam String c_num, @RequestParam(defaultValue="") String pro_num, Model model){
		
		ArrayList<Integer> c_nar = new ArrayList<Integer>();
		ArrayList<Integer> p_nar = new ArrayList<Integer>();
		ArrayList<CartDTO> cart_ar = new ArrayList<CartDTO>();
		
		StringTokenizer st = new StringTokenizer(c_num, ",");
		while(st.hasMoreTokens()){
			c_nar.add(Integer.parseInt(st.nextToken()));
		}
		StringTokenizer st2 = new StringTokenizer(pro_num, ",");
		while(st2.hasMoreTokens()){
			p_nar.add(Integer.parseInt(st2.nextToken()));
		}
		for(int i=0;i<c_nar.size();i++){
			CartDTO cartDto = new CartDTO();
			cartDto.setC_num(c_nar.get(i));
			cartDto.setPro_num(p_nar.get(i));
			cart_ar.add(cartDto);
		}
		
		
		try {
			purchaseservice.purchaseList(cart_ar, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/purchase/buy";
	}
	
	//상품권 확인
	@RequestMapping(value="/Cupon" , method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> cuponcheck(CuponDTO cupon, Model model){
		int result=0;
		CuponDTO cup = new CuponDTO();
		try {
			cup = purchaseservice.cuponcheck(cupon);
			if(cup != null){
				result = cup.getCup_price();
				//쿠폰 사용 
				cupon.setCup_check(1);
				purchaseservice.cuponMod(cupon);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = 0;
		}		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	
	//상품권 사용취소
		@RequestMapping(value="/CuponDel" , method = RequestMethod.POST, produces="application/json; charset=utf-8")
		@ResponseBody
		public ResponseEntity<Integer> cupondel(CuponDTO cupon){
			int result=0;
			cupon.setCup_check(0);
			try {
				result = purchaseservice.cuponMod(cupon);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				result = 0;
			}		
			return new ResponseEntity<Integer>(result, HttpStatus.OK);
		}
		
	
	//결제 입력
		@RequestMapping(value="/Purchase_pro", method = RequestMethod.POST , produces="application/json; charset=utf-8")
		@ResponseBody

		public ResponseEntity<Integer> purchasing(PurchaseDTO purchase){

			int result=0;
			StringTokenizer st = new StringTokenizer(purchase.getPro_num(), ":");
			ArrayList<Integer> p_nar = new ArrayList<Integer>();
			while(st.hasMoreTokens()){
				p_nar.add(Integer.parseInt(st.nextToken()));
			}
			
			MemberDTO mDto = new MemberDTO();
			mDto.setM_id(purchase.getM_id());
			mDto.setMillage(purchase.getM_millage());
			
			
			//구매정보 입력용
			ArrayList<CartDTO> cartar = new ArrayList<CartDTO>();
			//상품_맴버 입력용
			ArrayList<Product_memberDTO> pmar = new ArrayList<Product_memberDTO>();

			
			try {
				
				//memberservice 마일리지 정보 수정(not for)
				MemberService.memMod(mDto);					
				
				//purchaseservice 구매정보 입력
				result += purchaseservice.purchasing(purchase);
				int pur_num = purchaseservice.purcheck();
				for(int i=0;i<p_nar.size();i++){
					
					CartDTO cart = new CartDTO();
					cart.setM_id(purchase.getM_id());
					cart.setPro_num(p_nar.get(i));
					cartar.add(cart);
					Product_memberDTO prme = new Product_memberDTO();
					prme.setM_id(purchase.getM_id());
					prme.setPro_num(p_nar.get(i));
					prme.setPur_num(pur_num);
					pmar.add(prme);
				}				
				
				for(int i=0;i<pmar.size();i++){					
				//cartservice 카트 정보 수정
					cartservice.purchaseDel(cartar.get(i));
				//product_member 정보 입력
					pro_memService.pro_meminsert(pmar.get(i));	
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				result = 0;
			}		
			return new ResponseEntity<Integer>(result, HttpStatus.OK);
		}
		
	//결제 결과 
	@RequestMapping(value="purResult")
	public String purResult(){
		return "/purchase/purResult"; 
	}
	
	
}
