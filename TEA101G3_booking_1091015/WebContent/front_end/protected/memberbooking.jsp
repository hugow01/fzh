<%@page import="java.io.PrintWriter,com.member.model.*,java.util.*,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
 //MemberVO memberVO = (MemberVO)request.getSession().getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>香氛能量館</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Work+Sans:200,300,400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front_end/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front_end/css/icomoon.css">
	<!-- Bootstrap  --> 
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front_end/css/bootstrap.css">
 	
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front_end/css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front_end/css/flexslider.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front_end/css/owl.carousel.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front_end/css/owl.theme.default.min.css">
	
	<!-- Flaticons  -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front_end/fonts/flaticon/font/flaticon.css">

	<!-- Date Picker -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front_end/css/bootstrap-datepicker.css">
	
	<!-- Theme style  -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front_end/css/style.css">

	<!-- Modernizr JS -->
	<script src="<%=request.getContextPath()%>/front_end/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	
	
	<!-- CSS only -->
	<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front_end/css/register.css">
	
	<!-- bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	<script src="<%=request.getContextPath()%>/front_end/js/register.js"></script>

	<script>
  	$( function() {
    	$( "#exampleInputBirthday" ).datepicker();
  	} );
  	</script>
</head>
<body>
	<div class="colorlib-loader"></div>

	<div id="page">
        <!-- menu -->
	    <%@ include file="../menu.jsp" %>
		<aside id="colorlib-hero" class="colorlib-degree-bg">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(<%=request.getContextPath()%>/front_end/images/img_bg_1.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-sm-12 col-xs-12 col-md-offset-3 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h1>會員中心-個人預約查詢</h1>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>

		<div id="colorlib-contact" style="height:2000px;width:500px;margin-left:300px;margin-right:300px;">
		  <div>
			  <jsp:include page="./booking/MemberBooking.jsp">
			  	<jsp:param value="${bList}" name="bList"/>
			  </jsp:include>
		  </div>		
		</div>
        <!-- Footer -->
        <%@ include file="../footer.jsp" %>
	</div><!--id="page" end -->

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/front_end/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="<%=request.getContextPath()%>/front_end/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="<%=request.getContextPath()%>/front_end/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="<%=request.getContextPath()%>/front_end/js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="<%=request.getContextPath()%>/front_end/js/jquery.stellar.min.js"></script>
	<!-- Flexslider -->
	<script src="<%=request.getContextPath()%>/front_end/js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="<%=request.getContextPath()%>/front_end/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="<%=request.getContextPath()%>/front_end/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=request.getContextPath()%>/front_end/js/magnific-popup-options.js"></script>
	<!-- Counters -->
	<script src="<%=request.getContextPath()%>/front_end/js/jquery.countTo.js"></script>
	<!-- Date Picker -->
	<script src="<%=request.getContextPath()%>/front_end/js/bootstrap-datepicker.js"></script>
	<!-- Google Map -->
	<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script> -->
	<!-- <script src="js/google_map.js"></script> -->
	<!-- Main -->
	<script src="<%=request.getContextPath()%>/front_end/js/main.js"></script>

</body>
</html>