package com.game.product;

import java.sql.Date;

public class ReplyDTO {
	private int r_num;
	private int pro_num;
	private String r_writer;
	private String r_contents;
	private Date reg_date;
	private int r_score;
	private int r_likes;
	private int r_hate;
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public String getR_contents() {
		return r_contents;
	}
	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getR_score() {
		return r_score;
	}
	public void setR_score(int r_score) {
		this.r_score = r_score;
	}
	public int getR_likes() {
		return r_likes;
	}
	public void setR_likes(int r_likes) {
		this.r_likes = r_likes;
	}
	public int getR_hate() {
		return r_hate;
	}
	public void setR_hate(int r_hate) {
		this.r_hate = r_hate;
	}
	
}
