package com.booking.model.DAO_interface;

import java.util.List;

import com.booking.model.bean.BookingBean;
import com.manager.model.ManagerVO;


public interface BookingDAO_interface {
	public List<BookingBean> select_man(int man_id);
	public List<BookingBean> select_email(String email);
	public List<BookingBean>  select_all();
	public BookingBean update_man(String book_id, String bstatue);
	public int insert(BookingBean bbean);
	public boolean delete(String booking_id);
	public BookingBean select_ID (String booking_id);
	public List<ManagerVO> selectAllMan();
}
