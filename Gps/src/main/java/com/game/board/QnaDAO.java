package com.game.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.util.PageMaker;

@Repository
public class QnaDAO {

	@Autowired
	private SqlSession sqlSession;
	private String namespace="QnaMapper.";
	
	//View
	public QnaDTO qnaView(int q_num) throws Exception{
		return sqlSession.selectOne(namespace+"qnaView", q_num);
	}
	
	public List<QnaFileDTO> qnaViewImgList(int q_num) throws Exception{
		return sqlSession.selectList(namespace+"qnaView_imgList", q_num);
	}
	
	public List<QnaFileDTO> qnaViewImg(PageMaker pageMaker, int q_num) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("q_num", q_num);
		data.put("pageMaker", pageMaker);
		return sqlSession.selectList(namespace +"qnaView_img", data);
	}
	
	//이미지 갯수 가져오기
	public int qnaView_imgCount(int q_num) throws Exception{
		return sqlSession.selectOne(namespace+"qnaView_imgCount", q_num);
	}
	
	//mod에 이미지 가져오기
	public List<QnaFileDTO> qnaModImg(int q_num) throws Exception{
		return sqlSession.selectList(namespace+"qna_mod_img", q_num);
	}
	//글List
	public List<QnaDTO> qnaList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"qnaList", pageMaker);
	}
	
	//Write
	public int qnaWrite(QnaDTO qnaDTO, ArrayList<String> qfile_name, ArrayList<String> qorigine_name) throws Exception{
		//일반 글
		sqlSession.insert(namespace +"qnaWrite", qnaDTO);
		//q_num가져오기
		int q_num = Integer.valueOf(qnaDTO.getQ_num());
		
		Map<String, Object> data = new HashMap<String, Object>();
		for(int i=0;i<qfile_name.size();i++){
			data.put("q_num",q_num);
			data.put("qfile_name", qfile_name.get(i));
			data.put("qorigine_name", qorigine_name.get(i));
			sqlSession.insert(namespace+"qna_fileWrite", data);
		}
		return 1;
	}
	//Delete
	public int qnaDelete(int q_num) throws Exception{
		return sqlSession.delete(namespace+"qnaDelete", q_num);
	}
	//count
	public int qnaCounts(int q_num) throws Exception{
		return sqlSession.update(namespace+"qnaCounts", q_num);
	}
	
	//글 전체 갯수 가져오기
	public int qnaCount() throws Exception{
		return sqlSession.selectOne(namespace+"qnaCount");
	}
	
	//qna 이미지 삭제
	public void qnaModDeleteList(List<Integer> valueArr) throws Exception{
		
		Map<String, Object> data = new HashMap<String, Object>();
		for(int i=0;i<valueArr.size();i++){
			data.put("qfile_num", valueArr.get(i));
			sqlSession.delete(namespace+"qna_mod_del_img", data);
		}
	}
	
	//qna 이미지 추가
	public void qnaModAddImg(int q_num, ArrayList<String> fileNames,  ArrayList<String> origineNames) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		for(int i=0;i<fileNames.size();i++){
			data.put("q_num", q_num);
			data.put("qfile_name", fileNames.get(i));
			data.put("origine", origineNames.get(i));
			sqlSession.insert(namespace+"qna_mod_add_img", data);
		}
	}
	
	//qna 내용 수정
	public void qnaMod(QnaDTO qnaDTO){
		sqlSession.update(namespace+"qna_mod", qnaDTO);
	}
	
	public int qnaReply(QnaDTO qnaDTO) throws Exception{
		return sqlSession.insert(namespace+"qnaReply", qnaDTO);
	}
	
	public List<QnaDTO> qnaList_writer(PageMaker pageMaker, String q_writer) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pageMaker", pageMaker);
		data.put("q_writer", q_writer);
		return sqlSession.selectList(namespace+"writer_search", data);
	}
	
	public List<QnaDTO> qnaList_title(PageMaker pageMaker, String q_title) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pageMaker", pageMaker);
		data.put("q_writer", q_title);
		return sqlSession.selectList(namespace+"writer_search", data);
	}
	
	public List<QnaDTO> qnaList_contents(PageMaker pageMaker, String q_contents) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pageMaker", pageMaker);
		data.put("q_writer", q_contents);
		return sqlSession.selectList(namespace+"writer_search", data);
	}
	
	public int title_search(String q_title) throws Exception{
		return sqlSession.selectOne(namespace+"writer_search", q_title);
	}
	
	public int contents_search(String q_contents) throws Exception{
		return sqlSession.selectOne(namespace+"writer_search", q_contents);
	}
	
	public int writer_search(String q_writer) throws Exception{
		return sqlSession.selectOne(namespace+"writer_search", q_writer);
	}
}
