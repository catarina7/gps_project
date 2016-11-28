package com.game.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.util.PageMaker;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	private String namespace="NoticeMapper.";
	
	
	public NoticeDTO noticeView(int n_num) throws Exception{
		return sqlSession.selectOne(namespace+"noticeView", n_num);
	}
	
	public int noticeWrite(NoticeDTO noticeDTO) throws Exception{
		return sqlSession.insert(namespace+"noticeWrite", noticeDTO);
				
	}
	
	
	public int noticeUpdate(NoticeDTO noticeDTO) throws Exception{
		return sqlSession.update(namespace+"noticeUpdate", noticeDTO);
	}
	
	
	public int noticeDelete(int n_num) throws Exception{
		return sqlSession.delete(namespace+"noticeDelete", n_num);
	}
	
	
	public List<NoticeDTO> noticeList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"noticeList", pageMaker);
	} 
	
	
	public int noticeCount() throws Exception{
		return sqlSession.selectOne(namespace+"noticeCount");
	}
	
}
