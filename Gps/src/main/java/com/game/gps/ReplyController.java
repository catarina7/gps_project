package com.game.gps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.product.ReplyDTO;
import com.game.product.ReplyService;

@Controller
@RequestMapping(value="/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	//댓글 작성
	@RequestMapping(value="/reply_write")
	public String replyWrite(ReplyDTO replyDTO, int pro_num, Model model){
		System.out.println("pro_num : " + pro_num);
		try {
			replyService.replyWrite(replyDTO, pro_num, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "reply/reply_result";
	}
	
	//댓글 리스트
	@RequestMapping(value="/reply_list")
	public String replyList(int pro_num, Model model){		
		try {
			replyService.replyList(pro_num, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return "reply/reply_result";
	}
	
	//댓글삭제
	@RequestMapping(value="/reply_delete")
	public String replyDelete(int pro_num ,int r_num, Model model){
		try {
			replyService.replyDelete(pro_num, r_num, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "reply/reply_result";
	}
	
	//좋아요 버튼
	@RequestMapping(value="/reply_like")
	public String replyLike(int pro_num, int r_num, String m_id, Model model){
		try {
			replyService.replyLike(pro_num, r_num, m_id, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "reply/reply_result";
	}
	
	//댓글 아이디 확인
	@RequestMapping(value="/reply_id_check", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> replyIdCheck(int pro_num, String r_writer){
		int result=replyService.replyIdCheck(pro_num, r_writer);
		System.out.println(result);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
}
