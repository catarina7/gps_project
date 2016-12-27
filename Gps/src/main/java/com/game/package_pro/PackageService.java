package com.game.package_pro;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PackageService {
	
	@Autowired
	private PackageDAO packageDAO;
	
	//패키지 게임 생성
	public int packWrite(PackageDTO packageDTO) throws Exception{
		return packageDAO.packageWrite(packageDTO);
	}
	
	//패키지 수정
	public int packMod(PackageDTO packageDTO) throws Exception{
		return packageDAO.packageMod(packageDTO);
	}
	
	//패키지 삭제
	public int packDelete(int pack_num) throws Exception{
		return packageDAO.packageDelete(pack_num);
	}
	
	//서브 카테고리로 패키지게임 목록 가져오기
	public List<PackageDTO> packList(String sub_category) throws Exception{
		return packageDAO.packageList(sub_category);
	}
	
	//패키지 구매 시 가져오기
	public List<PackageDTO> packBuy(int pack_num) throws Exception{
		return packageDAO.packageBuy(pack_num);
	}
	
	
}
