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
  
  <a href="javascript:history.back()">上一頁</a>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" >
        <b>以管理員帳號查詢:</b>
        <input type="text" name="man_id">
        <input type="hidden" name="action" value="select_man_id">
        <input type="submit" value="送出">
    </FORM>
 
  
  <c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
  <div>
  <button class='insert'>新增一條</button>
  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" style="margin-bottom: 0px;">
  	<table>
  		<tbody>
	  		<tr class='insert -on'>
				<td>工作人員ID</td>
				<td>會員帳號</td>
				<td>預約日期</td>
				<td>預約時段</td>
			<tr class='insert -on'>
				<td><input type="text" name="man_id"></td>
				<td><input type="text" name="email"></td>
				<td><input type="date" name="bdate"></td>
				<td>
					<select name = "btime">
						<option value = "DAY" selected="selected">上午</option>
						<option value = "NOON">下午</option>
						<option value = "NIGHT">晚上</option>
					</select>
				</td>
				<td>
					<input type="submit" value="新增">
					<input type="hidden" name="action"	value="insert">
				</td> 	
			</tr>
			</tbody>
  		</table>
  	</FORM>
  	<table>
  		
  		<tbody>
		  	<tr>
				<th>工作人員</th>
				<th>會員帳號</th>
				<th>預約時間</th>
				<th>預約時段</th>
				<th>預約狀況</th>
				
				
				
			</tr>
			<c:forEach var="bBean" items="${list}" begin="0" end="<%=(list.size()-1) %>">
		
				
				<tr class='drow' data-date='${bBean.bdate}'>
					<td>${bBean.man_id}</td>
					<td>${bBean.email}</td>
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
					
					<c:if test="${bBean.bstatue == null}">
						<td>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" style="margin-bottom: 0px;">
						
								<input type="radio" id="cencel" name="bstatue" value="cencel">
								<label for="cencel">取消</label>
								<input type="radio" id="done" name="bstatue" value="done" checked>
								<label for="female">完成</label>
								<input type="radio" id="noshow" name="bstatue" value="noshow">
								<label for="noshow">缺席</label>
							     <input type="submit" value="更新">
							     <input type="hidden" name="bookingID"  value="${bBean.booking_id}">
							     <input type="hidden" name="action"	value="getOne_For_Update">
							  </FORM>
						</td> 
						
					  </c:if>
					  <c:if test="${bBean.bstatue != null}">
					  	<c:if test="${bBean.bstatue == 'cencel' }">
					  		<td class="update">取消</td>
					  	</c:if>
					  	<c:if test="${bBean.bstatue == 'done' }">
					  		<td class="update">完成</td>
					  	</c:if>
					  	<c:if test="${bBean.bstatue == 'noshow' }">
					  		<td class="update">缺席</td>
					  	</c:if>
					  		
					  		<td class="update" >
					  		  <button class='update'>修改</button>
					  		</td>
					  		<td class="update -on" >
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" style="margin-bottom: 0px;">
								<input type="radio" id="cencel" name="bstatue" value="cencel">
								<label for="cencel">取消</label>
								<input type="radio" id="done" name="bstatue" value="done">
								<label for="female">完成</label>
								<input type="radio" id="noshow" name="bstatue" value="noshow">
								<label for="noshow">缺席</label>
							    <input type="submit" value="更新">
							    <input type="hidden" name="bookingID"  value="${bBean.booking_id}">
							    <input type="hidden" name="action"	value="getOne_For_Update">
							  </FORM>
							</td> 
					  </c:if>

					
					<td class='update -on'>
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" style="margin-bottom: 0px;">
					     <input type="submit" value="刪除">
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
