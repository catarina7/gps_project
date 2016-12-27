package com.game.package_pro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PackageService {
	
	@Autowired
	private PackageDAO packageDAO;
	
	
}
