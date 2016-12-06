package com.game.gps;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.game.board.QnaDTO;
import com.game.board.QnaService;

@Controller
@RequestMapping(value="/qna")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	//Write
	@RequestMapping(value="/qnaWrite", method=RequestMethod.GET)
	public void qnaWrite(){}
	@RequestMapping(value="/qnaWrite", method=RequestMethod.POST)
	public String qnaWrite(QnaDTO qnaDTO, MultipartHttpServletRequest mr, HttpSession session){
		
		try {
			qnaService.qnaWrite(qnaDTO, mr, session);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/qna/qnaList";
	}
	
	//List
	@RequestMapping(value="/qnaList")
	public String qnaList(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int perPage, Model model){
		
		try {
			System.out.println("(control)curPage : "+ curPage);
			qnaService.qnaList(curPage, perPage, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "qna/qnaList";
	}
	
	@RequestMapping(value="/qnaView")
	public String qnaView(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="1") int perPage, @RequestParam("q_num") int q_num, Model model){
		
		try {
			qnaService.qnaView(curPage, perPage, q_num, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "qna/qnaView";
	}
	
}
