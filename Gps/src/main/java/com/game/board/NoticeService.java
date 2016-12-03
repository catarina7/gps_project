package com.game.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.game.util.PageMaker;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;	
	
	public NoticeDTO noticeView(int n_num) throws Exception{
		return noticeDAO.noticeView(n_num);
	}
	
	public int noticeWrite(NoticeDTO noticeDTO) throws Exception{
		return noticeDAO.noticeWrite(noticeDTO);
	}
	
	public int noticeUpdate(NoticeDTO noticeDTO) throws Exception{
		return noticeDAO.noticeUpdate(noticeDTO);
	}
	
	public int noticeDelete(int n_num) throws Exception{
		return noticeDAO.noticeDelete(n_num);
	}
	
	public void noticeList(int curPage, int perPage, Model model) throws Exception{
		
		int totalCount = noticeDAO.noticeCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		model.addAttribute("noticeList", noticeDAO.noticeList(pageMaker));
		model.addAttribute("pageMaker", pageMaker); 
	}
	
	public int noticeMod(NoticeDTO noticeDTO) throws Exception{
		return noticeDAO.noticeMod(noticeDTO);
	}

}
