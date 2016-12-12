package com.game.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "ReplyMapper.";
	
	//댓글 작성
	public int replyWrite(ReplyDTO replyDTO){
		return sqlSession.insert(namespace+"replyWrite", replyDTO);
	}
	
	//해당 게임의 댓글 리스트 불러오기
	public List<ReplyDTO> replyList(int pro_num){
		return sqlSession.selectList(namespace+"replyList", pro_num);
	}
	
	//댓글 삭제
	public int replyDelete(int r_num){
		return sqlSession.delete(namespace+"replyDelete", r_num);
	}
	
	//좋아요 기능
	public int replyLike(int pro_num, int r_num, String m_id){
		System.out.println(pro_num  +":"+r_num+":"+m_id);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pro_num", pro_num);
		data.put("r_num", r_num);
		data.put("m_id", m_id);
		return sqlSession.insert(namespace+"replyLike", data);
	}
	
	//좋아요 갯수 (Like_count 테이블에)
	public int replyLikeCountAdd(int pro_num, int r_num){
		Map<String, Object> data = new HashMap<String, Object>();
		int like_count=sqlSession.selectOne(namespace+"replyLike_count", r_num);
		
		data.put("pro_num", pro_num);
		data.put("r_num", r_num);
		data.put("like_count", like_count);
		return sqlSession.insert(namespace+"replyLike_insert", data);
	}
	
	public Like_countDTO replyLikeCountSelect(int r_num){
		return sqlSession.selectOne(namespace+"replyLike_select", r_num);
	}
	
	
	
	
	//싫어요 기능
	public int replyHate(int pro_num, int r_num, String m_id){
		System.out.println(pro_num  +":"+r_num+":"+m_id);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pro_num", pro_num);
		data.put("r_num", r_num);
		data.put("m_id", m_id);
		return sqlSession.insert(namespace+"replyHate", data);
	}
}
