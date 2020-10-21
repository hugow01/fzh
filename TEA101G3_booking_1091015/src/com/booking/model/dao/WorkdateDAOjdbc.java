package com.booking.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.annotation.Resource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.booking.model.DAO_interface.WorkdateDAO_interface;
import com.booking.model.bean.BookingBean;
import com.booking.model.bean.WorkdateBean;
import com.manager.model.ManagerVO;
import com.sun.istack.internal.logging.Logger;


public class WorkdateDAOjdbc implements WorkdateDAO_interface {
	@Resource
	private DataSource dataSource;
	private final String dsName = "java:comp/env/jdbc/TEA101G3"; 
	
	private static final String driver="oracle.jdbc.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@//localhost:1521/XE";
	private static final String USERNAME = "TEA10103";
	private static final String PASSWORD = "123456";

	
//	private DataSource dataSource;
//	private final String dsName = "java:comp/env/jdbc/TEA101G3"; 
	private static final String SELECT_BY_MAN_ID = "select * from MAN_WORKDATE where MAN_ID=? order by wdate";
	private static final String SELECT_ALL = "select * from MAN_WORKDATE order by man_id,wdate";
	private static final String INSERT = "INSERT INTO MAN_WORKDATE(MAN_ID,ACCOUNT,WDATE,WTIME) values( ?,?,?,?) ";
	private static final String DELETE = "delete from MAN_WORKDATE where MAN_ID=? and WDATE=? and WDATE=?";
	private static final String Select_ALL_W_MAN="select * from MANAGER, MAN_WORKDATE where MANAGER.MAN_ID=MAN_WORKDATE.MAN_ID";
	private static final String LIST_ALL="select mana.man_id, mana.name, mana.picture, mana.introduction, bk.wdate AS dates, bk.wtime as times  from manager mana "
			+ "inner join (select man.* from man_workdate man minus select man.* from man_workdate man inner join booking book on man.man_id = book.man_id and book.bdate=man.wdate and book.btimes=man.wtime) bk "
			+ "on bk.man_id = mana.man_id and mana.authority>1"
			+ " order by dates, man_id;" ; //�C�X�Ҧ��i�w������¡�v�P�e�R�v

	
	public  WorkdateDAOjdbc() {
		Context ctx;
		try {
			ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup(dsName);
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@Override
	public List<WorkdateBean> select(int man_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset =null; 
			
		List<WorkdateBean> selectList = null;
		WorkdateBean bean = null;
		
		try {
//			Class.forName(driver);
			conn = dataSource.getConnection();
//			conn=DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt=conn.prepareStatement(SELECT_BY_MAN_ID);
			System.out.println("man_id:"+man_id);
			stmt.setInt(1, man_id);
			rset = stmt.executeQuery();
			selectList = new ArrayList<WorkdateBean>();
				while(rset.next()) {
					bean = new WorkdateBean();
					bean.setMan_id(rset.getInt("MAN_ID"));
					bean.setAccount(rset.getString("ACCOUNT"));
					bean.setWdate(rset.getDate("WDATE"));
					bean.setWtime(rset.getString("WTIME"));
					selectList.add(bean);
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return selectList;

	}
	
	public List<WorkdateBean> getAll(){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset =null; 
			
		List<WorkdateBean> selectList = null;
		WorkdateBean bean = null;
		
		try {
//			Class.forName(driver);
//			conn=DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn = dataSource.getConnection();
			stmt=conn.prepareStatement(SELECT_ALL);
			rset = stmt.executeQuery();
			selectList = new ArrayList<WorkdateBean>();
				while(rset.next()) {
					bean = new WorkdateBean();
					bean.setMan_id(rset.getInt("MAN_ID"));
					bean.setAccount(rset.getString("ACCOUNT"));
					bean.setWdate(rset.getDate("WDATE"));
					bean.setWtime(rset.getString("WTIME"));
					selectList.add(bean);
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return selectList;

	}
	
	public boolean insert(WorkdateBean bean) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset =null; 
		System.out.println("DAO insert: "+ bean );
		try {
//			conn=DriverManager.getConnection(URL,USERNAME,PASSWORD);
			conn = dataSource.getConnection();
			stmt=conn.prepareStatement(INSERT);
			
			if(bean != null) {
				stmt.setInt(1, bean.getMan_id());
				stmt.setString(2, bean.getAccount());
				stmt.setDate(3, bean.getWdate());
				stmt.setString(4, bean.getWtime());
				int i = stmt.executeUpdate();
				if(i == 1) {
					conn.commit();
					return true;
				}else {
					return false;
				}
			}
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return false;
		
	}

	@Override
	public boolean delete(WorkdateBean bean) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset =null; 
		
		try {
//			conn=DriverManager.getConnection(URL,USERNAME,PASSWORD);
			conn = dataSource.getConnection();
			stmt=conn.prepareStatement(DELETE);
			
			if(bean != null) {
				stmt.setInt(1, bean.getMan_id());
				stmt.setDate(2, bean.getWdate());
				stmt.setString(3, bean.getWtime());
				int i = stmt.executeUpdate();
				if(i == 1) {
					conn.commit();
					return true;
				}
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return false;
		
	}

	@Override
	public List<WorkdateBean> selectAllMan() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<WorkdateBean> Bequals(List<BookingBean> bList){
		WorkdateDAOjdbc workDAO = new WorkdateDAOjdbc();
		Integer manID = bList.get(0).getMan_id();
		List<WorkdateBean> wList = workDAO.select(manID);
		List<WorkdateBean> list = wList.stream()
					.filter(w -> bList.stream() 
									.noneMatch(b -> w.getMan_id() == b.getMan_id() && 
													w.getWdate().equals(b.getBdate()) &&
													w.getWtime().equals(b.getBtime())))
					.collect(Collectors.toList());
		
		
		return list;
		
	}
	
	
	public List<WorkdateBean> Bequals() {
		WorkdateDAOjdbc workDAO = new WorkdateDAOjdbc();
		List<BookingBean> bList = new BookingDAOjdbc().select_all();
		List<WorkdateBean> wList = new ArrayList<WorkdateBean>();
		wList = workDAO.getAll();
		
		List<WorkdateBean> list = wList.stream()
				.filter(w -> bList.stream() 
								.noneMatch(b -> w.getMan_id() == b.getMan_id() && 
												w.getWdate().equals(b.getBdate()) &&
												w.getWtime().equals(b.getBtime())))
				.collect(Collectors.toList());
//		for(WorkdateBean wbean : wList) {
//			System.out.println("Bequals"+wbean);
//		}
		return list;
	}
	
	public List select_all_man() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs =null; 
		List<Map> rsList = null;
		try {
			conn = dataSource.getConnection();
			stmt=conn.prepareStatement(Select_ALL_W_MAN);
			rs = stmt.executeQuery();
			
			
			rsList = new ArrayList<Map>();
			while(rs.next()) {
				Map<String,Object> Beans = new HashMap<String,Object>();
				Beans.put("man_id", rs.getInt("MAN_ID"));
				Beans.put("ACCOUNT",rs.getString("ACCOUNT"));
				Beans.put("NAME",rs.getString("NAME"));
				Beans.put("NICKNAME",rs.getString("NICKNAME"));
				Beans.put("PASSWORD",rs.getString("PASSWORD"));
				Beans.put("PICTURE",rs.getBytes("PICTURE"));
				Beans.put("AUTHORITY",rs.getInt("AUTHORITY"));
				Beans.put("INTRODUCTION",rs.getString("INTRODUCTION"));
				Beans.put("MAINPULATE",rs.getString("MAINPULATE"));
				Beans.put("DESCRIPTION",rs.getString("DESCRIPTION"));
				Beans.put("EMAIL",rs.getString("EMAIL"));
				Beans.put("KEYWORD",rs.getString("KEYWORD"));
				Beans.put("MAN_ID",rs.getInt("MAN_ID"));
				Beans.put("WDATE",rs.getDate("WDATE"));
				Beans.put("WTIME",rs.getString("WTIME"));
				rsList.add(Beans);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return rsList;
		
	}

}
