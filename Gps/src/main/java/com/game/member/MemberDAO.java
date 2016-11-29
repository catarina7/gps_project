package com.game.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "memberMapper.";
	
	//회원가입
	
	//로그인
	
	//회원정보 수정
	
	//회원탈퇴
	
	//id중복체크
	public MemberDTO idcheck(String id){
		
		return sqlSession.selectOne(namespace+"idCheck", id);
	}

}
