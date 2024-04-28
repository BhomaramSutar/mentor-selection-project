<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.Dbconn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.activity.*"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="zxx">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description"
	content="Bingo One page parallax responsive HTML Template ">

<meta name="author" content="Themefisher.com">

<title>Mentor Project</title>

<!-- Mobile Specific Meta
  ================================================== -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" />

<!-- CSS
  ================================================== -->
<!-- Themefisher Icon font -->
<link rel="stylesheet" href="plugins/themefisher-font.v-2/style.css">
<!-- bootstrap.min css -->
<link rel="stylesheet"
	href="plugins/bootstrap/dist/css/bootstrap.min.css">
<!-- Slick Carousel -->
<link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
<link rel="stylesheet"
	href="plugins/slick-carousel/slick/slick-theme.css">
<!-- Main Stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link href='http://fonts.googleapis.com/css?family=Nova+Mono'
	rel='stylesheet' type='text/css'>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript"
	src="//pagead2.googlesyndication.com/pagead/show_ads.js">
	
</script>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<style>
@import
	url(http://fonts.googleapis.com/css?family=Roboto:500,100,300,700,400);

* {
	margin: 0;
	padding: 0;
	font-family: roboto;
}

.cont {
	width: 93%;
	max-width: 350px;
	text-align: center;
	margin: 4% auto;
	padding: 30px 0;
	background: #111;
	color: #EEE;
	border-radius: 5px;
	border: thin solid #444;
	overflow: hidden;
}

hr {
	margin: 20px;
	border: none;
	border-bottom: thin solid rgba(255, 255, 255, .1);
}

div.title {
	font-size: 2em;
}

h1 span {
	font-weight: 300;
	color: #Fd4;
}

div.stars {
	width: 270px;
	display: inline-block;
}

input.star {
	display: none;
}

label.star {
	float: right;
	padding: 10px;
	font-size: 36px;
	color: #444;
	transition: all .2s;
}

input.star:checked ~ label.star:before {
	content: '\f005';
	color: #FD4;
	transition: all .25s;
}

input.star-5:checked ~ label.star:before {
	color: #FE7;
	text-shadow: 0 0 20px #952;
}

input.star-1:checked ~ label.star:before {
	color: #F62;
}

label.star:hover {
	transform: rotate(-15deg) scale(1.3);
}

label.star:before {
	content: '\f006';
	font-family: FontAwesome;
}
</style>


</head>

<body id="body">

	<!--
  Start Preloader
  ==================================== -->
	<div id="preloader">
		<div class="preloader">
			<div class="sk-circle1 sk-child"></div>
			<div class="sk-circle2 sk-child"></div>
			<div class="sk-circle3 sk-child"></div>
			<div class="sk-circle4 sk-child"></div>
			<div class="sk-circle5 sk-child"></div>
			<div class="sk-circle6 sk-child"></div>
			<div class="sk-circle7 sk-child"></div>
			<div class="sk-circle8 sk-child"></div>
			<div class="sk-circle9 sk-child"></div>
			<div class="sk-circle10 sk-child"></div>
			<div class="sk-circle11 sk-child"></div>
			<div class="sk-circle12 sk-child"></div>
		</div>
	</div>
	<!--
  End Preloader
  ==================================== -->



	<!--
Fixed Navigation
==================================== -->
	<section class="top-header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</section>
	<section class="header  navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar navbar-expand-lg">
						<a class="navbar-brand" href="#"> <jsp:include
								page="titlepage.jsp"></jsp:include>
						</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="tf-ion-android-menu"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ml-auto">

								<li class="active"><a href="MentorHome.jsp">Home</a></li>

								<li><a href="Shedule_Meet.jsp">Shedule Meet</a></li>
								<li><a href="Mentor_Rating_page.jsp">Rating</a></li>

								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown"><%=session.getAttribute("mname")%><i
										class="fa fa-angle-down"></i></a>
									<ul class="dropdown-menu">
										<li><a href="Login">Logout</a></li>
									</ul></li>


							</ul>
						</div>
					</nav>

				</div>
			</div>
		</div>
	</section>
	<section class="signin-page account">
		<div style="width: 80%" align="center">
			<div style="width: 100%">
				<div style="width: 100%">
					<div style="width: 100%">
						<h2 class="text-center">Rating Page</h2>

						<%
							Connection con = Dbconn.conn();
						%>
						<form action="Mentor_Rating_Page" method="post">
							<table border="1" style="border-color: white; width: 100%">
								<tr>
									<td><h3>User Email ID</h3></td>

									<td><h3>Rating Stra</h3></td>
									<td><h3>Rating</h3></td>
								</tr>

								<%
									String email = (String) session.getAttribute("memailid");
									int i = 1;
									Statement stat1 = con.createStatement();
									String qrry1 = "select * from candidateregistration where Mentor_ID='"
											+ email + "'";
									ResultSet rs1 = stat1.executeQuery(qrry1);
									while (rs1.next()) {
								%>
								<tr>

									<td align="right">
									
									<input type="radio" style="border-color: gray;width: 100%"
										name="txt_search" id="txt_search" required="required"
										value="<%=rs1.getString("Uemail")%>" /><%=rs1.getString("Uemail")%>
									</td>
									<td align="right"><input class="star star-1" id="star-1"
										type="radio" value="1" name="star" /> <label
										class="star star-1" for="star-1"></label> <input
										class="star star-2" id="star-2" type="radio" value="2"
										name="star" /> <label class="star star-2" for="star-2"></label>
										<input class="star star-3" id="star-3" type="radio" value="3"
										name="star" /> <label class="star star-3" for="star-3"></label>
										<input class="star star-4" id="star-4" type="radio" value="4"
										name="star" /> <label class="star star-4" for="star-4"></label>
										<input class="star star-5" id="star-5" type="radio" value="5"
										name="star" /> <label class="star star-5" for="star-5"></label>
									</td>

									<td><input type="submit" name="btn_Submit" id="btn_Submit"
										Value="Save Rating"><br></td>


								</tr>
								<%
									i++;
									}
								%>
							</table>
						</form>





					</div>
				</div>
			</div>
		</div>
	</section>
	<footer id="footer" class="bg-one">
		<div class="top-footer">
			<div class="container">
				<div class="row">
					<div class="col-sm-3 col-md-3 col-lg-3"></div>
					<!-- End of .col-sm-3 -->

					<div class="col-sm-3 col-md-3 col-lg-3"></div>
					<!-- End of .col-sm-3 -->

					<div class="col-sm-3 col-md-3 col-lg-3"></div>
					<!-- End of .col-sm-3 -->

					<div class="col-sm-3 col-md-3 col-lg-3"></div>
					<!-- End of .col-sm-3 -->

				</div>
			</div>
			<!-- end container -->
		</div>
		<div class="footer-bottom"></div>
	</footer>
	<!-- end footer -->


	<!-- end Footer Area
    ========================================== -->


	<!-- 
    Essential Scripts
    =====================================-->

	<!-- Main jQuery -->
	<script src="plugins/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="plugins/bootstrap/dist/js/popper.min.js"></script>
	<script src="plugins/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Owl Carousel -->
	<script src="plugins/slick-carousel/slick/slick.min.js"></script>
	<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
	<!-- Smooth Scroll js -->
	<script src="plugins/smooth-scroll/dist/js/smooth-scroll.min.js"></script>

	<!-- Custom js -->
	<script src="js/script.js"></script>

</body>
</html>
