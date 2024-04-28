<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

    <%@ page import="java.sql.*" %>
    <%@ page import="com.connection.Dbconn" %>
    
    <%@ page import="java.util.*" %>
     <%@ page import="java.text.*" %>

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
                          <li ><a href="LoginPage.jsp">Login Page</a></li>
                       	<li><a href="Registration.jsp">Registration Page</a></li>
						</ul>  
                    </div>
                </nav>
                
            </div>
        </div>
    </div>
</section>
<section class="signin-page account">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="block">
                    
                <h2 class="text-center">Mentor Info Show Page</h2>
                 
                <%

			Connection con = Dbconn.conn();
	
	%>
	<table border="1" style="border-color: white;">
	<tr>
	<td><h3>Mentor Email ID</h3></td>
	
	<td><h3>Rating Score</h3></td>
			<td><h3>Action</h3></td>
	</tr>
	
				<%
				DecimalFormat df=new DecimalFormat("#.##");
				  LinkedHashSet<String> al=new LinkedHashSet<String>();
				Statement st1 = con.createStatement();
				String q1 = "select * from tblscore";
				ResultSet rs= st1.executeQuery(q1);
				
				while (rs.next())
				 {
					al.add(rs.getString("Mentor_ID"));
					
				 }
				Statement ss1 = con.createStatement();
				Iterator<String> itr=al.iterator();  
				while(itr.hasNext()){ 
					int rating=0,total=0;
					String Mentoremail=itr.next();
					String qrry1 = "select * from tblrating where Email_ID='"+Mentoremail+"'";
					ResultSet rs1= ss1.executeQuery(qrry1);
					while (rs1.next())
					 {
					 rating=rating+rs1.getInt("Rating_values");
					 total++;
					 }
					String score="";
					double ratingscore=(double)rating/total;
					
					if(Double.isNaN(ratingscore))
					{
						score="0.00";
						System.out.println(ratingscore);
					}
					else
					{
					score=String.valueOf(df.format(ratingscore));
					}
					 
       		 %>	
       		 <tr>
          
              <td> <%= Mentoremail %> </td>
              <td  class="col-md-6" align="left"> 
             
             <%=score%>
             </td>
             <td>
           <a href="searchword?Mentor_Email_ID=<%=Mentoremail%>"><input type="button" name="Download" value="Confirm" class="btn btn-info"></a>
              </td>
               
         
               
               </tr>
       		  <%
       		  
				 }

%>
</table>
</div>
            </div>
        </div>
    </div>
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

            