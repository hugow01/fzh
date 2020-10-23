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
	
	img{
		max-width:100px;
	}
	
	div.drow.-off{
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
  		<div class="colorlib-trainers" style='padding-top:0; '>
				<table style="margin-bottom: 10px; margin-left: 15px;">
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
			<div class="container">
				<div class="row">
					<c:forEach var="bBean" items="${list}" >
						<div class="col-md-3 text-center drow" data-auth='${bBean.authority}'>
							<div class="trainers-entry">
								<div class="trainer-img" style="background-image: url(<%=request.getContextPath()%>/PicServlet?man_id=${bBean.man_id})"></div>
								<div class="desc">
									<h3 style='display:inline;'>${bBean.name}</h3>
									<h4 style='display:inline;'>
										<c:if test="${bBean.authority==2}">占卜師</c:if> 
				   						<c:if test="${bBean.authority==3}">療癒師</c:if>
									</h4>
									<span style='display:block;'>
										${bBean.description}
									</span>
									<p>
										</p>
											<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/avalible.do" style="margin-bottom: 0px;"> 
											     <button class='btn btn-primary' type="submit"  value="預約" >預約</button>
											     <input type="hidden" name="man_id"  value="${bBean.man_id}">
											     <input type="hidden" name="action"	value="select_one">
											</FORM>
										
									<p></p>
								</div>
							</div>
						</div>	
					</c:forEach>
				
				</div>
			</div>
		</div>
			
			
			
				


   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script type="text/javascript">
  	$('select.svcType').change(function(){
  		console.log('change');
  		$("input[name='svcType']").val($('select.svcType').val());
  		$('div.row').find('div.drow').each(function(){
  				console.log($(this).data('auth'));
				if($(this).data('auth') != $('select.svcType').val()){
					$(this).addClass('-off');
				};
				if($(this).data('auth')==$('select.svcType').val()){
  					$(this).removeClass('-off');
  				};
  				if($('select.svcType').val()==0){
  					$('div.drow').removeClass('-off');
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
