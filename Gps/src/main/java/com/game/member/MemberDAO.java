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
	public int join(MemberDTO mDto) throws Exception{
		return sqlSession.insert(namespace+"Join", mDto);
	}
	
	//로그인
	public MemberDTO login(MemberDTO mDto) throws Exception{
		return sqlSession.selectOne(namespace+"Login", mDto);
	}
	
	//회원정보 수정
	
	//회원탈퇴
	
	//id중복체크
	public MemberDTO idcheck(String id) throws Exception{
		
		return sqlSession.selectOne(namespace+"idCheck", id);
	}
	
	//id찾기
	public MemberDTO searchid(MemberDTO mDto) throws Exception{
		
		return sqlSession.selectOne(namespace+"searchId", mDto);
	} 

}
