package com.game.purchase;

import java.sql.Date;

public class PurchaseDTO {
	private int pur_num;
	private String M_id;
	private int pro_num;
	private int total_price;
	private Date teg_date;
	private String status;
	
	
	
	
	
	public int getPur_num() {
		return pur_num;
	}
	public void setPur_num(int pur_num) {
		this.pur_num = pur_num;
	}
	public String getM_id() {
		return M_id;
	}
	public void setM_id(String m_id) {
		M_id = m_id;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public Date getTeg_date() {
		return teg_date;
	}
	public void setTeg_date(Date teg_date) {
		this.teg_date = teg_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
