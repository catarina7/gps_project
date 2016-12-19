package com.game.gps;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/company")
public class CompanyController {
	
	@RequestMapping(value="agreement")
	public String agreement(){
		return "/company/agreement";
	}
	
	@RequestMapping(value="alliance")
	public String alliance(){
		return "/company/alliance";
	}
	
	@RequestMapping(value="customer")
	public String customer(){
		return "/company/customer";
	}
	
	@RequestMapping(value="information")
	public String information(){
		return "/company/information";
	}
	
	@RequestMapping(value="/introduce")
	public String introduce(){
		return "/company/introduce";
	}
	
	@RequestMapping(value="/teenager")
	public String teenager(){
		return "/company/teenager";
	}
	
	//text file
	@RequestMapping(value="/intro")
	public String intro(){
		return "/company/com_text/intro";
	}
	
	@RequestMapping(value="/agree")
	public String agree(){
		return "/company/com_text/agree";
	}
	
	@RequestMapping(value="/teen")
	public String teen(){
		return "/company/com_text/teen";
	}
}
