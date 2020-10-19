<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.manager.model.*"%>
<%@ page import="com.booking.model.bean.*"%>
<%@ page import="com.booking.model.dao.*"%>
<%@ page import="com.booking.model.service.*"%>
<%@ page isELIgnored="false" %> 

<%! List<ManagerVO> blist = null; %>
<%
    BookingService bookSvc = new BookingService();
    blist = bookSvc.select_all_man();
    pageContext.setAttribute("list",blist);
    
%>

<!DOCTYPE html>
<html lang="zh-TW" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Booking</title>
    <style type="text/css">
    tr.drow.-off{
		display:none;
	}
	
	img{
		max-width:100px;
	}
	
	tr.drow.-off{
		display:none;
	}
	
	td.update.-on{
		display:none;
	}
	table {
		border: 1px solid black;
	}
	tr td {
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
  
<%--     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" > --%>
<!--         <b>以管理員帳號查詢:</b> -->
<!--         <input type="text" name="man_id"> -->
<!--         <input type="hidden" name="action" value="select_man_id"> -->
<!--         <input type="submit" value="送出"> -->
<!--     </FORM> -->
 
  
  	<table>
  			<tr>
		  		<td>
				  	<select name='service' class='svcType' style='margin:0 auto; height:20px;' >
				  		<option value="0">請選擇服務</option>
				  		<option value="2">占卜師</option>
				  		<option value="3">療癒師</option>
				  	</select>
				  </td>
				  <td>
				  	<input type='date' class='wdate' style='margin:0 auto;height:20px;' >
				  </td>
				  <td style='display:none;'>
				  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/avalible.do" style="margin-bottom: 0px;">
				  		<button type='submit' name='get_date' >查詢</button>
				  		<input type="hidden" name="svcType"	value='0'>
				  		<input type="hidden" name="wdate"	value=''>
				  		<input type="hidden" name="action"	value="get_date">
					</form>
			  	</td>
		  	</tr>
  	</table>
  	<table>
  		
  		<tbody>
			<c:forEach var="bBean" items="${list}" >
		
		
				
				<tr class='drow' data-auth='${bBean.authority}'>
					<td>${bBean.name}</td>
					<td>
						<c:if test="${bBean.picture == null}">
							<img src = 'data:image/png;base64,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'>
						
						</c:if>
						
						<c:if test="${bBean.picture != null}">
<%-- 							<img src = 'data:image/png;base64,${Base64.getEncoder().encodeToString(bBean.picture)}'> --%>
								<img src= '<%=request.getContextPath()%>/PicServlet?man_id=${bBean.man_id}'>
						</c:if>
						
					</td>
					<td>${bBean.introduction}</td>
					<td>${bBean.description}</td>
					<td class='bookingit'>
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/avalible.do" style="margin-bottom: 0px;">
					     <input type="submit" value="預約">
					     <input type="hidden" name="man_id"  value="${bBean.man_id}">
					     <input type="hidden" name="action"	value="select_one"></FORM>
					</td> 	
				</tr>
			</c:forEach>
				
		</tbody>
	  </table>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script type="text/javascript">
  	$('select.svcType').change(function(){
  		$("input[name='svcType']").val($('select.svcType').val());
  		$('table').find('tr').each(function(){
				if($(this).closest('tr.drow').data('auth') != $('select.svcType').val()){
					$(this).closest('tr.drow').addClass('-off');
				};
				if($(this).closest('tr.drow').data('auth')==$('select.svcType').val()){
  					$(this).closest('tr.drow').removeClass('-off');
  				};
  				if($('select.svcType').val()==0){
  					$('tr.drow').removeClass('-off');
  				}
		});
  		
  		
  				
  	});
  	
  	$('input.wdate').change(function(){
  		$("input[name='wdate']").val($('input.wdate').val());
  		$("button[name='get_date']").click();
  	});

   </script>
  </body>
</html>
