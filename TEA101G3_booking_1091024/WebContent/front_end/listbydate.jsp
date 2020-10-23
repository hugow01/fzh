<!-- **************************************************  東西放在這！ START!  ************************************************** -->

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<!--  **************************************************  東西放在這！ END!  ************************************************** -->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- **************************************************  東西放在這！ START!  ************************************************** -->

<title>線上預約</title>

<!-- **************************************************  東西放在這！ END!  ************************************************** -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:200,300,400,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/css/owl.theme.default.min.css">

<!-- Flaticons  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/fonts/flaticon/font/flaticon.css">

<!-- Date Picker -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/css/bootstrap-datepicker.css">

<!-- Theme style  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/css/style.css">

<!-- Modernizr JS -->
<script
	src="<%=request.getContextPath()%>/front_end/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

<!-- **************************************************  CSS東西放在這！ START!  ************************************************** -->
	
<!-- **************************************************  東西放在這！END!  ************************************************** -->
</head>
<body>

	<div class="colorlib-loader"></div>
	<div id="page">
        <!-- menu -->
	    <%@ include file="./menu.jsp" %>
		<aside id="colorlib-hero" class="colorlib-degree-bg">
			<div class="flexslider">
				<ul class="slides">
					
<!-- -----------------------------------------------------------首頁改圖----------------------------------------------------------- -->
					
					<li style="background-image: url(<%=request.getContextPath()%>/front_end/images/img_bg_1.jpg);">
					
<!-- -----------------------------------------------------------首頁改圖----------------------------------------------------------- -->
					
						<div class="overlay"></div>
						<div class="container-fluid">
							<div class="row">
								<div
									class="col-md-6 col-sm-12 col-xs-12 col-md-offset-3 slider-text">
									<div class="slider-text-inner text-center">
										<h1>預約線上服務</h1>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</aside>

		<div id="colorlib-contact" style="background-image: url(<%=request.getContextPath()%>/front_end/images/bg1460x1460.png);background-position:right bottom;background-size:contain;background-repeat:no-repeat;">
			<div class="container">
				<div class="row">
				<div class="horoscope_section" >

<!-- **************************************************  網頁內容 東西放在這！ START!  ************************************************** -->
			
				<jsp:include  page="/front_end/booking/List_by_Date2.jsp">
			     	<jsp:param name="mmap" value="${mmap}" />
			     	<jsp:param name="wList" value="${wList}" />
			     	<jsp:param name="user" value="${user}" />
          		 </jsp:include>	
    

<!-- **************************************************  東西放在這！ END!  ************************************************** -->
				</div>
				</div>
			</div>
		</div>
        <!-- Footer -->
        <%@ include file="./footer.jsp" %>
	</div><!--id="page" end -->

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>

	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/front_end/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script
		src="<%=request.getContextPath()%>/front_end/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script
		src="<%=request.getContextPath()%>/front_end/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script
		src="<%=request.getContextPath()%>/front_end/js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script
		src="<%=request.getContextPath()%>/front_end/js/jquery.stellar.min.js"></script>
	<!-- Flexslider -->
	<script
		src="<%=request.getContextPath()%>/front_end/js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script
		src="<%=request.getContextPath()%>/front_end/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script
		src="<%=request.getContextPath()%>/front_end/js/jquery.magnific-popup.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/js/magnific-popup-options.js"></script>
	<!-- Counters -->
	<script
		src="<%=request.getContextPath()%>/front_end/js/jquery.countTo.js"></script>
	<!-- Date Picker -->
	<script
		src="<%=request.getContextPath()%>/front_end/js/bootstrap-datepicker.js"></script>
	<!-- Main -->
	<script src="<%=request.getContextPath()%>/front_end/js/main.js"></script>

</body>
</html>

