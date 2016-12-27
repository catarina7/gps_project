package com.game.gps;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.game.package_pro.PackageDTO;
import com.game.package_pro.PackageService;

@Controller
@RequestMapping(value="/package_pro")
public class PackageController {
	
	@Autowired
	private PackageService packageService;
	
	@RequestMapping(value="/pack_write")
	public String pack_write(){
		return "/package_pro/pack_write";
	} 
	
	@RequestMapping(value="/packWrite", method=RequestMethod.POST)
	public String packWrite(PackageDTO packageDTO){
		
		try {
			 packageService.packWrite(packageDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/index";
	}
	
	@RequestMapping(value="/pack_mod")
	public String pack_mod(){
		return "/package_pro/pack_mod";
	}
	
	@RequestMapping(value="/packMod", method=RequestMethod.POST)
	public String packMod(PackageDTO packageDTO){
		try {
			packageService.packMod(packageDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/package_pro/pack_mod";
	}
	
	@RequestMapping(value="/packDelete")
	public String packDelete(@RequestParam int pack_num){
		try {
			packageService.packDelete(pack_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/admin/product_admin";
	}
	
	@RequestMapping(value="/packList")
	public String packList(@RequestParam int pro_num, Model model){
		try {
			packageService.packList(pro_num, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "package_pro/package_result";
	}
	
	@RequestMapping(value="/packBuy")
	public String packBuy(@RequestParam int pack_num, Model model){
		try {
			packageService.packBuy(pack_num, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/purchase/buy";
	}
}
