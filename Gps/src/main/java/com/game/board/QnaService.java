package com.game.board;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.game.util.PageMaker;

@Service
public class QnaService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	public int qnaWrite(QnaDTO qnaDTO, MultipartHttpServletRequest mr, HttpSession session ) throws Exception{
		String path = session.getServletContext().getRealPath("/resources/upload");
		List<MultipartFile> file = mr.getFiles("file");
		
		//실제 저장 파일
		ArrayList<String> qfile_name = new ArrayList<String>();
		//올릴 때 파일
		ArrayList<String> qorigine_name = new ArrayList<String>();
		
		for(int i=0;i<file.size();i++){
			MultipartFile mf = file.get(i);
			String fileName = UUID.randomUUID().toString()+"_"+mf.getOriginalFilename();
			String origineNames = mf.getOriginalFilename();
			File f = new File(path, fileName);
			
			//UUID 붙은 file
			mf.transferTo(f);
			
			qfile_name.add(fileName);
			qorigine_name.add(origineNames);
		}
		return qnaDAO.qnaWrite(qnaDTO, qfile_name, qorigine_name);
	}
	
	//qna리스트
	public void qnaList(int curPage, int perPage, Model model) throws Exception{
		
		//qna 글 갯수가져오기
		int totalCount = qnaDAO.qnaCount();
		PageMaker pageMaker = new PageMaker();
		System.out.println("(service)curPage :" + curPage);
		pageMaker.setCurPage(curPage);
		System.out.println("(service)curPage :" + pageMaker.getCurPage());
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		List<QnaDTO> ar = qnaDAO.qnaList(pageMaker);
		
		model.addAttribute("qnaList", ar);
		model.addAttribute("pageMaker", pageMaker);
		}
	
	//View
	public void qnaView(int curPage, int perPage, int q_num, Model model) throws Exception{
		qnaDAO.qnaCounts(q_num);
		int totalCount = qnaDAO.qnaView_imgCount(q_num);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		//View 일반
		QnaDTO qnaDTO = qnaDAO.qnaView(q_num);
		//View 사진
		List<QnaFileDTO> ar = qnaDAO.qnaViewImg(pageMaker, q_num);
		
		model.addAttribute("pageImg", pageMaker);
		model.addAttribute("qnaView", qnaDTO);
		model.addAttribute("qnaImg", ar);
		
	}
	
	//Delete
	public int qnaDelete(int q_num) throws Exception{
		return qnaDAO.qnaDelete(q_num);
	}
	
	//조회수
	public int qnaCounts(int q_num) throws Exception{
		return qnaDAO.qnaCounts(q_num);
	}
	
	//mod에서 가져오는 것
	public void qnaMod(int q_num, Model model) throws Exception{
		QnaDTO qnaDTO = qnaDAO.qnaView(q_num);
		List<QnaFileDTO> modImg = qnaDAO.qnaModImg(q_num);
		model.addAttribute("qnaView", qnaDTO);
		model.addAttribute("qna_mod_img", modImg);
	}
	
	//mod에 넣는 것
	public void qnaModify(QnaDTO qnaDTO, int q_num, MultipartHttpServletRequest mr, HttpSession session) throws Exception{
		String path = session.getServletContext().getRealPath("resources/upload");
		List<MultipartFile> file = mr.getFiles("file");
		
		//실제 저장된 파일
		ArrayList<String> fileNames = new ArrayList<String>();
		//올릴 때 파일
		ArrayList<String> origineNames = new ArrayList<String>();
		
		for(int i=0;i<file.size();i++){
			MultipartFile mf = file.get(i);
			String fileName = UUID.randomUUID().toString()+"_"+mf.getOriginalFilename();
			String origineName = mf.getOriginalFilename();
			File f = new File(path, fileName);
			
			mf.transferTo(f);
			
			fileNames.add(fileName);
			origineNames.add(origineName);	
		}
		qnaDAO.qnaMod(qnaDTO);
		qnaDAO.qnaModAddImg(q_num, fileNames, origineNames);
	}
	
	//체크 이미지 삭제
	public void qnaModDeleteList(List<Integer> valueArr, int q_num, Model model) throws Exception{
		qnaDAO.qnaModDeleteList(valueArr);
		List<QnaFileDTO> modImg = qnaDAO.qnaModImg(q_num);
		model.addAttribute("qna_mod_img", modImg);
	}
	
	public int qnaReply(QnaDTO qnaDTO) throws Exception{
		this.qnaDAO.qnaStep(qnaDTO);
		return qnaDAO.qnaReply(qnaDTO);
	}

}
