package com.game.package_pro;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
	public void packList(String sub_category, Model model) throws Exception{
		ArrayList<PackageDTO> ar = new ArrayList<>();
		ar = packageDAO.packageList(sub_category);
		model.addAttribute("package_pro", ar);
	}
	
	//패키지 구매 시 가져오기
	public void packBuy(int pack_num, Model model) throws Exception{
		PackageDTO pack = new PackageDTO();
		pack = packageDAO.packageBuy(pack_num);
		
		String pro_num = packageDAO.packageProduct(pack_num);
		
		ArrayList<String> ar = new ArrayList<>();
		StringTokenizer st = new StringTokenizer(pro_num, ":");
		
		while(st.hasMoreTokens()){
			String product = st.nextToken();
			ar.add(product);
		}
		
		model.addAttribute("package_product", ar); //상품번호 자른 것
		model.addAttribute("package_buy", pack); //모든 패키지 정보
	}
	
	
}
