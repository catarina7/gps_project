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
	public String purchaseList(HttpSession session, Model model){				
		
		if(session.getAttribute("member") != null){
			try {
				purchaseservice.purchasedList(session, model);
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
		
		/*if(c_nar.size()==1){
			CartDTO cartDto = new CartDTO();
			cartDto.setC_num(c_nar.get(0));
			cartDto.setPro_num(p_nar.get(0));
			try {
				purchaseservice.purchaseList(cartDto, model);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			
			System.out.println(c_nar.size());
			
		}*/
		
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
		public ResponseEntity<Integer> purchasing(PurchaseDTO purchase, @RequestParam(defaultValue="") String prolist){
			int result=0;
			StringTokenizer st = new StringTokenizer(prolist, ",");
			ArrayList<Integer> p_nar = new ArrayList<Integer>();
			while(st.hasMoreTokens()){
				p_nar.add(Integer.parseInt(st.nextToken()));
			}
			System.out.println(p_nar.get(0));
			/*MemberDTO mDto = new MemberDTO();
			mDto.setM_id(purchase.getM_id());
			mDto.setMillage(purchase.getM_millage());
			Product_memberDTO pro_mem = new Product_memberDTO();
			pro_mem.setM_id(purchase.getM_id());
			pro_mem.setPro_num(purchase.getPro_num());*/
			
			try {
				
				/*//purchaseservice 구매정보 입력
				result = purchaseservice.purchasing(purchase);
				//memberservice 마일리지 정보 수정
				MemberService.memMod(mDto);
				//cartservice 카트 정보 수정
				cartservice.purchaseDel(purchase);
				//product_member 정보 입력
				pro_memService.pro_meminsert(pro_mem);	*/			
				
				
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
