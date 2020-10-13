<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.stream.Collectors"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.booking.model.bean.*"%>
<%@ page import="com.booking.model.dao.*"%>
<%@ page import="com.booking.model.service.*"%>
<%@ page import="com.manager.model.*"%>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="mSvc" scope="page" class="com.manager.model.ManagerService" />
<!DOCTYPE html>
<html>
<head>
<title>上班時間設定</title>
<style type="text/css">
	table{
		border:1px solid black;
	}
	
	td,th{
		border: 1px solid gray;
	}
	
	input, select{
		box-sizing: border-box;
		height:20px;
	}
</style>
</head>
<body>
<button onclick='javascript:history.back()'>回上頁</button> 
<button onclick="window.location.href = '<%=request.getContextPath()%>/back_end/booking/booking_listone.jsp'">查詢預約單</button>

<%	
		int manid = 2;
		ManagerService mSsvc = new ManagerService();
		if(manid==1){
			List<ManagerVO> mlist = mSvc.getAll().stream()
									.filter(p -> p.getAuthority()>1)
									.collect(Collectors.toList());
			pageContext.setAttribute("mList", mlist);
		}else{
			List<ManagerVO> mlist =mSvc.getAll().stream()
					.filter(p -> p.getMan_id()==manid)
					.collect(Collectors.toList());
			pageContext.setAttribute("mList", mlist);
		}
		
		
		
		
		WorkdateService wSvc = new WorkdateService();
		List<WorkdateBean> wList = null;
		if(manid==1){
			wList = wSvc.selectAll();
// 			pageContext.setAttribute("wlist", wList);
		}
		else{
			 wList = wSvc.selectAll().stream()
													.filter(p -> p.getMan_id()==manid)
													.collect(Collectors.toList());
// 			pageContext.setAttribute("wlist", wList);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Map<String, List<String>> dateMap = new HashMap<String, List<String>>();
		List<List> wrsList = new ArrayList<List>();
		
		for(WorkdateBean wb : wList){
			String wdates = sdf.format(wb.getWdate());
			String key=wb.getMan_id()+ wdates;
			System.out.println("key1:"+key);
			
			
			if(dateMap.get(key)==null){
				List<String> wtime = new ArrayList<String>();
				wtime.add(wb.getWtime());
				dateMap.put(key, wtime);
			}else{
				dateMap.get(key).add(wb.getWtime());
			}
		}
		String wdates = "";
		List<List<String>> rsList = new ArrayList<List<String>>();
		for(WorkdateBean wb : wList){
			
			String wcheck = sdf.format(wb.getWdate());	
			System.out.println("wdates:" + wcheck);
			if(wcheck.equals(wdates)){
				continue;
			}else{
				wdates = wcheck;
				String key=wb.getMan_id()+ wcheck;
				System.out.print("key"+ key);
				List<String> wblist = new ArrayList<String>();
				wblist.add(Integer.toString(wb.getMan_id()));
				wblist.add(wcheck);
				List<String> mapList = dateMap.get(key);
				if(mapList == null){
					System.out.println("Null List");
				}else{
					for(String wtimes : mapList){
						wblist.add(wtimes);
						System.out.println(wtimes);
					}
				}
				rsList.add(wblist);

			}
			
			
		}
		
		for(List<String> list :rsList){
			for(String e: list){
				System.out.print("rsList:"+e+"\t");
				e.equals("DAY");
			}
			System.out.println();
		}
		System.out.println("haha");	
		pageContext.setAttribute("rslist", rsList);
		
	%>

		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/booking/avalible.do" style="margin-bottom: 0px;">
			<table>
				<tbody>
				<tr>
					<td>
						<select name='man_id'>
							<c:forEach var='mVO' items='${mList}'>
								<option value='${mVO.man_id}'>
									${mVO.name} :  
										<c:choose>
											<c:when test="${mVO.authority==2}"> 療癒師</c:when>
											<c:when test="${mVO.authority==3}"> 占卜師</c:when>
										</c:choose>
								</option>
							</c:forEach>
						</select>
					</td>	
					<td>
						<input type='date' name='wdate'>
					</td>
					<td>
						<select name = "wtime">
							<option value = "DAY" selected="selected">上午</option>
							<option value = "NOON">下午</option>
							<option value = "NIGHT">晚上</option>
						</select>
					</td>
					<td>
						<input type="submit" value="新增可預約時間">
						<input type="hidden" name="action"	value="insert">
					</td>
					</tr>
				</tbody>
			</table>
		</FORM>
	<table>
		<tbody>
		<c:forEach var='mVO' items='${mList}'>
			<input type='hidden' name='account' id='man_id' value='${mVO.man_id} '>
			<tr>
				<th style=""colspan='5'">${mVO.name}</th>				
							
			</tr>
			<tr>
				<th>服務類型</th>
				<th>工作日期</th>
				<th colspan='3'>工作時段</th>
			</tr>
			<c:forEach var='wBean' items='${rslist}'>
				<c:if test="${mVO.man_id==Integer.parseInt(wBean.get(0))}">
					<tr>
						<td>
								<c:choose>
									<c:when test="${mVO.authority==2}"> 療癒服務</c:when>
									<c:when test="${mVO.authority==3}"> 占卜服務</c:when>
								</c:choose>
							
						</td>
						<td>${wBean.get(1)}</td>
<%-- 							<%! SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); --%>
<%-- 							 %> --%>
<%-- 							<c:forEach var='wtimes' items="${dateMap.get(wBean.man_id+wBdate)}"> --%>
							
<!-- 							<td> -->
<%-- 							 ${wtimes} --%>
<!-- 							</td> -->
<%-- 							</c:forEach> --%>
						<td>
							<c:choose>
								<c:when test="${wBean.get(2).equals('DAY')}">上午</c:when>
								<c:otherwise>休息</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${wBean.get(2).equals('NOON')}">下午</c:when>
								<c:when test="${wBean.size()>=4 && wBean.get(3).equals('NOON')}">下午</c:when>
								<c:otherwise>休息</c:otherwise>
							</c:choose>
<!-- 							||wBean.get(3).equals('NOON')||wBean.get(4).equals('NOON') -->
						</td>
						<td>
							<c:choose>
								<c:when test="${wBean.get(2).equals('NIGHT')}">晚上</c:when>
								<c:when test="${wBean.size()>=4 &&wBean.get(3).equals('NIGHT')}">晚上</c:when>
								<c:when test="${wBean.size()>=5 && wBean.get(4).equals('NIGHT')}">晚上</c:when>
								<c:otherwise>休息</c:otherwise>
							</c:choose>
<%-- 							<c:when test="${wBean.get(2).equals('NIGHT')||wBean.get(3).equals('NIGHT')||wBean.get(4).equals('NIGHT')}">下午</c:when> --%>
						</td>
					</tr>
				</c:if>
				
			</c:forEach>
			</c:forEach>
		</tbody>
		
		
	</table>
	
	<script type="text/javascript">
		
	</script>
	

</body>
</html>