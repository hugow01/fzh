<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.booking.model.bean.*"%>
<%@ page import="com.booking.model.dao.*"%>
<%@ page import="com.booking.model.service.*"%>
<%@ page import="com.member.model.MemberVO"%>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="mSvc" scope="page" class="com.manager.model.ManagerService" />

<%
	Map<String,List<String>> wMap = (Map<String,List<String>>) request.getAttribute("wMap");
	pageContext.setAttribute("wMap", wMap);
	for(List<String> e :wMap.values()){
		System.out.println("wMap:");
		for(String str : e){
			System.out.print(str+ ",");
		}
		
	}
	
    MemberVO userb = (MemberVO) session.getAttribute("user");
	System.out.println("user:"+userb);
	if(userb==null){
		userb = new MemberVO();
		userb.setEmail("noLogin");
// 		userb.setEmail("zzzz@gmail.com");
	}
	pageContext.setAttribute("email", userb.getEmail());
	
	
	
// 	if((MemberVO) request.getAttribute("user")==null){
// 		user.setEmail("noLogin");
// 	}
	
// 	pageContext.setAttribute("user", user);

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
  	<table>
  		<tbody>
  			
  		
  			<tr>
  				<c:forEach var="mVO" items="${mSvc.all}">
	  				<c:if test="${mVO.man_id==man_id}">
	  					<th colspan='6'>
	  						${mVO.nickname} : <c:forEach var="mVO" items="${mSvc.all}">
							<c:if test="${mVO.man_id==man_id}">
								<c:choose>
									<c:when test="${mVO.authority == 2}">
										��¡�v
									</c:when>
									<c:when test="${mVO.authority == 3}">
										�e�R�v
									</c:when>
								</c:choose>
							</c:if>
						</c:forEach>
	  					
	  					</th>	  					
	  				</c:if>
  				</c:forEach>
  			</tr>
		  	<tr>
		  		<th>�A������</th>
				<th>�w���ɶ�</th>
				<th colspan='3'>�w���ɬq</th>				
			</tr>
			<c:if test="${wMap.size()<=0 }">
				<td colspan='6'>�ӪA�ȹw���Ҥw�B��</td>
			</c:if>
			<c:forEach var="wBean" items="${wMap.values()}" >
				<tr>
					<td>
						<c:forEach var="mVO" items="${mSvc.all}">
							<c:if test="${mVO.man_id==man_id}">
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
					
					
					<td style='display:none;'>${wBean.get(0)}</td>
					<c:if test="${wBean.get(1)==null}">
						<td colspan="2">�w���Ҥw�B��</td>
					</c:if>
					
					<c:if test="${wBean.get(1)!=null}">
						<td>${wBean.get(1)}</td>
					</c:if>
					<c:choose>
						<c:when test="${'DAY'==wBean.get(2)}">
							<td>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" onsubmit="return Confirmclick();" style="margin-bottom: 0px;">
									<input type="submit" id='confirm_btn'value="�W��" >
								    <input type='hidden' name='man_id' value='${man_id}'>
								    <input type='hidden' name='email' value='${email}'>
								    <input type='hidden' name='wdate' class='wdate' value='${wBean.get(1)}'>
								    <input type='hidden' name='wtime' value='${wBean.get(2)}'>
								    <input type="hidden" name="action"	value="insert">
								 </FORM>
							</td>
							
						</c:when>
						<c:otherwise>
							<td>��</td>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${'NOON'==wBean.get(2)}">
							<td>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" onsubmit="return Confirmclick();" style="margin-bottom: 0px;">
									<input type="submit" id='confirm_btn' value="�U��" />
								    <input type='hidden' name='man_id' value='${man_id}'>
								    <input type='hidden' name='email' value='${email}'>
								    <input type='hidden' name='wdate' value='${wBean.get(1)}'>
								    <input type='hidden' name='wtime' value='${wBean.get(2)}'>
								    <input type="hidden" name="action"	value="insert">
								 </FORM>
							</td>
						</c:when>
						<c:when test="${wBean.size()>3 &&'NOON'==wBean.get(3)}">
							<td>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" onsubmit="return Confirmclick();" style="margin-bottom: 0px;">
									<input type="submit" id='confirm_btn' value="�U��" />
								    <input type='hidden' name='man_id' value='${man_id}'>
								    <input type='hidden' name='email' value='${email}'>
								    <input type='hidden' name='wdate' value='${wBean.get(1)}'>
								    <input type='hidden' name='wtime' value='${wBean.get(3)}'>
								    <input type="hidden" name="action"	value="insert">
								 </FORM>
							</td>
						</c:when>
						<c:when test="${wBean.size()>4 &&'NOON'==wBean.get(4)}">
							<td>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" onsubmit="return Confirmclick();" style="margin-bottom: 0px;">
									<input type="submit" id='confirm_btn' value="�U��" />
								    <input type='hidden' name='man_id' value='${man_id}'>
								    <input type='hidden' name='email' value='${email}'>
								    <input type='hidden' name='wdate' value='${wBean.get(1)}'>
								    <input type='hidden' name='wtime' value='${wBean.get(4)}'>
								    <input type="hidden" name="action"	value="insert">
								 </FORM>
							</td>
						</c:when>
						<c:otherwise>
							<td>��</td>
						</c:otherwise>
					</c:choose>
					  
					<c:choose>
						<c:when test="${'NIGHT'==wBean.get(2)}">
							<td>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" onsubmit="return Confirmclick();" style="margin-bottom: 0px;" >
									<input type="submit" id='confirm_btn' value="�ߤW" />
								    <input type='hidden' name='man_id' value='${man_id}'>
								    <input type='hidden' name='email' value='${email}'>
								    <input type='hidden' name='wdate' value='${wBean.get(1)}'>
								    <input type='hidden' name='wtime' value='${wBean.get(2)}'>
								    <input type="hidden" name="action"	value="insert">
								 </FORM>
							</td>
						</c:when>
						<c:when test="${wBean.size()>3 &&'NIGHT'==wBean.get(3)}">
							<td>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" onsubmit="return Confirmclick();" style="margin-bottom: 0px;">
									<input type="submit" id='confirm_btn' value="�ߤW">
								    <input type='hidden' name='man_id' value='${man_id}'>
								    <input type='hidden' name='email' value='${email}'>
								    <input type='hidden' name='wdate' value='${wBean.get(1)}'>
								    <input type='hidden' name='wtime' value='${wBean.get(3)}'>
								    <input type="hidden" name="action"	value="insert">
								 </FORM>
							</td>
						</c:when>
						<c:when test="${wBean.size()>4 &&'NIGHT'==wBean.get(4)}">
							<td>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" onsubmit="return Confirmclick();" style="margin-bottom: 0px;">
									<input type="submit" id='confirm_btn' value="�ߤW">
								    <input type='hidden' name='man_id' value='${man_id}'>
								    <input type='hidden' name='email' value='${email}'>
								    <input type='hidden' name='wdate' value='${wBean.get(1)}'>
								    <input type='hidden' name='wtime' value='${wBean.get(4)}'>
								    <input type="hidden" name="action"	value="insert">
								 </FORM>
							</td>
							
						</c:when>
						<c:otherwise>
							<td>��</td>
						</c:otherwise>
					</c:choose>
					
					<c:if test="${wBean.get(2)!=null}">
						<td class='update'>
						  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/booking.do" onsubmit="return Confirmclick();" style="margin-bottom: 0px;">
						     
						     <input type="submit" id='confirm_btn' style='display:none;'>
						     <input type='hidden' name='man_id' value='${man_id}'>
						     <input type='hidden' name='email' value='${email}'>
						     <input type='hidden' name='wdate' value='${wBean.get(1)}'>
						     <input type='hidden' name='wtime' value=''>
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
//    	$('input.insert').on('click',function(){
//    		console.log($(this).closest('input[name="email"]').val());
//    		   		if($('input[name="email"]').val()=='noLogin'){
//    		   			alert('�Х��n�J');
//    		   			$('input#confirm_btn').click();
//    		   		}else{
//    		   			if(confirm('�T�{�w��?')){
//    		   	   			console.log('sure');
//    		   	   		$(this).closest('input#confirm_btn').click();
   		   	   			
