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
//	@Override
//	public int hashCode() {
//		final int prime = 31;
//		int result = 1;
//		result = prime * result + man_id;
//		result = prime * result + ((wdate == null) ? 0 : wdate.hashCode());
//		result = prime * result + ((wtime == null) ? 0 : wtime.hashCode());
//		return result;
//	}
//	@Override
//	public boolean equals(Object obj) {
//		if (this == obj)
//			return true;
//		if (obj == null)
//			return false;
//		if (getClass() != obj.getClass())
//			return false;
//		WorkdateBean other = (WorkdateBean) obj;
//		if (man_id != other.man_id)
//			return false;
//		if (wdate == null) {
//			if (other.wdate != null)
//				return false;
//		} else if (!wdate.equals(other.wdate))
//			return false;
//		if (wtime == null) {
//			if (other.wtime != null)
//				return false;
//		} else if (!wtime.equals(other.wtime))
//			return false;
//		return true;
//	}
	
//	public boolean equals(WorkdateBean O) {
//		if(O.man_id == this.man_id && O.wdate.equals(this.wdate ) && this.wtime.equals(O.wdate)) {
//			return true;
//		}
//		
//		return false;
//	}
	
	
	
}
