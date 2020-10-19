<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.booking.model.bean.*"%>
<%@ page import="com.booking.model.dao.*"%>
<%@ page import="com.booking.model.service.*"%>
<%@ page isELIgnored="false" %> 
<%@page import="java.util.stream.Collectors"%>
<%@ page import="com.manager.model.*"%>
<jsp:useBean id="mSvc" scope="page" class="com.manager.model.ManagerService" />
<%
         List<ManagerVO> user = (List<ManagerVO>) session.getAttribute("user");
         pageContext.setAttribute("user", user);
%>
<%	
	int manid =(int) user.get(0).getMan_id();
		BookingService bSvc = new BookingService();
		List<BookingBean> bList = new ArrayList<BookingBean>();
		if(manid==1){
			bList = bSvc.select_all();
			pageContext.setAttribute("blist", bList);
		}
		else{
			for(ManagerVO m: user){
				List<BookingBean> subList = bSvc.select_all().stream()
	 					.filter(p -> p.getMan_id()==m.getMan_id())
	 					.collect(Collectors.toList());
				
				for(BookingBean mbBean: subList){
					bList.add(mbBean);
				}
			}
			pageContext.setAttribute("blist", bList);
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

	<a href="javascript:history.back()">�W�@��</a>
	<table>
		<tbody>
			
			<tr>
			  		<th>�u�@�H��</th>
			  		<th>�A������</th>
					<th>�|���b��</th>
					<th>�w���ɶ�</th>
					<th>�w���ɬq</th>
					<th colspan='2'>�w�����A</th>
				</tr>
				<c:forEach var="bBean" items="${blist}">
		  	
		  		
				  
						<tr>
							<c:forEach var="mvo" items="${mSvc.all}" >
			  					<c:if test="${mvo.man_id==bBean.man_id}">
									<td>${mvo.account}</td>					
								</c:if>
			  				</c:forEach>
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
								
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" style="margin-bottom: 0px;">
										<td>
											<input type="radio" id="cencel" name="bstatue" value="cencel">
											<label for="cencel">����</label>
											<input type="radio" id="done" name="bstatue" value="done" checked>
											<label for="female">����</label>
											<input type="radio" id="noshow" name="bstatue" value="noshow">
											<label for="noshow">�ʮu</label>
										</td>
										<td>
										     <input type="submit" value="��s">
										     <input type="hidden" name="bookingID"  value="${bBean.booking_id}">
										     <input type="hidden" name="action"	value="getOne_For_Update">
									     </td>
									  </FORM>
								 
								
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
					
				
			  </c:forEach>
			</tbody>
	</table>
	
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