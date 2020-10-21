package com.booking.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.booking.model.bean.BookingBean;
import com.booking.model.bean.WorkdateBean;
import com.booking.model.service.BookingService;
import com.booking.model.service.WorkdateService;
import com.manager.model.ManagerService;
import com.manager.model.ManagerVO;

@WebServlet(urlPatterns = {"/booking/avalible.do"})
public class WorkdateServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("select_one".equals(action)) { // 靘Booking.jsp�����
			

//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//			
			try {
//				/***************************1.��隢��****************************************/
				Integer manID = new Integer(req.getParameter("man_id"));
				
				/***************************2.���閰Ｚ���****************************************/
				WorkdateService workSvc = new WorkdateService();
				WorkdateBean wBean = new WorkdateBean();
				List<WorkdateBean> subList = workSvc.getOne(manID);
				for(WorkdateBean wb :subList) {
					System.out.println("subList : " + wb);
				}
				
				List< List<String>> wList = new ArrayList<List<String>>();
				Map<String,List<String>> wMap= new HashMap<String,List<String>>();
				if(subList.size()>0) {
//					wList = new ArrayList<WorkdateBean>();
//					wBean.setMan_id(manID);
//					wList.add(wBean);
					
					String dateKey = null;
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					
					for(WorkdateBean wb :subList) {
						String wkey = (wb.getMan_id()+sdf.format(wb.getWdate()));
						if(! wkey.equals(dateKey)){
							dateKey=wkey;
							List<String> sList = new ArrayList<String>();
							sList.add(Integer.toString(wb.getMan_id()));
							sList.add(sdf.format(wb.getWdate()));
							sList.add(wb.getWtime());
							wMap.put(wkey, sList);
						}else {
							wMap.get(wkey).add(wb.getWtime());
						}
					}
				}
				req.setAttribute("wMap", wMap); 
				req.setAttribute("man_id", manID);
				String url = "/front_end/avaliblelistone.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
//
//				/***************************�隞���隤方���**********************************/
			} catch (Exception e) {
				System.out.println("�瘜���耨������:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/listManager.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("get_date".equals(action)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			try {
				Integer auth = Integer.parseInt(req.getParameter("svcType"));
				Date bdate =  new Date(sdf.parse(req.getParameter("wdate")).getTime());
				System.out.println("Auth:"+auth+" Date:"+bdate);
				WorkdateService workSvc = new WorkdateService();
				ManagerService mSvc = new ManagerService();
				List<ManagerVO> mlist=null;
				List<WorkdateBean> wList= workSvc.getAll().stream()
															.filter(e -> e.getWdate().equals(bdate))
															.collect(Collectors.toList());
				if(auth!=0) {
					 mlist =mSvc.getManagerDetail().stream()
							.filter(e->e.getAuthority()==auth)
							.collect(Collectors.toList());
				}else {
					 mlist =mSvc.getManagerDetail();
				}
				
				for(ManagerVO mmbean : mlist) {
					System.out.println("servlet_M"+mmbean.getAccount());
				}
				Map<Integer, List<String>> mmap = new HashMap<Integer, List<String>>();
				for(ManagerVO mvo : mlist) {
					Integer mid = (int) mvo.getMan_id();
					Integer authInt =mvo.getAuthority();
					List<String> sublist = new ArrayList<String>();
					sublist.add(mvo.getName());
					sublist.add(authInt.toString());
					sublist.add(mvo.getDescription());
					mmap.put(mid , sublist);
					
				}
//				for(int i=0;i<wList.size();i++) {
//					System.out.println("mmap Test");
//					System.out.println(mmap.get(wList.get(i).getMan_id()).get(0));
//					System.out.println(mmap.get(wList.get(i).getMan_id()).get(1));
//					System.out.println(mmap.get(wList.get(i).getMan_id()).get(2));
//					System.out.println(wList.get(i).toString());
//				}
					req.setAttribute("mmap", mmap); //頧漱�����ap
					req.setAttribute("wList", wList); //頧漱List
//					String url = "/front_end/booking/List_by_Date.jsp";
					String url ="/front_end/listbydate.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
					
			
				
									
												
				
//				req.setAttribute("dList", dList); 
//				String url = "/booking/avalible_listone.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// ����漱 update_emp_input.jsp
//				successView.forward(req, res);
				
			}catch(Exception e) {
				System.out.println("Error:");
				e.printStackTrace();
				String url = "/front_end/listManager.jsp";
				RequestDispatcher filedView = req.getRequestDispatcher(url);
				filedView.forward(req, res);
			}
		}
		
		if ("insert".equals(action)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			try {
				Integer man_id = Integer.parseInt(req.getParameter("man_id"));
				Date wdate = new Date(sdf.parse(req.getParameter("wdate")).getTime());
				String wtime = req.getParameter("wtime");
				WorkdateService workSvc = new WorkdateService();
				
				if(workSvc.insert(man_id, wdate, wtime)) {
					String url = "/back_end/booking/WorkingDateSet.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
				}else {
					String url = "/back_end/booking/WorkingDateSet.jsp";
					RequestDispatcher filedView = req.getRequestDispatcher(url);
					filedView.forward(req, res);
				}
				
			}catch(SQLException sqe) {
				System.out.println("時段重複");
				String url = "/back_end/booking/WorkingDateSet.jsp";
				RequestDispatcher filedView = req.getRequestDispatcher(url);
				filedView.forward(req, res);
				sqe.printStackTrace();
			}catch(Exception e) {
				System.out.println("Error:");
				e.printStackTrace();
				String url = "/back_end/booking/WorkingDateSet.jsp";
				RequestDispatcher filedView = req.getRequestDispatcher(url);
				filedView.forward(req, res);
			}
		}
		
	}

}
