<%@page import="com.klef.jfsd.sdpproject.model.Admin"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


<% 
    Admin admin =  (Admin) session.getAttribute("admin");
    %>
    
<!DOCTYPE html>

<html lang="en">

<head>
  <!-- Load Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>View All Residents - Prime Home</title>
  <meta name="description" content="">
  <meta name="keywords" content="Admin, View Residents">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;500;600;700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

  <style>
      body {
          font-family: 'Poppins', sans-serif;
      }

      .sitename {
          font-family: 'Cinzel', serif;
          font-size: 3em;
          color: white;
          text-align: center;
          margin: 20px 0;
          font-weight: 700;
      }

      h3 {
      color:black;
          text-align: center;
          text-decoration: underline;
          margin: 20px 0;
      }

      table {
       
          width: 100%;
          max-width: 1400px;
          margin: 50px auto;
          border-collapse: collapse;
          background-color: #fff;
      }
       h1, h2, h3, h4 {
      font-family: 'Cinzel', serif; 
      font-weight: 700; 
    }

      table, th, td {
          border: 0px solid #d3d3d3;
      }

      th, td {
         
          padding: 18px;
          text-align: center;
          word-wrap: break-word;
      }

      th {
      font-family: 'Cinzel', serif; 
          background-color: #9317E1;
          color: white;
      }

      tr:nth-child(even) {
          background-color: #f2f2f2;
      }

      .footer {
          background-color: #9317E1;
      }

      .footer p {
          color: white;
      }
  </style>
</head>

<body class="index-page">

  <header id="header" class="header fixed-top">
    <div class="topbar d-flex align-items-center">
      <div class="container d-flex justify-content-center justify-content-md-between">
        <div class="contact-info d-flex align-items-center">
          <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:primehome@email.com">primehome@email.com</a></i>
          <i class="bi bi-phone d-flex align-items-center ms-4"><span>+1 1234567890</span></i>
        </div>
        <div class="social-links d-none d-md-flex align-items-center">
          <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
          <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
          <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
          <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
        </div>
      </div>
    </div><!-- End Top Bar -->

    <div class="branding d-flex align-items-center">
      <div class="container position-relative d-flex align-items-center justify-content-between">
        <a href="index.html" class="logo d-flex align-items-center">
          <h1 class="sitename">
            <i class="fas fa-home"></i> Prime Home <i class="fas fa-home"></i>
          </h1>
          <span>.</span>
        </a>

        <nav id="navmenu" class="navmenu">
          <ul>
            <li><a href="admindashboard" class="active">Home</a></li>
            <li class="dropdown"><a href="#"><span>Manage</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
              <ul>
                <li><a href="viewallresidents">Users</a></li>
                
                <li><a href="propertiestable">Property</a></li>
              </ul>
            </li>
            <li class="dropdown"><a href="#"><span>Communicate</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
              <ul>
                <li><a href="#">Announcements</a></li>
              </ul>
            </li>
            <li class="dropdown"><a href="#"><span>Engage</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
              <ul>
                <li><a href="#">Feedbacks</a></li>
                <li><a href="#">Contact Us</a></li>
              </ul>
            </li>
            <li class="dropdown">
            <a href="#"  data-bs-toggle="dropdown" aria-expanded="false">
                Welcome, <%= admin.getUsername() %> <i class="bi bi-chevron-down toggle-dropdown"></i>
            </a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="profile">Profile</a></li>
                <li><a class="dropdown-item" href="index">Logout</a></li>
            </ul>
        </li>
          </ul>
          <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
      </div>
    </div>
  </header>

  <main class="main">

    <!-- Page Title -->
    <div class="page-title">
      <div class="heading">
        <div class="container">
          <div class="row d-flex justify-content-center text-center">
            <div class="col-lg-8">
              <h1>View All Residents</h1>
              <p class="mb-0">Here you can see all registered residents along with their details.</p>
            </div>
          </div>
        </div>
      </div>
    </div><!-- End Page Title -->
 <div style="display: flex; justify-content: center; color: purple;align-items: center; font-family: 'Cinzel', serif;font-weight: bold; font-size: 1.2rem; height: 60px;">
    Total Residents = <c:out value="${count}"></c:out>
</div>
    <table>
      <tr>
        <th>ID</th>
        <th>USERNAME</th>
        <th>EMAIL</th>
        <th>MOBILE NO</th>
        <th>ADDRESS</th>
        <th>POSTAL CODE</th>
        <th>STATE</th>
        <th>AREA</th>
        <th>COUNTRY</th>
        <th>ACTION</th>
      </tr>
      <c:forEach items="${residentlist}" var="rsd">
        <tr>
          <td><c:out value="${rsd.id}"/></td>
          <td><c:out value="${rsd.userName}"/></td>
          <td><c:out value="${rsd.email}"/></td>
          <td><c:out value="${rsd.mobile}"/></td>
          <td><c:out value="${rsd.addressLine}"/></td>
          <td><c:out value="${rsd.postcode}"/></td>
          <td><c:out value="${rsd.state}"/></td>
          <td><c:out value="${rsd.area}"/></td>
          <td><c:out value="${rsd.country}"/></td>
          
          <td>
                    <a href='<c:url value="deleteres?id=${rsd.id}"></c:url>'>
                        <span class="material-icons">delete</span>
                    </a>
                </td>
        </tr>
      </c:forEach>
    </table>

  </main>
<!-- <footer id="footer" class="footer">
    <div class="container text-center">
        <p>&copy; <span>Copyright</span> <strong class="px-1 sitename">Prime Home</strong> <span>All Rights Reserved</span></p>
    </div>
</footer> -->


<style>
.footer {
    background-color: #9317E1;
    color: white;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    height: 90px; /* Adjust height as needed */
    display: flex;
    align-items: center; /* Center content vertically */
    justify-content: center; /* Center content horizontally */
}

.footer p {
    margin: 0; /* Remove default margin */
    font-size: 14px; /* Adjust font size as needed */
}
</style>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
</body>
</html>
