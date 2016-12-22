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
	
	//좋아요 갯수  [like_count] TABLE
	public Like_countDTO replyLikeCountSelect(int r_num){
		return sqlSession.selectOne(namespace+"replyLike_select", r_num);
	}
	
	//좋아요 버튼을 누르면 id 검색한다.
	public Like_hateDTO replyIdSearch(int r_num, String m_id){
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("r_num", r_num);
		data.put("m_id", m_id);
		return sqlSession.selectOne(namespace+"like_id_search", data);
	}
	
	//Like_hate 테이블에 추가 된다.
	public int replyLike_insert(int pro_num, int r_num, String m_id){
		System.out.println(pro_num  +":"+r_num+":"+m_id);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pro_num", pro_num);
		data.put("r_num", r_num);
		data.put("m_id", m_id);
		return sqlSession.insert(namespace+"replyLike_insert", data);
	}
	
	//like_count 테이블에서 r_num으로 좋아요수 검색
	public Like_countDTO replyCountCheck(int r_num){
		return sqlSession.selectOne(namespace + "count_search", r_num);
	}
	
	//like_count 테이블 값 추가하기
	public int replyLikeCountAdd(int pro_num, int r_num){
		Map<String, Object> data = new HashMap<String, Object>();
		int like_count=sqlSession.selectOne(namespace+"replyLike_count", r_num);
		
		data.put("pro_num", pro_num);
		data.put("r_num", r_num);
		data.put("like_count", like_count);
		return sqlSession.insert(namespace+"like_count_insert", data);
	}
	
	//like_count 테이블에 like_count 값 수정 +
	public void replyUpdatePlus(Like_countDTO like_countDTO){
		sqlSession.update(namespace+"replyLike_update_plus", like_countDTO);
	}
	
	//like_count 테이블에 like_count 값 수정 -
	public void replyUpdateMinus(Like_countDTO like_countDTO){
		sqlSession.update(namespace+"replyLike_update_minus", like_countDTO);
	}
	
	//좋아요 취소하기
	public void replyLikeCancel(int r_num, String m_id){
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("r_num", r_num);
		data.put("m_id", m_id);
		sqlSession.selectOne(namespace+"replyLike_cancel", data);
	}
	
	//댓글 갯수
	public ReplyDTO replyCount(int pro_num){
		return sqlSession.selectOne(namespace+"replyCount", pro_num);
	}
}
