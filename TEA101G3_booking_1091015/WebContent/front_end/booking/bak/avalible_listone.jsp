<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.booking.model.bean.*"%>
<%@ page import="com.booking.model.dao.*"%>
<%@ page import="com.booking.model.service.*"%>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="mSvc" scope="page" class="com.manager.model.ManagerService" />

<%
  List<WorkdateBean> wlist = (List<WorkdateBean>) request.getAttribute("wlist");
	System.out.println("List Man");
	for(WorkdateBean wbean : wlist){
		System.out.println(wbean);
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�ɬq�d��_avalible_list</title>
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
  				<c:forEach var="mVO" items="${mSvc.all}">
	  				<c:if test="${mVO.man_id==wlist.get(0).man_id}">
	  					<th>${mVO.name}</th>	  					
	  				</c:if>
  				</c:forEach>
  			</tr>
		  	<tr>
		  		<th>�A������</th>
				<th>�w���ɶ�</th>
				<th>�w���ɬq</th>				
			</tr>
			<c:forEach var="wBean" items="${wlist}" >
				<tr>
					<td>
						<c:forEach var="mVO" items="${mSvc.all}">
							<c:if test="${mVO.man_id==wlist.get(0).man_id}">
								<c:choose>
									<c:when test="${mVO.authority == 2}">
										<p>��¡�A��</p>
									</c:when>
									<c:when test="${mVO.authority == 3}">
										<p>�e�R�A��</p>
									</c:when>
								</c:choose>
							</c:if>
						</c:forEach>
					</td>
					
					<td style='display:none;'>${wBean.man_id}</td>
					<c:if test="${wBean.wdate==null}">
						<td colspan="2">�w���Ҥw�B��</td>
					</c:if>
					<c:if test="${wBean.wdate!=null}">
						<td>${wBean.wdate}</td>
					</c:if>
					<c:if test="${wBean.wtime ==Null}">
					</c:if>
					<c:if test="${wBean.wtime =='DAY'}">
							<td>�W��</td>
					</c:if>
					  
					<c:if test="${wBean.wtime =='NOON'}">
							<td>�U��</td>
					</c:if>
					  
					<c:if test="${wBean.wtime =='NIGHT'}">
							<td>�ߤW</td>
					</c:if>
					<c:if test="${wBean.wdate!=null}">
						<td class='update'>
						  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" style="margin-bottom: 0px;">
						     <input type="button" class='insert' value="�w���Ӯɬq" onclick='Confirmclick()'>
						     <input type="submit" id='confirm_btn' style='display:none;'>
						     <input type='hidden' name='man_id' value='${wBean.man_id}'>
						     <input type='hidden' name='email' value='cccc@gmail.com'>
						     <input type='hidden' name='wdate' value='${wBean.wdate}'>
						     <input type='hidden' name='wtime' value='${wBean.wtime}'>
						     <input type="hidden" name="action"	value="insert"></FORM>
						</td> 
					</c:if>	
				</tr>
				 	
				</c:forEach>
			
		</tbody>
	  </table>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
   	$('button.insert').on('click',function(){
   		console.log('insert')
   		 $('tr.insert').toggleClass('-on');
   		
   	});
   	
   	$('button.update').on('click',function(){
   		console.log('update')
   		if($('input.bstatue') != null){
   		//  $('td.update').toggleClass('-on');	
   			$(this).closest('tr').find('td.update').toggleClass('-on');
   		}else{
   			alert("statue must select");
   		}
   		
   	});
   	
   	function Confirmclick(){
   		if(confirm('�T�{�w��?')){
   			console.log('sure');
   			$('input#confirm_btn').click();
   			
   		}else{console.log('no');}
   	} 

   </script>
</body>
</html>