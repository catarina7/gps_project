package com.game.product;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	public int productWrite(ProductDTO productDTO, MultipartHttpServletRequest mr, HttpSession session) throws Exception{
		String path = session.getServletContext().getRealPath("resources/upload");
		List<MultipartFile> file = mr.getFiles("file");
		
		//실제 저장된 파일네임
		ArrayList<String> fileNames = new ArrayList<>();
		
		for(int i=0;i<file.size();i++){
			MultipartFile mf = file.get(i);
			String fileName = UUID.randomUUID().toString()+"_"+mf.getOriginalFilename();
			File f = new File(path, fileName);
			mf.transferTo(f);
			fileNames.add(fileName);
		}
		return productDAO.productWrite(productDTO, fileNames);
	}
}
