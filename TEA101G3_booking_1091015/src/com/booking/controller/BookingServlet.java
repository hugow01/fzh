package com.booking.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.booking.model.bean.BookingBean;
import com.booking.model.service.BookingService;



@WebServlet(urlPatterns = {"/booking/booking.do"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 4 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = -5916617082851855058L;
	

		public void doGet(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {
			doPost(req, res);
		}

		public void doPost(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {

			req.setCharacterEncoding("UTF-8");
			String action = req.getParameter("action");
			
			if ("select_man_id".equals(action)) { // ���Booking.jsp嚙踝蕭��蕭��蕭嚙�
				

//				List<String> errorMsgs = new LinkedList<String>();
//				// Store this set in the request scope, in case we need to
//				// send the ErrorPage view.
//				req.setAttribute("errorMsgs", errorMsgs);
//				
				try {
//					/***************************1.嚙踐�蕭����蕭蹇蕭��****************************************/
					Integer manID = new Integer(req.getParameter("man_id"));
					
					/***************************2.嚙踝蕭��蕭���嚗綽蕭�嚙踝蕭****************************************/
					BookingService bookingSvc = new BookingService();
					BookingBean bBean = new BookingBean();
					bBean.setMan_id(manID);
					List<BookingBean> bList = bookingSvc.select_man(bBean);
					for(BookingBean bBean2 :bList) {
						System.out.println("Servlet"+ bBean2);
					}
					
					//					/***************************3.嚙踐�嚗瘀蕭�嚙踝蕭,��□嚙踐�蕭�瞍�(Send the Success view)************/
					req.setAttribute("bList", bList);         // ��嚙踐��蕭嚙踐□�嚙踝蕭�mpVO嚙踝��蕭,�謢塚req
					String url = "/front_end/booking/booking_listone.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 嚙踝蕭��蕭賹蕭�瞍� update_emp_input.jsp
					successView.forward(req, res);
//
//					/***************************嚙踝���□�嚙踝�蕭嚙踝���嚙踐嚙踝蕭**********************************/
				} catch (Exception e) {
//					errorMsgs.add("嚙踝���蕭謘潘蕭謅蕭蹓箄�剁蕭��蕭嚙踝�蕭�嚙踝蕭:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/booking/booking.jsp");
					failureView.forward(req, res);
				}
			}
			
			if ("getOne_byEmail".equals(action)) {
				String email = new String(req.getParameter("email"));
				System.out.println("Get by email:"+email);
				BookingService bookingSvc = new BookingService();
				BookingBean bBean = new BookingBean();
				bBean.setEmail(email);
				try {
					List<BookingBean> bList = bookingSvc.select_email(bBean);
					req.setAttribute("bList", bList);
					RequestDispatcher SuccessView = req
							.getRequestDispatcher("/front_end/protected/memberbooking.jsp");
					SuccessView.forward(req, res);
					
				} catch (Exception e) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/listManager.jsp");
					failureView.forward(req, res);
				}
			}
			
			if ("getOne_For_Update".equals(action)) { // ���Booking.jsp嚙踝蕭��蕭��蕭嚙�
				
				

//				List<String> errorMsgs = new LinkedList<String>();
//				// Store this set in the request scope, in case we need to
//				// send the ErrorPage view.
//				req.setAttribute("errorMsgs", errorMsgs);
//				
				try {
//					/***************************1.嚙踐�蕭����蕭蹇蕭��****************************************/
					String bookingID = new String(req.getParameter("bookingID"));
					String bookingStatue = new String(req.getParameter("bstatue"));
					System.out.println("Update:"+ bookingID);
					
					/***************************2.嚙踝蕭��蕭���嚗綽蕭�嚙踝蕭****************************************/
					BookingService bookingSvc = new BookingService();
					BookingBean bBean = new BookingBean();
					List<BookingBean> bList = null;
					bBean.setBooking_id(bookingID);
					bBean.setBstatue(bookingStatue);
					System.out.println("update Bean:"+bBean);
					bList = bookingSvc.update(bBean);
					req.setAttribute("bList", bList);
//									
//					/***************************3.嚙踐�嚗瘀蕭�嚙踝蕭,��□嚙踐�蕭�瞍�(Send the Success view)************/
					req.setAttribute("bBean", bBean);         // ��嚙踐��蕭嚙踐□�嚙踝蕭�mpVO嚙踝��蕭,�謢塚req
					String url = "/back_end/booking/booking_listone.jsp";
					System.out.println("URL"+url);
					RequestDispatcher successView = req.getRequestDispatcher(url);// 嚙踝蕭��蕭賹蕭�瞍� update_emp_input.jsp
					successView.forward(req, res);
//					res.setIntHeader("Refresh", 1);
//
//					/***************************嚙踝���□�嚙踝�蕭嚙踝���嚙踐嚙踝蕭**********************************/
				} catch (Exception e) {
//					errorMsgs.add("嚙踝���蕭謘潘蕭謅蕭蹓箄�剁蕭��蕭嚙踝�蕭�嚙踝蕭:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/booking/booking_listone.jsp");
					failureView.forward(req, res);
				}
			}
			
			if ("insert".equals(action)) { 
				List<String> errorMsgs = new LinkedList<String>();
				SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				

//				try {
					/***********************1.嚙踐�蕭����蕭蹇蕭�� - ��岳�嚙踐僱��嚙踝���嚙踐嚙踝蕭*************************/
					String man_id = req.getParameter("man_id");
					String email= req.getParameter("email");
					String wdate = req.getParameter("wdate");
					String wtime = req.getParameter("wtime");
					System.out.println("email:"+ email);
					System.out.println("wdate:"+wdate);
					System.out.println("wtime:"+wtime);
					
					
					java.sql.Date bdate = null;
					try {
						bdate = java.sql.Date.valueOf(wdate.trim());
					} catch (IllegalArgumentException e) {
						bdate=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請選擇時間!");
					}
					
					BookingBean bBean = new BookingBean();
					if("noLogin".equals(email)){
					res.sendRedirect(req.getContextPath()+"/front_end/login/login.jsp");
					return;
					}else {
					bBean.setMan_id(Integer.parseInt(man_id));
					bBean.setEmail(email);
					bBean.setBdate(bdate);
					bBean.setBtime(wtime);
//					System.out.println(bBean);
					
					}
		
					

					// Send the use back to the form, if there were errors
//					if (!errorMsgs.isEmpty()) {
////						req.setAttribute("bBean", bBean); // 嚙踐�蕭嚙踝��蕭�嚙踐僱�����嚙踝mpVO嚙踝��蕭,���蕭謢塚req
//						RequestDispatcher failureView = req
//								.getRequestDispatcher("/booking/booking.jsp");
//						failureView.forward(req, res);
//						return;
//					}
					
					/***************************2.嚙踝蕭��蕭����筆嚙踝嚙踝蕭***************************************/
					BookingService bookingSvc = new BookingService();
					System.out.println("Insert:"+bBean);
					List<BookingBean> bList=null;
					try {
						bList = bookingSvc.insert(bBean);
						for(BookingBean bb : bList) {
							System.out.println("Book Servlet bb: "+bb.getEmail());
						}
					} catch (SQLException e) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/booking/listManager.jsp");
						failureView.forward(req, res);
						e.printStackTrace();
					}
					
					/***************************3.嚙踐��竣嚙踝嚙踝蕭,��□嚙踐�蕭�瞍�(Send the Success view)***********/
					req.setAttribute("bList", bList); 
					String url = "/front_end/protected/memberbooking.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 嚙踐��等嚙踐�蕭賹蕭�嚙踝瞍彬istAllEmp.jsp
					successView.forward(req, res);				
					
					/***************************嚙踝���□�嚙踝�蕭嚙踝���嚙踐嚙踝蕭**********************************/
//				} catch (Exception e) {
//					errorMsgs.add(e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/booking/booking.jsp");
//					failureView.forward(req, res);
//				}
			}
			
			if ("getOne_For_Delete".equals(action)) { // ���Booking.jsp嚙踝蕭��蕭��蕭嚙�
				
				

//				List<String> errorMsgs = new LinkedList<String>();
//				// Store this set in the request scope, in case we need to
//				// send the ErrorPage view.
//				req.setAttribute("errorMsgs", errorMsgs);
//				
				try {
//					/***************************1.嚙踐�蕭����蕭蹇蕭��****************************************/
					String bookingID = new String(req.getParameter("bookingID"));
					System.out.println("Delete:"+ bookingID);
					
					/***************************2.嚙踝蕭��蕭���嚗綽蕭�嚙踝蕭****************************************/
					BookingService bookingSvc = new BookingService();
					BookingBean bBean = new BookingBean();
					bBean.setBooking_id(bookingID);
					System.out.println(bookingSvc.delete(bBean));
					if(true) {
						/***************************3.嚙踐�嚗瘀蕭�嚙踝蕭,��□嚙踐�蕭�瞍�(Send the Success view)************/
//						String url = "/booking/booking.jsp";
						String url = req.getRequestURI();
						HttpSession session = req.getSession();
						System.out.println(url);
						RequestDispatcher successView = req.getRequestDispatcher(url);// 嚙踝蕭��蕭賹蕭�瞍� update_emp_input.jsp
						successView.forward(req, res);
					};
//									
//					
	//
//					/***************************嚙踝���□�嚙踝�蕭嚙踝���嚙踐嚙踝蕭**********************************/
				} catch (Exception e) {
//					errorMsgs.add("嚙踝���蕭謘潘蕭謅蕭蹓箄�剁蕭��蕭嚙踝�蕭�嚙踝蕭:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/emp/memberbooking.jsp");
					failureView.forward(req, res);
				}
			}
			
			
		}
		
		
		
}
	
	

