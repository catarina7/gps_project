package com.game.member;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import com.game.cd.Product_MemberDAO;
import com.game.cd.Product_memberDTO;
import com.game.computer.ComputerDTO;
import com.game.product.ProductDAO;
import com.game.product.ProductDTO;
import com.game.product.ProductFileDTO;
import com.game.util.PageMaker;

@Service
public class MemberService {
	
		@Autowired
		private MemberDAO memberDao;
		
		@Autowired
		private Product_MemberDAO pro_memdao;
		
		@Autowired
		private ProductDAO productdao;
		
	
		//회원가입
		public int join(MemberDTO mDto) throws Exception{
			return memberDao.join(mDto);
		}
		
		//computer 정보입력
		public int cominfo(ComputerDTO com) throws Exception{
			
			return memberDao.cominfo(com);
		}
		
		//computer 정보 수정
		public int comMod(ComputerDTO com) throws Exception{
			return memberDao.comMod(com);
		}
	
		//로그인
		public MemberDTO login(MemberDTO mDto, HttpSession session) throws Exception{
			
			ComputerDTO comDto = new ComputerDTO();
			mDto = memberDao.login(mDto);  
			
			try {
				comDto = memberDao.cominfo(mDto.getM_num());	
				session.setAttribute("cominfo", comDto);
			} catch (Exception e) {
				// TODO: handle exception
			}						
			return mDto;
		}
		
		//회원정보 수정
		public int memMod(MemberDTO mDto) throws Exception{
			return memberDao.idMod(mDto);
		}
		
		//회원탈퇴
		public int memOut(MemberDTO mDto) throws Exception{
			
			//컴퓨터 정보 삭제
			memberDao.comOut(mDto.getM_num());
			//구매정보 삭제
			memberDao.purchaseout(mDto);
			//상품_회원삭제
			memberDao.pro_memout(mDto);
			return memberDao.memOut(mDto);
			
		}
		
		//id중복체크
		public MemberDTO idcheck(String id) throws Exception{			
			return memberDao.idcheck(id);
		}
		
		//id찾기
		public MemberDTO searchid(MemberDTO mDto) throws Exception{
			
			return memberDao.searchid(mDto);
		}
		
		//pw찾기
		public int searchpw(MemberDTO mDto, HttpServletRequest request)throws Exception{
			
			int result=0;
			String password = "";
			
			mDto = memberDao.searchpw(mDto);
			
			if(mDto.getM_pw() != null){
				
				Random r = new Random();
				for(int i =0; i<8; i++){
					if(i==1 || i==4 || i==6 || i==7){
						int rand = r.nextInt(26)+65;
						password += (char)rand;
					}else{
						int rand = r.nextInt(10);
						password += rand;
					}
				}
				mDto.setM_pw(password);
				mDto.setM_kind(10);
				
				memberDao.idMod(mDto);
				memberDao.mailSender(request,  mDto);				
				
				result = 1;
			}
			
			return result;
		}
		
		//구매게임 확인하기
		public void mem_game(HttpSession session,int curPage,int perPage ,Model model) throws Exception{
			
			MemberDTO mDto = new MemberDTO();
			PageMaker pm = new PageMaker();
			
			
			mDto = (MemberDTO)session.getAttribute("member");
			ArrayList<Product_memberDTO> forcount = pro_memdao.pro_memsearch(mDto);
			//product_member 긁어 오기
			
			pm.setCurPage(curPage);
			pm.setPerPage(perPage);
			pm.makeRow();
			pm.makePage(forcount.size());
			
			ArrayList<Product_memberDTO> promemar = pro_memdao.pro_memlist(mDto, pm);
			ArrayList<ProductDTO> prodtar = new ArrayList<ProductDTO>();
			ArrayList<ProductFileDTO> filear = new ArrayList<ProductFileDTO>();
			for(int i=0;i<promemar.size();i++){
				prodtar.add(productdao.productView(promemar.get(i).getPro_num()));
				filear.add(productdao.productImgList(promemar.get(i).getPro_num()));
			}
			
			model.addAttribute("pagemaker", pm);
			model.addAttribute("product_member_List", promemar);
			model.addAttribute("pr_me_List", prodtar);
			model.addAttribute("productFile", filear);
			
			
					
		}

}
