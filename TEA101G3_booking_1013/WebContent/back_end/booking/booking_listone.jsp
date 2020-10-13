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
<title>預約列表</title>
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
	<a href="javascript:history.back()">上一頁</a>
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
		  		<th>服務類型</th>
				<th>會員帳號</th>
				<th>預約時間</th>
				<th>預約時段</th>
				<th colspan='2'>預約狀態</th>
			</tr>
				<tr>
					<c:forEach var="mvo" items="${mSvc.all}" >
	  					<c:if test="${mvo.man_id==bBean.man_id}">
							<td>
								<c:choose>
									<c:when test="${mvo.authority==2}"> 療癒師</c:when>
									<c:when test="${mvo.authority==3}"> 占卜師</c:when>
								</c:choose>
							</td>					
						</c:if>
	  				</c:forEach>
					<td> ${bBean.email}</td>
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