package com.game.package_pro;

public class PackageDTO {
	
	private int pack_num; // package 기본키
	private String pro_num; //상품 번호들
	private String pack_title; //패키지 이름
	private String pack_contents; //패키지 설명
	private int price; //패키지 가격
	private int total_price; //패키지 총 가격
	private int discount; //할인률
	private String sub_category; //구분 용
	private int millage; //마일리지
	
	
	
	
	
	public int getPack_num() {
		return pack_num;
	}
	public void setPack_num(int pack_num) {
		this.pack_num = pack_num;
	}
	public String getPro_num() {
		return pro_num;
	}
	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}
	public String getPack_title() {
		return pack_title;
	}
	public void setPack_title(String pack_title) {
		this.pack_title = pack_title;
	}
	public String getPack_contents() {
		return pack_contents;
	}
	public void setPack_contents(String pack_contents) {
		this.pack_contents = pack_contents;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getSub_category() {
		return sub_category;
	}
	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}
	public int getMillage() {
		return millage;
	}
	public void setMillage(int millage) {
		this.millage = millage;
	}
	
	
}
