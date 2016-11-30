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
	
	
	@RequestMapping(value="/join" , method = RequestMethod.GET)
	public void join(){}
	
	
	//회원가입(ajax)
	@RequestMapping(value="/join" , method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> join(MemberDTO mDto, Model model){
		int result=0;
		
		try {
			result = memberService.join(mDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = 0;
		}
		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	//로그인	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void login(){}
	
	
	//로그인 ajax
	@RequestMapping(value="/login", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public void login(MemberDTO mDto){
		
	}
	
	//회원id체크
	@RequestMapping(value="/idCheck", produces="application/json; charset=utf-8", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> idcheck(@RequestParam(defaultValue="") String id, Model model){
		
		MemberDTO mDto = new MemberDTO();
		try {
			mDto = memberService.idcheck(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mDto = null;
		}
		int result = 0;
		if(mDto != null){
			result = 1;
		}else{
			result = 0;
		}		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	

}
