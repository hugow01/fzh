<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.manager.model.*"%>
<%@ page import="com.booking.model.bean.*"%>
<%@ page import="com.booking.model.dao.*"%>
<%@ page import="com.booking.model.service.*"%>
<%@ page import="com.member.model.MemberVO"%>
<%@ page isELIgnored="false" %> 

<%
    Map mmap = (Map) request.getAttribute("mmap");
	List<WorkdateBean> wList = (List<WorkdateBean>) request.getAttribute("wList");
	for(WorkdateBean wbean: wList){
		System.out.println("List by date:"+wbean);
	}
	
	MemberVO userb = (MemberVO) session.getAttribute("user");
	if(userb==null){
		userb = new MemberVO();
		userb.setEmail("noLogin");
	}
	pageContext.setAttribute("email", userb.getEmail());
	
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
<!--   <a href="javascript:history.back()">�W�@��</a> -->
  
<%--     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" > --%>
<!--         <b>�H�޲z���b���d��:</b> -->
<!--         <input type="text" name="man_id"> -->
<!--         <input type="hidden" name="action" value="select_man_id"> -->
<!--         <input type="submit" value="�e�X"> -->
<!--     </FORM> -->
 
  
  	<table>
  			<tr>
		  		<td>
				  	<select name='service' class='svcType'   style='margin:0 auto; height:20px;' >
				  		<option value="0">�п�ܪA��</option>
				  		<option value="2">�e�R�v</option>
				  		<option value="3">��¡�v</option>
				  	</select>
				  </td>
				  <td>
				  	<input type='date' class='wdate'  style='margin:0 auto;height:20px;' >
				  </td>
				  <td style='display:none;'>
				  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/avalible.do" style="margin-bottom: 0px;">
				  		<button type='submit' name='get_date' >�d��</button>
				  		<input type="hidden" name="svcType"	value='0'>
				  		<input type="hidden" name="wdate"	value=''>
				  		<input type="hidden" name="action"	value="get_date">
				  		
					</form>
			  	</td>
		  	</tr>
  	</table>
  	<table>
  		<tbody>
  		<tr>
  			<th>�A�ȤH��</th>
  			<th>�A��</th>
  			<th>�Ϥ�</th>
  			<th>�A�Ȥ���</th>
  			<th>�w�����</th>
  			<th>�w���ɬq</th>
  		</tr>
  		
<%--   		<c:if test="${wList.size()==0 || mmap.get(wList.get(0).man_id)==null}"> --%>
			<c:if test="${wList.size()==0 && mmap !=null}">
					<tr class='drow'><td colspan="6"><p>�Ӯɬq�w���w�B��</P></td></tr>
			</c:if>
			<c:forEach var="bBean" items="${wList}" >
				<c:if test="${mmap.get(bBean.man_id)!=null && wList.size()!=0}" >
					<tr class='drow' data-auth='${mmap.get(bBean.man_id).get(1)}'>
					<td>${mmap.get(bBean.man_id).get(0)}</td>
					<c:choose>
						<c:when test="${mmap.get(bBean.man_id).get(1)==2}">
							<td>�e�R�A��</td>
						</c:when>
						<c:when test="${mmap.get(bBean.man_id).get(1)==3}">
							<td>��¡�A��</td>
						</c:when>
					</c:choose>
					
					<td><img src ='<%=request.getContextPath()%>/PicServlet?man_id=${bBean.man_id}'></td>
					<td>${mmap.get(bBean.man_id).get(2)}</td>
					<td>${bBean.wdate}</td>
					<c:if test="${bBean.wtime =='DAY'}">
							<td>�W��</td>
					</c:if>
					  
					<c:if test="${bBean.wtime =='NOON'}">
							<td>�U��</td>
					</c:if>
					  
					<c:if test="${bBean.wtime =='NIGHT'}">
							<td>�ߤW</td>
					</c:if>
					<td class='update'>
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" style="margin-bottom: 0px;">
					     <input type="button" class='insert' value="�w���Ӯɬq" onclick='Confirmclick()'>
					     <input type="submit" id='confirm_btn' style='display:none;'>
					     <input type='hidden' name='man_id' value='${bBean.man_id}'>
					     <input type='hidden' name='email' value='${email}'>
					     <input type='hidden' name='wdate' value='${bBean.wdate}'>
					     <input type='hidden' name='wtime' value='${bBean.wtime}'>
					     <input type="hidden" name="action"	value="insert"></FORM>
					</td>	
				</tr>
				</c:if>
					
			</c:forEach>
				
		</tbody>
	  </table>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script type="text/javascript">
  	$('select.svcType').change(function(){
  		$("input[name='svcType']").val($('select.svcType').val());
//   		$('button#back').click();
<%--   		window.location.replace("<%=request.getContextPath()%>/booking/ListManager.jsp"); --%>
  	});
  	
  	$('input.wdate').change(function(){
  		$("input[name='wdate']").val($('input.wdate').val());
  		$("button[name='get_date']").click();
  	});
  	
  	$('button.insert').on('click',function(){
   		console.log('insert')
   		 $('tr.insert').toggleClass('-on');
   		
   	});
  	
  	function Confirmclick(){
   		if($('input[name="email"]').val()=='noLogin'){
   			alert('�Х��n�J');
   			$('input#confirm_btn').click();
   		}else{
   			if(confirm('�T�{�w��?')){
   	   			console.log('sure');
   	   			$('input#confirm_btn').click();
   	   			
   	   		}else{console.log('no');}
   		}
   	} 

   </script>
  </body>
</html>
