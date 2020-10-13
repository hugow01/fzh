<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.booking.model.bean.*"%>
<%@ page import="com.booking.model.dao.*"%>
<%@ page import="com.booking.model.service.*"%>
<%@ page isELIgnored="false" %> 
<%@page import="java.util.stream.Collectors"%>
<jsp:useBean id="mSvc" scope="page" class="com.manager.model.ManagerService" />

<%	
	int manid = 2;
		BookingService bSvc = new BookingService();
		List<BookingBean> bList = null;
		if(manid==1){
			bList = bSvc.select_all();
			pageContext.setAttribute("blist", bList);
		}
		else{
			 bList = bSvc.select_all().stream()
					 					.filter(p -> p.getMan_id()==manid)
					 					.collect(Collectors.toList());
			pageContext.setAttribute("blist", bList);
		}
		
		for(BookingBean bb : bList){
			System.out.println("BookingList jsp"+bb);
		}
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�w���C��</title>
    <style type="text/css">
    tr.insert.-on{
		display:none;
	}
	
	td.update.-on{
		display:none;
	}
	table {
		margin-top:10px;
	}
	table, tr, td {
	border: 1px solid black;
	text-align : center;
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
	<c:forEach var="bBean" items="${blist}" begin="0" end="<%=(bList.size()-1) %>">
  	<table>
  		
  		<tbody>
  		
	  			<tr>
	  				<c:forEach var="mvo" items="${mSvc.all}" >
	  					<c:if test="${mvo.man_id==bBean.man_id}">
							<td colspan='6'>${mvo.name}</td>					
						</c:if>
	  				</c:forEach>
				</tr>
			
		  	<tr>
		  		<th>�A������</th>
				<th>�|���b��</th>
				<th>�w���ɶ�</th>
				<th>�w���ɬq</th>
				<th colspan='2'>�w�����A</th>
			</tr>
				<tr>
					<c:forEach var="mvo" items="${mSvc.all}" >
	  					<c:if test="${mvo.man_id==bBean.man_id}">
							<td>
								<c:choose>
									<c:when test="${mvo.authority==2}"> ��¡�v</c:when>
									<c:when test="${mvo.authority==3}"> �e�R�v</c:when>
								</c:choose>
							</td>					
						</c:if>
	  				</c:forEach>
					<td> ${bBean.email}</td>
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
					
					<c:if test="${bBean.bstatue == null}">
						<td>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" style="margin-bottom: 0px;">
						
								<input type="radio" id="cencel" name="bstatue" value="cencel">
								<label for="cencel">����</label>
								<input type="radio" id="done" name="bstatue" value="done" checked>
								<label for="female">����</label>
								<input type="radio" id="noshow" name="bstatue" value="noshow">
								<label for="noshow">�ʮu</label>
							     <input type="submit" value="��s">
							     <input type="hidden" name="bookingID"  value="${bBean.booking_id}">
							     <input type="hidden" name="action"	value="getOne_For_Update">
							  </FORM>
						</td> 
						
					  </c:if>
					  <c:if test="${bBean.bstatue != null}">
					  	<c:if test="${bBean.bstatue == 'cencel' }">
					  		<td class="update">����</td>
					  	</c:if>
					  	<c:if test="${bBean.bstatue == 'done' }">
					  		<td class="update">����</td>
					  	</c:if>
					  	<c:if test="${bBean.bstatue == 'noshow' }">
					  		<td class="update">�ʮu</td>
					  	</c:if>
					  		
					  		<td class="update" >
					  		  <button class='update'>�ק�</button>
					  		</td>
					  		<td class="update -on" >
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" style="margin-bottom: 0px;">
								<input type="radio" id="cencel" name="bstatue" value="cencel">
								<label for="cencel">����</label>
								<input type="radio" id="done" name="bstatue" value="done">
								<label for="female">����</label>
								<input type="radio" id="noshow" name="bstatue" value="noshow">
								<label for="noshow">�ʮu</label>
							    <input type="submit" value="��s">
							    <input type="hidden" name="bookingID"  value="${bBean.booking_id}">
							    <input type="hidden" name="action"	value="getOne_For_Update">
							  </FORM>
							</td> 
					  </c:if>

					
					<td class='update -on'>
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" style="margin-bottom: 0px;">
					     <input type="submit" value="�R��">
					     <input type="hidden" name="bookingID"  value="${bBean.booking_id}">
					     <input type="hidden" name="action"	value="getOne_For_Delete"></FORM>
					</td> 	
				</tr>
			
		</tbody>
	  </table>
	  </c:forEach>
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

   </script>
</body>
</html>