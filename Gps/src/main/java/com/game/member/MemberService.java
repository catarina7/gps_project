package com.game.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
		@Autowired
		private MemberDAO memberDao;
		
	
		//회원가입
	
		//로그인
		
		//회원정보 수정
		
		//회원탈퇴
		
		//id중복체크
		public MemberDTO idcheck(String id){			
			return memberDao.idcheck(id);
		}

}
