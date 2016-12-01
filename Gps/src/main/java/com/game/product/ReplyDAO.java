package com.game.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.util.PageMaker;

@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "ReplyMapper.";
	
	//댓글 작성
	public int replyWrite(ReplyDTO replyDTO){
		return sqlSession.insert(namespace+"replyWrite", replyDTO);
	}
	//댓글 삭제
	public int replyDelete(int r_num){
		return sqlSession.delete(namespace+"replyDelete", r_num);
	}
	//해당 게임의 댓글 리스트 불러오기
	public List<ReplyDTO> replyList(int pro_num){
		return sqlSession.selectList(namespace+"replyList", pro_num);
	}
}
