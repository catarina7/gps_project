package com.game.mart;

import java.sql.Date;


public class PurchaseDTO {
	private int pur_num;
	private String m_id;
	private String pro_num;
	private int total_price;
	private Date reg_date;
	private String status;
	private String pur_kind;
	private int m_millage;
	
	public int getPur_num() {
		return pur_num;
	}
	public void setPur_num(int pur_num) {
		this.pur_num = pur_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getPro_num() {
		return pro_num;
	}
	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPur_kind() {
		return pur_kind;
	}
	public void setPur_kind(String pur_kind) {
		this.pur_kind = pur_kind;
	}
	public int getM_millage() {
		return m_millage;
	}
	public void setM_millage(int m_millage) {
		this.m_millage = m_millage;
	}
	
	
	
	
	
}
