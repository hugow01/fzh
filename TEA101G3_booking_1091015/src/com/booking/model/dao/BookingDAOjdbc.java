package com.booking.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.booking.model.DAO_interface.BookingDAO_interface;
import com.booking.model.bean.BookingBean;
import com.manager.model.ManagerVO;


public class BookingDAOjdbc implements BookingDAO_interface {
	@Resource
	private DataSource dataSource;
	private final String dsName = "java:comp/env/jdbc/TEA101G3"; 
	
	private static final String URL = "jdbc:oracle:thin:@//localhost:1521/XE";
	private static final String USERNAME = "TEA10103";
	private static final String PASSWORD = "123456";

	
	private static final String SELECT_BY_MAN_ID = "select * from booking where man_id=?";
	private static final String SELECT_ALL = "select * from booking order by man_id";
	private static final String INSERT = "INSERT INTO booking(BOOKING_ID, MAN_ID, EMAIL, BDATE, BTIMES) values(SEQ_BOOKING_SER.nextval,?,?,?,?)";
	private static final String UPDATE = "update BOOKING set BSTATUE=? where BOOKING_ID=?";
	private static final String DELETE = "delete from BOOKING where BOOKING_ID=?";
	private static final String SELECT_BY_EMAIL = "select * from BOOKING where EMAIL=? order by BDATE";
	private static final String SELECT_BY_ID = "select * from booking where BOOKING_ID=?";
	private static final String SELECT_ALL_MAN = "select * from manager where authority>1";
	
