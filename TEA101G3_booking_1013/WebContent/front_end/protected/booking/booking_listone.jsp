<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.booking.model.bean.*"%>
<%@ page import="com.booking.model.dao.*"%>
<%@ page import="com.booking.model.service.*"%>
<%@ page isELIgnored="false" %> 

<%
  List<BookingBean> bList = (List<BookingBean>) request.getAttribute("bList");
	System.out.println("List Man");
	for(BookingBean bbean : bList){
		System.out.println(bbean);
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
				<th>�u�@�H��</th>
				<th>�|���b��</th>
				<th>�w���ɶ�</th>
				<th>�w���ɬq</th>
				<th></th>
			</tr>
			<c:forEach var="bBean" items="${bList}" begin="0" end="<%=(bList.size()-1) %>">
		
				
				<tr>
					<td>${bBean.man_id}</td>
					<td>${bBean.email}</td>
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

   </script>
</body>
</html>