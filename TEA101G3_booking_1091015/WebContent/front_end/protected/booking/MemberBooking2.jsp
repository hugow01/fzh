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
		<c:forEach var="bBean" items="${bList}" >
			<div class="review">
				<div class="user-img" style="background-image: url(<%=request.getContextPath()%>/PicServlet?man_id=${bBean.man_id})"></div>
				<c:forEach var="mVO" items="${mSvc.all}">
					<c:if test="${mVO.man_id==bBean.man_id}">
						<div class="desc">
						   	<h4>
						   		<span class="text-left">
							   		
							   				${mVO.nickname} :
							   				<c:choose>
												<c:when test="${mVO.authority == 2}">
													療癒服務
												</c:when>
												<c:when test="${mVO.authority == 3}">
													占卜服務
												</c:when>
											</c:choose>
							   	</span>
						   		<span class="text-right" style='color:#337ab7;'>${bBean.bdate} 
							   		<span style='color:red; font-size:12px;'>
							   			<c:if test="${bBean.btime =='DAY'}">
												上午
										</c:if>
										  
										<c:if test="${bBean.btime =='NOON'}">
												下午
										</c:if>
										  
										<c:if test="${bBean.btime =='NIGHT'}">
												晚上
										</c:if>
							   		</span>
						   		</span>
						   		
						   	</h4>
						   		<p>${mVO.introduction}</p>
						   		<p>${mVO.description}</p>
<!-- 						   		<p class="star"> -->
<!-- 					   				<span class="text-left"><a href="#" class="reply"><i class="icon-reply"></i></a></span> -->
<!-- 						   		</p> -->
						</div>
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>
	</div>

<!-- <div> -->
	
<!--   	<table> -->
<!--   		<tbody> -->
<!-- 		  	<tr> -->
<!-- 		  		<th>服務人員</th> -->
<!-- 		  		<th>預約類型</th> -->
<!-- 				<th>預約時間</th> -->
<!-- 				<th>預約時段</th>				 -->
<!-- 			</tr> -->
<%-- 			<c:if test="${bList.size()<=0}"> --%>
<!-- 				<tr> -->
<!-- 					<td colspan='3'> -->
<!-- 						無預約紀錄 -->
<!-- 					</td> -->
<!-- 					<td> -->
<%-- 						<a href='<%=request.getContextPath()%>/front_end/listManager.jsp'>來去預約!</a> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 			</c:if> --%>
			
<%-- 			<c:forEach var="bBean" items="${bList}" > --%>
<!-- 				<tr> -->
<%-- 					<c:forEach var="mVO" items="${mSvc.all}"> --%>
<%-- 		  				<c:if test="${mVO.man_id==bBean.man_id}"> --%>
<%-- 		  					<td> ${mVO.name}</td> --%>
<%-- 		  					<c:choose> --%>
<%-- 									<c:when test="${mVO.authority == 2}"> --%>
<!-- 										<td><p>療癒服務</p></td> -->
<%-- 									</c:when> --%>
<%-- 									<c:when test="${mVO.authority == 3}"> --%>
<!-- 										<td><p>占卜服務</p></td> -->
<%-- 									</c:when> --%>
<%-- 								</c:choose> --%>
<%-- 		  				</c:if> --%>
<%--   					</c:forEach> --%>
<%-- 					<td style='display:none;'>${bBean.man_id}</td> --%>
<%-- 					<td>${bBean.bdate}</td> --%>
<%-- 					<c:if test="${bBean.btime =='DAY'}"> --%>
<!-- 							<td>上午</td> -->
<%-- 					</c:if> --%>
					  
<%-- 					<c:if test="${bBean.btime =='NOON'}"> --%>
<!-- 							<td>下午</td> -->
<%-- 					</c:if> --%>
					  
<%-- 					<c:if test="${bBean.btime =='NIGHT'}"> --%>
<!-- 							<td>晚上</td> -->
<%-- 					</c:if> --%>
					
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
			
<!-- 		</tbody> -->
<!-- 	  </table> -->
<!-- 	</div> -->

</body>
</html>