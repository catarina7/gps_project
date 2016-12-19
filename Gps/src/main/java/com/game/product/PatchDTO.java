package com.game.product;

public class PatchDTO {
	private int patch_num;
	private int pro_num;
	private String patch_file_name;
	private String patch_origine_name;
	
	public int getPatch_num() {
		return patch_num;
	}
	public void setPatch_num(int patch_num) {
		this.patch_num = patch_num;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public String getPatch_file_name() {
		return patch_file_name;
	}
	public void setPatch_file_name(String patch_file_name) {
		this.patch_file_name = patch_file_name;
	}
	public String getPatch_origine_name() {
		return patch_origine_name;
	}
	public void setPatch_origine_name(String patch_origine_name) {
		this.patch_origine_name = patch_origine_name;
	}

}
