package com.game.gps;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/index")
	public void index(){}
	
	@RequestMapping(value="/header")
	public String header(){
		return "/common/header";
	}
	
	@RequestMapping(value="/footer")
	public String footer(){
		return "/common/footer";
	}
	
	@RequestMapping(value="/cart")
	public String cart(){
		return "/cart_favorite/cart";
	}
	
	@RequestMapping(value="/favorite")
	public String favorite(){
		return "/cart_favorite/favorite";
	}
	
	@RequestMapping(value="/user_menu_bar")
	public String user_menu_bar(){
		return "/common/user_menu_bar";
	}
	
	@RequestMapping(value="/productList")
	public String productList(){
		return "/List/productList";
	}
	
	@RequestMapping(value="/top_btn")
	public String top_btn(){
		return "/common/top_btn";
	}
	
	@RequestMapping(value="/admin_main")
	public String admin_main(){
		return "/admin/admin_main";
	}
	
	@RequestMapping(value="/support")
	public String support(){
		return "/common/support";
	}
	
}

