package com.game.gps;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.AlternativeJdkIdGenerator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.computer.ComputerDTO;
import com.game.member.MemberDTO;
import com.game.member.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	//회원정보 페이지 링크
	@RequestMapping(value="/member_info")
	public String member_info(){
		return "/member/member_info";
	}
	
	//컴퓨터 정보 수정 폼
	@RequestMapping(value="/computer_info")
	public String computer_info(){
		return "/member/computer_info";
	}
	
	
	//회원가입
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
		MemberDTO mDto2 = new MemberDTO();
		int result = 0; 
		try {
			mDto2 = memberService.login(mDto, session);
			if(mDto2 != null){
				result = 1;
			}else {
				result =0;
			}
			session.setAttribute("member", mDto2);		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result=0;
			e.printStackTrace();
		}
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	//로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		session.removeAttribute("member");
		session.removeAttribute("cominfo");
		return "redirect:/index";
	}
	
	
	//pw 확인
	@RequestMapping(value="pw_check")
	public String pw_chk(@RequestParam int category, Model model){
		
		model.addAttribute("category", category);		
		return "/member/pw_check";
	}
	
	//회원정보 보기
	@RequestMapping(value="mem_Info")
	public String mem_info(){
		return "/member/mem_info";
	}
	
	
	//회원정보 수정
	@RequestMapping(value="/mem_Mod")
	public String meminfo_mod(){
		return "/member/mem_mod";
	}
	
	@RequestMapping(value="/millage")
	public String mem_millage(){
		return "/member/mem_millage";
	}
	
	
	//회원정보 수정 (ajax)
	@RequestMapping(value="/MemMod", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> mem_mod(MemberDTO mDto, HttpSession session){
		
		int result = 0;
		
		try {
			result = memberService.memMod(mDto);
			mDto = memberService.idcheck(mDto.getM_id());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result == 0){
			result = 0;
		}else {
			session.removeAttribute("member");
			session.setAttribute("member", mDto);
		}		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	//비밀번호 수정하기 
	@RequestMapping(value="/pw_Mod")
	public String pwmod(){
		return "/member/pw_mod";
	}
	
	//탈퇴하기
	@RequestMapping(value="mem_Out")
	public String mem_out(){
		return "/member/mem_Out";
	}
	
	//탈퇴하기(ajax)
	@RequestMapping(value="/memOut", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> mem_out(MemberDTO mDto, HttpSession session){
		int result =0;
		
		try {
			result = memberService.memOut(mDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result == 0){
			result = 0;
		}else {
			session.removeAttribute("member");
		}
		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new ResponseEntity<MemberDTO>(result, HttpStatus.OK);
	}
	
	//pw찾기
	@RequestMapping(value="/searchPw")
	public String searchpw(){
		return "/member/searchpw";
	}
	
	
	//pw찾기 (ajax)
	@RequestMapping(value="/SearchPw", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> searchpw(MemberDTO mDto,  HttpServletRequest request){
		int result = 0;
		
		try {
			result = memberService.searchpw(mDto, request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result == 0 ){
			result = 0;
		}else{
			result = 1;
		}
		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	//컴퓨터 사양 넣기폼
	@RequestMapping(value="/comInfo" )
	public String comInfo(@RequestParam int m_num, Model model){
		model.addAttribute("m_num", m_num);
		return "/member/comInfo";
	}
	
	//컴퓨터 사양 넣기 
	@RequestMapping(value="/ComInfo", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> comInfo(ComputerDTO com){
		
		int result = 0;		
		try {
			result = memberService.cominfo(com);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	//컴퓨터 사양 수정하기 
	@RequestMapping(value="/ComMod", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> comMod(ComputerDTO com, HttpSession session){
		
		int result = 0;		
		try {
			result = memberService.comMod(com);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result == 0){
			result = 0;
		}else {
			session.removeAttribute("cominfo");
			session.setAttribute("cominfo", com);
		}
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	
	

}
