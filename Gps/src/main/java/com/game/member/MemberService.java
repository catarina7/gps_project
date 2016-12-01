package com.game.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
		@Autowired
		private MemberDAO memberDao;
		
	
		//회원가입
		public int join(MemberDTO mDto) throws Exception{
			return memberDao.join(mDto);
		}
	
		//로그인
		public MemberDTO login(MemberDTO mDto) throws Exception{
			System.out.println("service");
			return memberDao.login(mDto);
		}
		
		//회원정보 수정
		
		//회원탈퇴
		
		//id중복체크
		public MemberDTO idcheck(String id) throws Exception{			
			return memberDao.idcheck(id);
		}

}
