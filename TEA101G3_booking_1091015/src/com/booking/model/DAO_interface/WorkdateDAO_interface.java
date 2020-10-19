package com.booking.model.DAO_interface;

import java.sql.SQLException;
import java.util.List;

import com.booking.model.bean.WorkdateBean;


public interface WorkdateDAO_interface {
	public List<WorkdateBean> select(int man_id);
	public List<WorkdateBean> selectAllMan();
	public boolean insert(WorkdateBean bean) throws SQLException;
	public boolean delete(WorkdateBean bean);
}
