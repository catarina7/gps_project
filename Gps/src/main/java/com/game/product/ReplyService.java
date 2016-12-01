package com.game.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;
	
	public int replyWrite(ReplyDTO replyDTO){
		return replyDAO.replyWrite(replyDTO);
	}
	
	public int replyDelete(int r_num){
		return replyDAO.replyDelete(r_num);
	}
}
