package com.booking.model.service;

import java.util.Base64;
import java.util.List;

import com.booking.model.DAO_interface.BookingDAO_interface;
import com.booking.model.bean.BookingBean;
import com.booking.model.dao.BookingDAOjdbc;
import com.manager.model.ManagerVO;


public class BookingService {
	private BookingDAO_interface bookingDAO = new BookingDAOjdbc();
	
	public List<BookingBean> select_all(){
		List<BookingBean> result = bookingDAO.select_all();
		return result;
	}
	
	public List<ManagerVO> select_all_man(){
		List<ManagerVO> result = bookingDAO.selectAllMan();
		return result;
	}
	
	public BookingBean select_id(BookingBean bean){
		return bookingDAO.select_ID(bean.getBooking_id());
	}
	
	public List<BookingBean> select_man(BookingBean bean){
		List<BookingBean> result = null;
		if(bean != null && bean.getMan_id() > 0) {
			List<BookingBean> temp = bookingDAO.select_man(bean.getMan_id());
			if (temp != null) {
				
				return temp;
				
				
			}
		}else {
			result = bookingDAO.select_all();
		}
		return result;
	}
	
	public List<BookingBean> select_email(BookingBean bean){
		List<BookingBean> result = null;
		if(bean != null && bean.getEmail().length()>0) {
			List<BookingBean> temp = bookingDAO.select_email(bean.getEmail());
			if (temp != null) {
				result = temp;
			}
		}else {
			result = bookingDAO.select_all();
		}
		return result;
	}
	
	public List<BookingBean> insert(BookingBean bean) {
		List<BookingBean> result =null;
		if(bean != null) {
			if(bookingDAO.insert(bean)==1) {
				System.out.println("Insert Success");
				result = bookingDAO.select_man(bean.getMan_id());
			}
		}else {
			result = bookingDAO.select_all();
		}
		return result;
	}
	
	public List<BookingBean> update(BookingBean bean) {
		List<BookingBean> result = null;
		System.out.println("DAO_Update:"+bean);
		if(bean != null) {
			bean = bookingDAO.update_man(
					bean.getBooking_id(), 
					bean.getBstatue());
			
				
		}
		result = bookingDAO.select_man(bean.getMan_id());
		return result;
	}
	
	public boolean delete(BookingBean bean) {
		if(bean != null) {
			return bookingDAO.delete(bean.getBooking_id());
		}
		return false;
	}
	
	public String toBase64(byte[] byteb) {
		return Base64.getEncoder().encodeToString(byteb);
	}
}

