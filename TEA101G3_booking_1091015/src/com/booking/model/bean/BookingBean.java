package com.booking.model.bean;

import java.sql.Date;


public class BookingBean {
	private String booking_id; //預約流水號
	private String btime;	//預約時段
	private Date bdate;	//預約日期
	private int man_id; //工作人員ID
	private String email; //會員帳號
	private String bstatue; //會員出席狀態
	
	public String getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(String booking_id) {
		this.booking_id = booking_id;
	}
	public String getBtime() {
		return btime;
	}
	public void setBtime(String btime) {
		this.btime = btime;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate)  {
		this.bdate = bdate;
	}
	public int getMan_id() {
		return man_id;
	}
	public void setMan_id(int man_id) {
		this.man_id = man_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String toString() {
		String rest = "Booking_id:"+booking_id + " Manager:"+man_id + " Member:" + email + " Booking date:" + bdate+" "+btime+"Booking Statue:"+bstatue;
		return rest;
		
	}
	public String getBstatue() {
		return bstatue;
	}
	public void setBstatue(String bstatue) {
		this.bstatue = bstatue;
	}
	
	
	
}
