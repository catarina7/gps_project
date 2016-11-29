package com.game.gps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.member.MemberDTO;
import com.game.member.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value="/join")
	public void join(){}
	
	
	
	
	//회원id체크
	@RequestMapping(value="/idCheck", produces="application/json; charset=utf-8", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> idcheck(@RequestParam(defaultValue="") String id, Model model){
		
		MemberDTO mDto = new MemberDTO();
		mDto = memberService.idcheck(id);
		int result = 0;
		if(mDto != null){
			result = 0;
		}else{
			result = 1;
		}		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	

}
