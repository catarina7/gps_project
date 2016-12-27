package com.game.gps;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="/packWrite")
	public int packWrite(PackageDTO packageDTO){
		
		int result = 0;
		
		try {
			result = packageService.packWrite(packageDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="/pack_mod")
	public String pack_mod(){
		return "/package_pro/pack_mod";
	}
	
	@RequestMapping(value="/packMod")
	public int packMod(PackageDTO packageDTO){
		int result = 0;
		try {
			result = packageService.packMod(packageDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value="/packDelete")
	public int packDelete(@RequestParam int pack_num){
		int result = 0;
		try {
			result = packageService.packDelete(pack_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value="/packList")
	public ArrayList<PackageDTO> packList(@RequestParam String sub_category){
		ArrayList<PackageDTO> pack = new ArrayList<>();
		try {
			pack = packageService.packList(sub_category);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pack;
	}
	
	@RequestMapping(value="/packBuy")
	public PackageDTO packBuy(@RequestParam int pack_num){
		PackageDTO pack = new PackageDTO();
		
		try {
			pack = packageService.packBuy(pack_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return pack;
	}
}
