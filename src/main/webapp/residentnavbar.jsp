<%@page import="com.klef.jfsd.sdpproject.model.Resident"%>
<%@page import="com.klef.jfsd.sdpproject.model.Admin"%>

<% 
    Resident resident =  (Resident) session.getAttribute("resident");
    %>
<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Prime Homes</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
 
  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Impact
  * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body class="index-page">

  <header id="header" class="header fixed-top">

    <div class="topbar d-flex align-items-center">
      <div class="container d-flex justify-content-center justify-content-md-between">
        <div class="contact-info d-flex align-items-center">
          <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:@example.com">primehome@email.com</a></i>
          <i class="bi bi-phone d-flex align-items-center ms-4"><span>+1 1234567890</span></i>
        </div>
        <div class="social-links d-none d-md-flex align-items-center">
          <a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a>
          <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
          <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
          <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
        </div>
      </div>
    </div><!-- End Top Bar -->

    <div class="branding d-flex align-items-cente">

      <div class="container position-relative d-flex align-items-center justify-content-between">
        <a href="residentdashboard" class="logo d-flex align-items-center">
          <!-- Uncomment the line below if you also wish to use an image logo -->
          <!-- <img src="assets/img/logo.png" alt=""> -->
          <h1 class="sitename" style="font-size: 27px;">
            <i class="fas fa-home"></i>  Prime Home
            <i class="fas fa-home"></i>
            
        </h1>
          <span> </span>
        </a>

        <nav id="navmenu" class="navmenu">
    <ul>
        <li><a href="residentdashboard" class="active">Home<br></a></li>
        <!-- <li><a href="residentdashboard#aboutt">About</a></li> -->
        <!-- <li><a href="residentdashboard#service">Services</a></li> -->
       <!--  <li><a href="residentdashboard#recent-posts">Blog</a></li> -->
         <li class="dropdown"><a href="#"><span>Consultants</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
            <li><a href="res_viewalldesigners">Home Renovation Consultants</a></li>
            
            
                <!-- <li><a href="#">Real Estate Advisors</a></li> -->
                <!-- <li class="dropdown"><a href="#"><span>Specialized Consultants</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                    <ul>
                        <li><a href="#">Investment Consultants</a></li>
                        
                    </ul>
                </li> -->
            </ul>
        </li>
        <li class="dropdown">
            <a href="#"><span>Resources</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
                <!-- <li><a href="#">Local Services</a></li> -->
                <li class="dropdown">
                    <a href="#"><span>Tips</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                    <ul>
                        <li><a href="#">Home Safety Tips</a></li>
                        <!-- <li><a href="#">Budgeting Tips</a></li> -->
                    </ul>
                </li>
            </ul>
        </li>

        
        

        <li>
            <a href="#contact" style="
                display: inline-block;
                padding: 10px 20px;
                background-color: white; /* White background */
                color: #9317E1;          /* Purple text */
                text-align: center;
                text-decoration: none;
                border: 2px solid #9317E1; /* Optional: border to match text color */
                border-radius: 5px;
                transition: background-color 0.3s ease, color 0.3s ease;">
                Contact
            </a>
        </li>
        <li>
            <a href="feedback" style="
                display: inline-block;
                padding: 10px 20px;
                background-color: white; /* White background */
                color: #9317E1;          /* Purple text */
                text-align: center;
                text-decoration: none;
                border: 2px solid #9317E1; /* Optional: border to match text color */
                border-radius: 5px;
                transition: background-color 0.3s ease, color 0.3s ease;">
                FeedBack
            </a>
        </li>
        <li class="dropdown">
            <a href="#"  data-bs-toggle="dropdown" aria-expanded="false">
                Welcome, <%= resident.getUserName() %> <i class="bi bi-chevron-down toggle-dropdown"></i>
            </a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="resprofile">Profile</a></li>
                <li><a class="dropdown-item" href="resident_consultations">My Consultations</a></li>
                <li><a class="dropdown-item" href="index">Logout</a></li>
            </ul>
        </li>
    </ul>
    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
</nav>

      </div>

    </div>

  </header>

 
  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>

</body>
<style>
  .sitename {
    font-family: 'Cinzel', serif;
    font-size: 3em;
    color: white; /* Set sitename color to white */
    text-align: center;
    margin: 20px 0;
    font-weight: 700;
  }

  body {
    font-family: 'Poppins', sans-serif; 
    font-weight: 400; 
  }

  h1, h2, h3, h4 {
    font-family: 'Cinzel', serif; 
    font-weight: 700; 
  }

  .footer {
    background-color: #9317E1; /* Ensure this contrasts well with white */
  }

  .footer p {
    color: white; /* Set copyright text color to white */
  }

  .accent {
    font-family: 'Cinzel', serif; 
  }

  .team .container {
    justify-content: center; 
    flex-wrap: wrap; 
  }

  .team .member {
    flex: 1 0 300px; 
    margin: 170px;
    margin-top: -10px; 
    max-width: 350px; 
    text-align: center; 
  }

  .team .member {
    border: 1px solid #ddd; /* Border around cards */
    padding: 20px; /* Padding inside cards */
    border-radius: 10px; /* Rounded corners */
    text-align: center; /* Center align text */
    transition: transform 0.3s; /* Smooth hover effect */
}

.team .member:hover {
    transform: scale(1.05); /* Slightly enlarge on hover */
}

.team .member img {
    max-width: 100%; /* Ensure images don't exceed their container */
    height: auto; /* Maintain aspect ratio */
    border-radius: 10px; /* Rounded corners for images */
}
.member {
    margin: 10px; /* Adds space between cards */
}

@media (max-width: 768px) {
    .member {
        padding: 15px; /* Adjust padding for smaller screens */
    }
}



</style>
</html>