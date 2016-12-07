package com.game.member;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.game.computer.ComputerDTO;

@Service
public class MemberService {
	
		@Autowired
		private MemberDAO memberDao;
		
	
		//회원가입
		public int join(MemberDTO mDto) throws Exception{
			return memberDao.join(mDto);
		}
		
		//computer 정보입력
		public int cominfo(ComputerDTO com) throws Exception{
			
			return memberDao.cominfo(com);
		}
	
		//로그인
		public MemberDTO login(MemberDTO mDto) throws Exception{
			return memberDao.login(mDto);
		}
		
		//회원정보 수정
		public int memMod(MemberDTO mDto) throws Exception{
			return memberDao.idMod(mDto);
		}
		
		//회원탈퇴
		
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

}
