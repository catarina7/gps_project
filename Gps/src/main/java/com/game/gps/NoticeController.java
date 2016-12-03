package com.game.gps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.game.board.NoticeDTO;
import com.game.board.NoticeService;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	//List
	@RequestMapping(value="/noticeList")
	public String noticeList(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int perPage, Model model){
		
		try {
			noticeService.noticeList(curPage, perPage, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "notice/noticeList";
	}
	
	//View
	@RequestMapping(value="/noticeView")
	public String noticeView(@RequestParam("n_num") int n_num, Model model){
		
		try {
			model.addAttribute("noticeView", noticeService.noticeView(n_num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "notice/noticeView";
	}
	
	//Write
	@RequestMapping(value="/noticeWrite", method=RequestMethod.GET)
	public void noticeWrite(){}
	
	@RequestMapping(value="/noticeWrite", method=RequestMethod.POST)
	public String noticeWrite(NoticeDTO noticeDTO){
		
		try {
			noticeService.noticeWrite(noticeDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/notice/noticeList";
	}
	
	//Delete
	@RequestMapping(value="/noticeDelete")
	public String noticeDelete(@RequestParam("n_num") int n_num){
		try {
			noticeService.noticeDelete(n_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/notice/noticeList";
	}
	
	//Mod
	@RequestMapping(value="/noticeMod", method=RequestMethod.GET)
	public void noticeMod(){}
	
	@RequestMapping(value="/noticeMod" , method=RequestMethod.POST)
	public String noticeMod(NoticeDTO noticeDTO){
		try {
			noticeService.noticeMod(noticeDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/notice/noticeList";
	}
}