<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
                                                     
                            
                        </ul>
                    </div>
                </nav>
                
            </div>
        </div>
    </div>
</section>
<section class="signin-page account">
    <div class="container">
        <div style="height: 100%">
            <div  style="margin-top: 10px">
                <div >
                   <h2 class="text-center">Register Page </h2>
	
			<form  action="Registration" method="post">
			
			<table border="1">
			<tr>
				
					<td  class="col-md-2" style="width: 10%;">Select:</td>

					<td  class="col-md-6" align=left style="font-size: 20px;"><input type="radio"
						name="rdo1" required value="UserInfo" id="User" />User
							<input
						type="radio" required name="rdo1" value="MentorInfo" id="Author" />Mentor
						</td>
										</tr>
	       <tr>
			<td class="col-md-2"><label for="txt_Uname">User Name:</label></td>
		    <td class="col-md-6"><input type="text" class="form-control" name="txt_Uname" id="txt_Uname" placeholder="Enter Name" required></td>
		    </tr>
		    <tr>
		    <td class="col-md-2"><label for="txt_Address">Address:</label></td>
		    <td class="col-md-6"><input type="text" class="form-control" name="txt_Address" id="txt_Address" placeholder="Enter Name" required></td>
		    </tr>
		    <tr>
		    <td class="col-md-2"><label for="txt_Email">Email Id:</label></td>
		    <td class="col-md-6"><input type="text" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" name="txt_Email" id="txt_Email" placeholder="Enter Name"required></td>
		    </tr>
		    <tr>
		    <td class="col-md-2"><label for="txt_Number">Mobile No:</label></td>
		    <td class="col-md-6"><input type="text" class="form-control" maxlength="10" pattern="[7-9]{1}[0-9]{9}" name="txt_Number" id="txt_Number" placeholder="Enter Mobile No" required></td>
		    </tr>
		<tr>
              <td class="col-md-2"><div align="left">Select Gender </div></td>
              <td class="col-md-6"><div align="left">
                <select name="gender" class="form-control" required>
                <option value="">Select Gender</option>
                  <option value="Male">Male</option>
                  <option value="Female">Female</option>
                  </select>
              </div></td>
            </tr>
		
		    <tr>
			<td class="col-md-2"><label for="txt_Password">Password:</label></td>
			<td class="col-md-6"><input type="password" class="form-control" name="txt_Password" id="txt_Password" placeholder="Enter Set Password"  required></td>
			</tr>
			<tr>
								<td class="col-md-2"><label for="txt_ConPassword">Enter
										Skill Data:</label></td>
								<td class="col-md-6"><textarea id="skilldata"
										name="skilldata" class="form-control" rows="2" cols="50">
									</textarea></td>
							</tr>
			<tr>
			<td class="col-md-6" colspan="2" align="center" >
			<input type="submit" class="btn-primary" name="btn_Register" id="btn_Register" Value="Register"><br>
			<a class="active" href="LoginPage.jsp" style="color: red">Login User</a></td>
			</tr>
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
						
			