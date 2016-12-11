package com.game.product;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ReplyService {

	@Autowired
	private ReplyDAO replyDAO;

	//댓글 작성
	public void replyWrite(ReplyDTO replyDTO, int pro_num,  Model model) throws Exception{
		replyDAO.replyWrite(replyDTO);
		List<ReplyDTO> ar = replyDAO.replyList(pro_num);
		ArrayList<Like_countDTO> ar1 = new ArrayList<Like_countDTO>();
		for(int i=0; i<ar.size();i++){
			replyDAO.replyLikeCountSelect(ar.get(i).getR_num());
			//System.out.println(ar.get(i).getR_num());
			ar1.add(replyDAO.replyLikeCountSelect(ar.get(i).getR_num()));
		}
		model.addAttribute("replyList", ar);
		model.addAttribute("reply_like_count", ar1);
	}

	//댓글 리스트
	public void replyList(int pro_num, Model model) throws Exception{
		
		List<ReplyDTO> ar = replyDAO.replyList(pro_num);
		ArrayList<Like_countDTO> ar1 = new ArrayList<Like_countDTO>();
		for(int i=0; i<ar.size();i++){
			replyDAO.replyLikeCountSelect(ar.get(i).getR_num());
			//System.out.println(ar.get(i).getR_num());
			ar1.add(replyDAO.replyLikeCountSelect(ar.get(i).getR_num()));
		}
		model.addAttribute("replyList", ar);
		model.addAttribute("reply_like_count", ar1);
	}

	//댓글 삭제
	public void replyDelete(int pro_num ,int r_num, Model model) throws Exception{
		replyDAO.replyDelete(r_num);
		List<ReplyDTO> ar = replyDAO.replyList(pro_num);
		ArrayList<Like_countDTO> ar1 = new ArrayList<Like_countDTO>();
		for(int i=0; i<ar.size();i++){
			replyDAO.replyLikeCountSelect(ar.get(i).getR_num());
			//System.out.println(ar.get(i).getR_num());
			ar1.add(replyDAO.replyLikeCountSelect(ar.get(i).getR_num()));
		}
		model.addAttribute("replyList", ar);
		model.addAttribute("reply_like_count", ar1);
	}

	//좋아요 기능
	public void replyLike(int pro_num, int r_num, String m_id, Model model) throws Exception{
		replyDAO.replyLike(pro_num, r_num, m_id);
		replyDAO.replyLikeCountAdd(pro_num, r_num);
		List<ReplyDTO> ar = replyDAO.replyList(pro_num);
		ArrayList<Like_countDTO> ar1 = new ArrayList<Like_countDTO>();
		for(int i=0; i<ar.size();i++){
			replyDAO.replyLikeCountSelect(ar.get(i).getR_num());
			//System.out.println(ar.get(i).getR_num());
			ar1.add(replyDAO.replyLikeCountSelect(ar.get(i).getR_num()));
		}
		model.addAttribute("replyList", ar);
		model.addAttribute("reply_like_count", ar1);
	}
	//싫어요 기능
	public void replyHate(int pro_num, int r_num, String m_id, Model model) throws Exception{
		replyDAO.replyHate(pro_num, r_num, m_id);
		List<ReplyDTO> ar = replyDAO.replyList(pro_num);
		model.addAttribute("replyList", ar);
	}
}
