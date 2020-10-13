package com.booking.model.bean;

import java.util.List;

public class WorkdateBean {
	private String wtime;
	private java.sql.Date wdate;
	private int man_id;
	private String account;
	
	
	public String getWtime() {
		return wtime;
	}
	public void setWtime(String wtime) {
		this.wtime = wtime;
	}
	public java.sql.Date getWdate() {
		return wdate;
	}
	public void setWdate(java.sql.Date wdate) {
		this.wdate = wdate;
	}
	public int getMan_id() {
		return man_id;
	}
	public void setMan_id(int man_id) {
		this.man_id = man_id;
	}
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String toString() {
		return "Working Date: Manger:"+ this.man_id +"ACCOUNT"+this.account+ " Avalible date:" + this.wdate + ", " + this.wtime;
		
	}
	
	public boolean equals(WorkdateBean O) {
		if(O.man_id == this.man_id && O.wdate.equals(this.wdate ) && this.wtime.equals(O.wdate)) {
			return true;
		}
		
		return false;
	}
	
}
