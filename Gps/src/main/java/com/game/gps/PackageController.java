package com.game.gps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.game.package_pro.PackageService;

@Controller
@RequestMapping("/package_pro")
public class PackageController {
	
	@Autowired
	private PackageService packageService;
	
	
}
