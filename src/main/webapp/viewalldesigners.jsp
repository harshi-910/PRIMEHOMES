<%@ page import="com.klef.jfsd.sdpproject.model.Admin" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<% 
    Admin admin = (Admin) session.getAttribute("admin");
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <!-- Load Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>View All Designers - Prime Home</title>
  <meta name="description" content="">
  <meta name="keywords" content="Admin, View designers">

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
    h1 {
      text-align: center;
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
      color: black;
      text-align: center;
      text-decoration: underline;
      margin: 20px 0;
    }
    table {
      width: 100%;
      max-width: 1400px;
      margin: 50px auto;
      border-collapse: collapse;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      background-color: #fff;
      box-sizing: border-box; /* Added box-sizing */
    }
    h1, h2, h3, h4 {
      margin-top: 150px;
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
      padding: 20px;
      text-align: center;
      color: white;
      position: fixed;
      bottom: 0;
      width: 100%;
    }
    .footer p {
      color: white;
    }
    /* Adjust box-sizing for the entire page */
    *, *::before, *::after {
      box-sizing: border-box;
    }
    .page-title {
      padding: 10px;
      background-color: 9317e1;
      border-radius: 8px;
      margin-top: 10px;
    }
    .status-toggle a {
      margin: 0 10px;
      padding: 10px 20px;
      color: white;
      background-color: #9317E1;
      text-decoration: none;
      border-radius: 5px;
    }
    .status-toggle a:hover {
      background-color: #7b1fa2;
    }
    .view-designers {
      margin-top: 50px;
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
                <li><a href="admin_viewallresidents">Users</a></li>
                <li><a href="viewalldesigners">Designers</a></li>
                <li><a href="#">Property</a></li>
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
    <div class="page-title">
        <div class="container">
            <h1>View All Designers</h1>
            <p class="text-center">Here you can see all registered designers along with their details.</p>
        </div>
    </div>

    <div class="container">
        <div class="status-toggle text-center my-3">
            <a href="viewalldesigners?status=pending" class="btn btn-primary">Pending</a>
            <a href="viewalldesigners?status=approved" class="btn btn-success">Approved</a>
        </div>
        <div class="text-center text-purple font-weight-bold fs-5 mb-4">Total Designers: ${count}</div>

       <section class="view-designers">
    <div class="container">
        <c:if test="${not empty designerlist}">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Dob</th>
                        <th>Gender</th>
                        <th>Skills</th>
                        <th>Experience</th>
                        <th>Booked</th>
                        <th>Status</th>
                        <th>Remove</th>
                        <c:if test="${fn:contains(designerlist, 'pending')}">
                            <th>Action</th>
                        </c:if>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${designerlist}" var="designer">
                        <tr>
                            <td>${designer.id}</td>
                            <td>${designer.name}</td>
                            <td>${designer.email}</td>
                            <td>${designer.contact}</td>
                            <td>${designer.dob}</td>
                            <td>${designer.gender}</td>
                            <td>${designer.skills}</td>
                            <td>${designer.experienceLevel}</td>
                            <td>${designer.isBooked ? 'Yes' : 'No'}</td>
                            <td>${designer.status}</td>
                            <td>
                                <a href="<c:url value='deletedes?id=${designer.id}'/>">
                                    <span class="material-icons">delete</span>
                                </a>
                            </td>
                            <c:if test="${designer.status == 'Pending'}">
                                <td>
                                    <form action="updatedesignerstatus" method="post">
                                        <input type="hidden" name="id" value="${designer.id}" />
                                        <input type="hidden" name="status" value="" />
                                        <a href="javascript:void(0);" onclick="this.closest('form').status.value='accepted'; this.closest('form').submit();" class="text-success me-2">Accept</a>
                                        <a href="javascript:void(0);" onclick="this.closest('form').status.value='rejected'; this.closest('form').submit();" class="text-danger">Reject</a>
                                    </form>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty designerlist}">
            <p>No designers available.</p>
        </c:if>
    </div>
</section>


    </div>
  </main>

  <!-- Footer -->
  <footer class="footer">
      <p>Prime Home &copy; 2024 | All Rights Reserved</p>
  </footer>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  
  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>
