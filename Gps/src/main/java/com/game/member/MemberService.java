package com.game.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
		//회원탈퇴
		
		//id중복체크
		public MemberDTO idcheck(String id) throws Exception{			
			return memberDao.idcheck(id);
		}
		
		//id찾기
		public MemberDTO searchid(MemberDTO mDto) throws Exception{
			
			return memberDao.searchid(mDto);
		}

}
