package com.booking.model.service;

import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.annotation.WebServlet;

import com.booking.model.bean.BookingBean;
import com.booking.model.bean.WorkdateBean;
import com.booking.model.dao.BookingDAOjdbc;
import com.booking.model.dao.WorkdateDAOjdbc;
import com.manager.model.ManagerService;
import com.manager.model.ManagerVO;


public class WorkdateService {
	private WorkdateDAOjdbc workdateDAO = new WorkdateDAOjdbc();
	BookingDAOjdbc bookDAO = new BookingDAOjdbc(); 
	List<BookingBean> blist = null;
	
	public List<WorkdateBean> getAll(){
		List<WorkdateBean> rsList = workdateDAO.Bequals();
//		for(WorkdateBean wbean : rsList) {
//			System.out.println("Service_getAll:"+wbean);
//		}
		return rsList;
	}
	
	public List<WorkdateBean> selectAll(){
		return workdateDAO.getAll();
	}
	
	
	
	
	public List<WorkdateBean> getOne(int man_id){
		blist = bookDAO.select_man(man_id);
		List<WorkdateBean> wList = null;
		if(blist.size()==0) {
			wList = workdateDAO.select(man_id);
				return wList;
		}
		wList = new ArrayList<WorkdateBean>();
		wList = workdateDAO.Bequals(blist);
		
//		for(WorkdateBean wb : wList) {
//			System.out.println("Workdate service:"+wb);
//		}
		return wList;
	}
	
	public boolean insert(int man_id, Date wdate, String wtime) throws SQLException{
		WorkdateBean bean = new WorkdateBean();
		ManagerService mSvc = new ManagerService();
		ManagerVO mVO = mSvc.getAll().stream()
									.filter(p -> p.getMan_id()== man_id)
									.findFirst().get();
		bean.setMan_id(man_id);
		bean.setAccount(mVO.getAccount());
		bean.setWdate(wdate);
		bean.setWtime(wtime);
		System.out.println("Servlet insert" + bean);
		if(bean != null) {
			if(workdateDAO.insert(bean)) {
				System.out.println("Insert success");
				return true;
			}
				
		}
		System.out.println("Failed");
		return false;
	}
	
	public List<WorkdateBean> delete(WorkdateBean bean){
		List<WorkdateBean> result = null;
		if(bean != null) {
			if(workdateDAO.delete(bean)) {
				System.out.println("Delete success");
			}
				
		}
		result = workdateDAO.getAll();
		return result;
	}
	
	public List select_man_work(){
		List aList=workdateDAO.select_all_man();
		
		
		return aList;
		
	}
}
