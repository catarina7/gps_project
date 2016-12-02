package com.game.gps;

import javax.servlet.http.HttpSession;

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
	public String join(){ 
		return "/member/join";
	}
	
	
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
	
	//회원id체크
	@RequestMapping(value="/idCheck", produces="application/json; charset=utf-8", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> idcheck(@RequestParam(defaultValue="") String id){
		
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
	
	//로그인	
		@RequestMapping(value="/login", method = RequestMethod.GET)
		public String login(){
			return "/member/login";
		}
	
	//로그인 ajax
	@RequestMapping(value="/login", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> login(MemberDTO mDto, HttpSession session){
		
		try {
			mDto = memberService.login(mDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int result = 0;
		if(mDto != null){
			result = 1;
			session.setAttribute("member", mDto);		
		}else{
			result = 0;
		}
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	//로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/index";
	}
	
	
	//약정넣기1
	@RequestMapping(value="/contract")
	public String contract(){
		return "/member/contract";
	}
	
	//약정넣기2
	@RequestMapping(value="/license")
	public String license(){
		return "/member/license";
	}
	
	
	//id찾기
	@RequestMapping(value="/searchid")
	public String searchid(){
		return "/member/searchid";
	}
	
	//id찾기(ajax)
	@RequestMapping(value="/searchId", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<MemberDTO> searchid(MemberDTO mDto){
		
		MemberDTO result = null;
		
		try {
			result = memberService.searchid(mDto);
			System.out.println(result.getM_id());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new ResponseEntity<MemberDTO>(result, HttpStatus.OK);
	}
	
	//pw찾기
	@RequestMapping(value="/searchpw")
	public String searchpw(){
		return "/member/searchpw";
	}
	
	

}
