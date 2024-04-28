<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.algo.*" %>
    <%@ page import="com.connection.Dbconn" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.connection.Dbconn" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html lang="zxx"> <!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Bingo One page parallax responsive HTML Template ">
  
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
  <link rel="stylesheet" href="plugins/bootstrap/dist/css/bootstrap.min.css">
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick-theme.css">
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="jsnew/jquery-1.9.1.min.js"></script>
 <script src="jsnew/highcharts.js"></script>
<script>
    <%        
    ArrayList<String> score=new ArrayList<>();
    ArrayList<String> index=new ArrayList<>();
    Connection con = Dbconn.conn();
    int id=1;
    Statement stat1 = con.createStatement();
	String qrry1 = "select * from tblmentorrating order by Rating_values desc";
	ResultSet rs1= stat1.executeQuery(qrry1);
	while (rs1.next())
	 {
		index.add(rs1.getString("Email_ID"));
		score.add(rs1.getString("Rating_values"));
		id++;
	 }
   
   String  ranking=score.toString().replace("[", "").replace("]", "")
   	    .replace(", ", ",");//y
   	 System.out.println(ranking); 
  String  ids=index.toString().replace("[", "").replace("]", "")
    	    	    .replace(", ", "','");//y
    	    	    System.out.println(ids); 
 
   
    %>
    
    
    $(function () {
        $('#containergss').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: 'User Rating Graph'
            },
            subtitle: {
               
            },
            xAxis: {
            	 title: {
                     text: 'Calculate Rating values'
                 },
            	categories: ['<%=ids%>'],
            	labels: {
                    rotation: -45,
                    style: {
                        fontSize: '13px',
                        fontFamily: 'Verdana, sans-serif'
                    }
                }

                
            },
            yAxis: {
            	 title: {
                     text: 'Calculates the Rating'
                 },
                              
            },
            legend: {
                enabled: true
            },
            tooltip: {
                pointFormat: '<b>{point.y:1f}%</b>'
            },
            series: [{
                name: 'Rating Score',
                
                data: [<%=ranking%>]

            }]
        });
    });
    
</script>
  

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
            <div class="col-md-12">
                
            </div>
        </div>
    </div>
</section>
<section class="header  navigation">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav class="navbar navbar-expand-lg">
                    <a class="navbar-brand" href="#">
                       <jsp:include page="titlepage.jsp"></jsp:include>
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="tf-ion-android-menu"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">

								<li class="active"><a href="AdminHome.jsp">Home</a></li>

								<li><a href="MentorAnalysisRating.jsp">Mentor Graph</a></li>
								<li><a href="AnalysisRating.jsp">User Graph</a></li>


								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown"><%=session.getAttribute("nameadmin")%><i
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
    
                    
                 <table border="1">
              <tr>
              <td align="left">
             
              <div id="containergss" style="min-width: 850px; height: 450px; max-width: 200px;"></div>
             
              </td>
             
              </tr>
            
              </table>  
                
</section>
<footer id="footer" class="bg-one">
  <div class="top-footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-3 col-md-3 col-lg-3">
         
        </div>
        <!-- End of .col-sm-3 -->

        <div class="col-sm-3 col-md-3 col-lg-3">
          
        </div>
        <!-- End of .col-sm-3 -->

        <div class="col-sm-3 col-md-3 col-lg-3">
          
        </div>
        <!-- End of .col-sm-3 -->

        <div class="col-sm-3 col-md-3 col-lg-3">
          
        </div>
        <!-- End of .col-sm-3 -->

      </div>
    </div> <!-- end container -->
  </div>
  <div class="footer-bottom">
   
  </div>
</footer> <!-- end footer -->


    <!-- end Footer Area
    ========================================== -->

    
    <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <!-- Bootstrap -->
    <!-- Owl Carousel -->
    <!-- Custom js -->
    <script src="js/script.js"></script>

  </body>
  </html>
