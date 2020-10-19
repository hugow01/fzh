<%@page import="com.manager.model.ManagerService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.booking.model.bean.*"%>
<%@ page import="com.booking.model.dao.*"%>
<%@ page import="com.manager.model.*"%>
<%@ page import="com.booking.model.service.*"%>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="mSvc" scope="page" class="com.manager.model.ManagerService" />

<%
  List<BookingBean> bList = (List<BookingBean>) request.getAttribute("bList");
	System.out.println("List Mem");
	for(BookingBean bBean : bList){
		System.out.println(bBean);
	}
	ManagerService mSvc2 = new ManagerService();
	List<ManagerVO> mList = mSvc2.getAll();
	int i = mList.size();
	int p = (int)(Math.random()*i);
	System.out.println("1."+mList.get((int)(Math.random()*i)).getName());
	System.out.println("2."+mList.get((int)(Math.random()*i)).getName());
	System.out.println("3."+mList.get((int)(Math.random()*i)).getName());

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�ӤH�w���d��</title>
<style type="text/css">
    tr.insert.-on{
		display:none;
	}
	
	td.update.-on{
		display:none;
	}
	table tr td {
	border: 1px solid black;
	}
	th{
		border: 1px solid gray;
	}
	tbody{
		border:1px solid red;
	}
</style>
</head>
<body>

<div>
	<a href="javascript:history.back()">�W�@��</a>
	
  	<table>
  		<tbody>
		  	<tr>
		  		<th>�A�ȤH��</th>
		  		<th>�w������</th>
				<th>�w���ɶ�</th>
				<th>�w���ɬq</th>				
			</tr>
			
			<c:forEach var="bBean" items="${bList}" >
				<tr>
					<c:forEach var="mVO" items="${mSvc.all}">
		  				<c:if test="${mVO.man_id==bBean.man_id}">
		  					<td> ${mVO.name}</td>
		  					<c:choose>
									<c:when test="${mVO.authority == 2}">
										<td><p>��¡�A��</p></td>
									</c:when>
									<c:when test="${mVO.authority == 3}">
										<td><p>�e�R�A��</p></td>
									</c:when>
								</c:choose>
		  				</c:if>
  					</c:forEach>
					<td style='display:none;'>${bBean.man_id}</td>
					<td>${bBean.bdate}</td>
					<c:if test="${bBean.btime =='DAY'}">
							<td>�W��</td>
					</c:if>
					  
					<c:if test="${bBean.btime =='NOON'}">
							<td>�U��</td>
					</c:if>
					  
					<c:if test="${bBean.btime =='NIGHT'}">
							<td>�ߤW</td>
					</c:if>
					
				</tr>
			</c:forEach>
			
		</tbody>
	  </table>
	</div>

</body>
</html>