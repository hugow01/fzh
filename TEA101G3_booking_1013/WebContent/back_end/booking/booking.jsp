<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.booking.model.bean.*"%>
<%@ page import="com.booking.model.dao.*"%>
<%@ page import="com.booking.model.service.*"%>
<%@ page isELIgnored="false" %> 

<%
    BookingService bookSvc = new BookingService();
    List<BookingBean> list = bookSvc.select_all();
    pageContext.setAttribute("list",list);
    
%>

<!DOCTYPE html>
<html lang="zh-TW" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Booking</title>
    <style type="text/css">
    tr.insert.-on{
		display:none;
	}
	
	tr.drow.-off{
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
  
  <a href="javascript:history.back()">�W�@��</a>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" >
        <b>�H�޲z���b���d��:</b>
        <input type="text" name="man_id">
        <input type="hidden" name="action" value="select_man_id">
        <input type="submit" value="�e�X">
    </FORM>
 
  
  <c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
  <div>
  <button class='insert'>�s�W�@��</button>
  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" style="margin-bottom: 0px;">
  	<table>
  		<tbody>
	  		<tr class='insert -on'>
				<td>�u�@�H��ID</td>
				<td>�|���b��</td>
				<td>�w�����</td>
				<td>�w���ɬq</td>
			<tr class='insert -on'>
				<td><input type="text" name="man_id"></td>
				<td><input type="text" name="email"></td>
				<td><input type="date" name="bdate"></td>
				<td>
					<select name = "btime">
						<option value = "DAY" selected="selected">�W��</option>
						<option value = "NOON">�U��</option>
						<option value = "NIGHT">�ߤW</option>
					</select>
				</td>
				<td>
					<input type="submit" value="�s�W">
					<input type="hidden" name="action"	value="insert">
				</td> 	
			</tr>
			</tbody>
  		</table>
  	</FORM>
  	<table>
  		
  		<tbody>
		  	<tr>
				<th>�u�@�H��</th>
				<th>�|���b��</th>
				<th>�w���ɶ�</th>
				<th>�w���ɬq</th>
				<th>�w�����p</th>
				
				
				
			</tr>
			<c:forEach var="bBean" items="${list}" begin="0" end="<%=(list.size()-1) %>">
		
				
				<tr class='drow' data-date='${bBean.bdate}'>
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