	public BookingDAOjdbc(){
		try {
			Context ctx = new InitialContext();
			dataSource =(DataSource) ctx.lookup(dsName);
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	public List<ManagerVO> selectAllMan() {
		List<ManagerVO> list = new ArrayList<ManagerVO>();
		ManagerVO manager = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			//Class.forName(driver);
			conn = dataSource.getConnection();
//			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = conn.prepareStatement(SELECT_ALL_MAN);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				manager = new ManagerVO();
				manager.setMan_id(rs.getInt("MAN_ID"));
				manager.setAccount(rs.getString("ACCOUNT"));
				manager.setName(rs.getString("NAME"));
				manager.setNickname(rs.getString("NICKNAME"));
				manager.setPassword(rs.getString("PASSWORD"));
				manager.setPicture(rs.getBytes("PICTURE"));
				manager.setAuthority(rs.getInt("AUTHORITY"));
				manager.setIntroduction(rs.getString("INTRODUCTION"));
				manager.setMainpulate(rs.getString("MAINPULATE"));
				manager.setDescription(rs.getString("DESCRIPTION"));
				manager.setEmail(rs.getString("EMAIL"));
				manager.setKeyword("KEYWORD");;
				list.add(manager);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	@Override
	public List<BookingBean> select_man(int man_id) {
		BookingBean bbean = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		List<BookingBean> selectList = new ArrayList();
		
		try {
			conn = dataSource.getConnection();
//			conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
			stmt = conn.prepareStatement(SELECT_BY_MAN_ID);
			stmt.setInt(1, man_id);
			rset = stmt.executeQuery();
			System.out.println("rset.next:"+rset.next());
			do {
				bbean = new BookingBean();
				bbean.setMan_id(rset.getInt("MAN_ID"));
				bbean.setEmail(rset.getString("EMAIL"));
				bbean.setBooking_id(rset.getString("BOOKING_ID"));
				bbean.setBdate(rset.getDate("BDATE"));
				bbean.setBtime(rset.getString("BTIMES"));
				bbean.setBstatue(rset.getString("BSTATUE"));
				selectList.add(bbean);
			}while(rset.next());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(rset !=null) {
				try {
					rset.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		for(BookingBean bBean2: selectList) {
			System.out.println("DAO"+bBean2);
		}
		return selectList;
	}
	
	public BookingBean select_ID(String booking_id) {
		BookingBean bbean = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = dataSource.getConnection();
//			conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
			stmt = conn.prepareStatement(SELECT_BY_ID);
			stmt.setString(1, booking_id);
			rset = stmt.executeQuery();
			if(rset.next()) {
				bbean = new BookingBean();
				bbean.setMan_id(rset.getInt("MAN_ID"));
				bbean.setEmail(rset.getString("EMAIL"));
				bbean.setBooking_id(rset.getString("BOOKING_ID"));
				bbean.setBdate(rset.getDate("BDATE"));
				bbean.setBtime(rset.getString("BTIMES"));
				bbean.setBstatue(rset.getString("BSTATUE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(rset !=null) {
				try {
					rset.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return bbean;
	}

	@Override
	public List<BookingBean> select_email(String email) {
		BookingBean bbean = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		List<BookingBean> selectList = null;
		
		try {
			conn = dataSource.getConnection();
//			conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
			stmt = conn.prepareStatement(SELECT_BY_EMAIL);
			stmt.setString(1, email);
			selectList = new ArrayList<BookingBean>();
			rset = stmt.executeQuery();
			while(rset.next()) {
				bbean = new BookingBean();
				bbean.setMan_id(rset.getInt("MAN_ID"));
				bbean.setEmail(rset.getString("EMAIL"));
				bbean.setBooking_id(rset.getString("BOOKING_ID"));
				bbean.setBdate(rset.getDate("BDATE"));
				bbean.setBtime(rset.getString("BTIMES"));
				bbean.setBstatue(rset.getString("BSTATUE"));
				selectList.add(bbean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rset !=null) {
				try {
					rset.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return selectList;
	}

	@Override
	public List<BookingBean> select_all() {
		List<BookingBean> result = null;
		try(
				Connection conn = dataSource.getConnection();
//				Connection conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {
			
			result = new ArrayList<BookingBean>();
			while(rset.next()) {
				BookingBean bean = new BookingBean();
				bean.setBooking_id(rset.getString("BOOKING_ID"));
				bean.setMan_id(rset.getInt("MAN_ID"));
				bean.setEmail(rset.getString("EMAIL"));
				bean.setBdate(rset.getDate("BDATE"));
				bean.setBtime(rset.getString("BTIMES"));
				bean.setBstatue(rset.getString("BSTATUE"));
				
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	

	public BookingBean update_man(String book_id, String bstatue)  {
		BookingBean result = null;
		Connection conn = null;
		PreparedStatement stmt=null;
				
		try {
			conn = dataSource.getConnection();
//			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = conn.prepareStatement(UPDATE);
			stmt.setString(1, bstatue);
			stmt.setString(2, book_id);
			int i = stmt.executeUpdate();
			if(i == 1) {
				System.out.println("update success");
								
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} finally {
			
			if(stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		result =  this.select_ID(book_id);
		return result;
		
	}

	@Override
	public int insert(BookingBean bean) {
		Connection conn = null;
		BookingBean result = null;
		PreparedStatement stmt = null;
		try {
			conn = dataSource.getConnection();
//			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);		
			stmt = conn.prepareStatement(INSERT);
			conn.setAutoCommit(false);
			if(bean!=null) {
				stmt.setInt(1, bean.getMan_id());
				stmt.setString(2, bean.getEmail());
				Date bdate =bean.getBdate();
				if(bdate!=null) {
					long time = bdate.getTime();
					stmt.setDate(3, new java.sql.Date(time));
				} else {
					bdate = new Date(new java.util.Date().getTime());
					stmt.setDate(3, bdate);				
				}
				
				stmt.setString(4, bean.getBtime()); 
				
				int i = stmt.executeUpdate();
				conn.commit();
				return i;
				
//				if(i==1) {
//					result = bean;
//				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return -1;
	}

	@Override
	public boolean delete(String booking_id) {
		Connection conn= null;
		PreparedStatement stmt = null;
		
		try {
			conn = dataSource.getConnection();
//			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = conn.prepareStatement(DELETE);
			stmt.setString(1, booking_id);
			conn.setAutoCommit(false);
			int i = stmt.executeUpdate();
			conn.commit();
			if(i==1) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			if(stmt != null) {
				try {
					stmt.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
					
					
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return false;
	}
	


}
