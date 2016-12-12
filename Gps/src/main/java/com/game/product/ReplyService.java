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
		//like_hateDTO로  좋아요를 눌럿을때 r_num에서 id검색해준다.
		Like_hateDTO like_hateDTO = replyDAO.replyIdSearch(r_num, m_id);
		Like_countDTO count_search = replyDAO.replyCountCheck(r_num);
		
		//id가 없을때 즉 이 아이디로 처음 좋아요를 눌럿을때 좋아요 카운트,등록된다.
		if(like_hateDTO==null){
			
			//like_count에 아무것도 없을때
			if(count_search==null){
				//like_hate 테이블에 추가됨
				replyDAO.replyLike_insert(pro_num, r_num, m_id);
				//like_count 테이블에 추가됨
				replyDAO.replyLikeCountAdd(pro_num, r_num);
				
				//일반 댓글 리스트
				List<ReplyDTO> ar = replyDAO.replyList(pro_num);
				//좋아요 갯수 리스트
				ArrayList<Like_countDTO> ar1 = new ArrayList<Like_countDTO>();
				for(int i=0; i<ar.size();i++){
					ar1.add(replyDAO.replyLikeCountSelect(ar.get(i).getR_num()));
				}
				model.addAttribute("replyList", ar);
				model.addAttribute("reply_like_count", ar1);
			}
			//like_count에 이미 있으므로 update해줘야함
			else{
				//like_hate 테이블에 추가됨
				replyDAO.replyLike_insert(pro_num, r_num, m_id);
				//update
				replyDAO.replyUpdatePlus(count_search);
				
				//일반 댓글 리스트
				List<ReplyDTO> ar = replyDAO.replyList(pro_num);
				//좋아요 갯수 리스트
				ArrayList<Like_countDTO> ar1 = new ArrayList<Like_countDTO>();
				for(int i=0; i<ar.size();i++){
					ar1.add(replyDAO.replyLikeCountSelect(ar.get(i).getR_num()));
				}
				model.addAttribute("replyList", ar);
				model.addAttribute("reply_like_count", ar1);
			}
			
		}else{
			//이미 id가 있을때 즉 좋아요를 다시 누르면 취소가 된다.
			replyDAO.replyLikeCancel(r_num, m_id);
			replyDAO.replyUpdateMinus(count_search);
			
			//일반 댓글 리스트
			List<ReplyDTO> ar = replyDAO.replyList(pro_num);
			//좋아요 갯수 리스트
			ArrayList<Like_countDTO> ar1 = new ArrayList<Like_countDTO>();
			for(int i=0; i<ar.size();i++){
				ar1.add(replyDAO.replyLikeCountSelect(ar.get(i).getR_num()));
			}
			model.addAttribute("replyList", ar);
			model.addAttribute("reply_like_count", ar1);
		}
	}
}
