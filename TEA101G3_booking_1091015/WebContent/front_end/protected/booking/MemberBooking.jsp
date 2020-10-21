<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.booking.model.bean.*"%>
<%@ page import="com.booking.model.dao.*"%>
<%@ page import="com.booking.model.service.*"%>
<%@ page import="com.manager.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="mSvc" scope="page" class="com.manager.model.ManagerService" />

<%
List<BookingBean> bList = (List<BookingBean>) request.getAttribute("bList");
	if(bList.size()<=0){
		System.out.println("No booking record.");
	}
	System.out.println("List Mem");
	for(BookingBean bB : bList){
		System.out.println(bB);
	}	

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>個人預約查詢</title>
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
	
  	<table>
  		<tbody>
		  	<tr>
		  		<th>服務人員</th>
		  		<th>預約類型</th>
				<th>預約時間</th>
				<th>預約時段</th>				
			</tr>
			<c:if test="${bList.size()<=0}">
				<tr>
					<td colspan='3'>
						無預約紀錄
					</td>
					<td>
						<a href='<%=request.getContextPath()%>/front_end/listManager.jsp'>來去預約!</a>
					</td>
				</tr>
			</c:if>
			
			<c:forEach var="bBean" items="${bList}" >
				<tr>
					<c:forEach var="mVO" items="${mSvc.all}">
		  				<c:if test="${mVO.man_id==bBean.man_id}">
		  					<td> ${mVO.name}</td>
		  					<c:choose>
									<c:when test="${mVO.authority == 2}">
										<td><p>療癒服務</p></td>
									</c:when>
									<c:when test="${mVO.authority == 3}">
										<td><p>占卜服務</p></td>
									</c:when>
								</c:choose>
		  				</c:if>
  					</c:forEach>
					<td style='display:none;'>${bBean.man_id}</td>
					<td>${bBean.bdate}</td>
					<c:if test="${bBean.btime =='DAY'}">
							<td>上午</td>
					</c:if>
					  
					<c:if test="${bBean.btime =='NOON'}">
							<td>下午</td>
					</c:if>
					  
					<c:if test="${bBean.btime =='NIGHT'}">
							<td>晚上</td>
					</c:if>
					
				</tr>
			</c:forEach>
			
		</tbody>
	  </table>
	</div>

</body>
</html>