//    		   	   		}else{console.log('no');}
//    		   		}
   		
//    	});
   	
//    	$('input#confirm_btn').on('click',function(){
//    		console.log($(this).closest('input[name="email"]').val());
//    		   		if($('input[name="email"]').val()=='noLogin'){
//    		   			alert('�Х��n�J');
//    		   			$('input#confirm_btn').click();
//    		   		}else{
//    		   			if(confirm('�T�{�w��?')){
//    		   	   			console.log('sure');
//    		   	   		$(this).closest('input#confirm_btn').click();
   		   	   			
//    		   	   		}else{console.log('no');
//    		   				  window.location.reload();		
//    		   	   		}
//    		   		}
   		
//    	});
   	
//    	$('input#confirm_btn').on('click',function(){
//    		console.log('update')
//    		if($('input.bstatue') != null){
//    		//  $('td.update').toggleClass('-on');	
//    			$(this).closest('tr').find('td.update').toggleClass('-on');
//    		}else{
//    			alert("statue must select");
//    		}
   		
//    	});
   	
   	function Confirmclick(){
   		if($('input[name="email"]').val()=='noLogin'){
   			alert('�Х��n�J');
   			window.location.href = '../front_end/login/login.jsp';
   			return false;
   		}else{
   			if(confirm('�T�{�w��?')){
   	   			console.log('sure');
   	   			return true;
   	   			
   	   		}else{console.log('no');
   	   			return false;
   	   		}
   		}
   		
   	} 

   	

   </script>
</body>
</html>