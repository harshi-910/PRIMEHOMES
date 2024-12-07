<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.jfsd.sdpproject.model.Designer" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Home Renovation Consultants</title>
  
  <!-- CSS -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/css/main.css" rel="stylesheet">

  <style>
    .designer-card {
      margin-top: 65px;
      border: 1px solid #ddd;
      border-radius: 10px;
      margin-bottom: 30px;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      transition: transform 0.2s;
    }

    .designer-card:hover {
      transform: translateY(-5px);
    }

    .designer-card img {
      width: 100%;
      height: 200px;
      object-fit: cover;
      border-radius: 10px;
    }

    .designer-card .card-body {
      padding: 15px;
    }

    .designer-card .book-btn {
      padding: 10px 20px;
      background-color: #9317E1;
      color: white;
      border-radius: 5px;
      text-decoration: none;
      display: inline-block;
      transition: background-color 0.2s;
    }

    .designer-card .book-btn:hover {
      background-color: #7511a1;
    }

    .filter-section {
      background: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      margin-top:50px;
      margin-bottom: 10px;
    }

    .filter-section select {
      border: 1px solid #ddd;
      border-radius: 5px;
      padding: 8px;
      width: 100%;
      margin-top: 5px;
    }

    .filter-section button {
      background-color: #9317E1;
      border: none;
      padding: 10px 25px;
      border-radius: 5px;
      color: white;
      font-weight: 500;
      transition: background-color 0.2s;
    }

    .filter-section button:hover {
      background-color: #7511a1;
    }

    .skills-tag {
      display: inline-block;
      background-color: #f3e8ff;
      color: #9317E1;
      padding: 4px 12px;
      border-radius: 15px;
      font-size: 0.875rem;
      margin: 2px;
    }

    .no-results {
      text-align: center;
      padding: 40px;
      background: white;
      border-radius: 10px;
      margin-top: 20px;
    }
  </style>
</head>
<body class="index-page">
  <%@ include file="residentnavbar.jsp" %>
  
  <div class="container">
    <h1 class="text-center">Home Renovation Consultants</h1>
    <p class="text-center">Explore and choose from our expert home renovation consultants.</p>

    <%-- <!-- Filter Section -->
    <div class="filter-section">
      <form action="res_viewalldesigners" method="get">
        <div class="row">
          <div class="col-md-4">
            <label for="skills">Skills:</label>
            <select id="skills" name="skills" class="form-control">
              <option value="">All Skills</option>
              <option value="Renovation" ${param.skills eq 'Renovation' ? 'selected' : ''}>Renovation</option>
              <option value="Interior" ${param.skills eq 'Interior' ? 'selected' : ''}>Interior</option>
              <option value="Painting" ${param.skills eq 'Painting' ? 'selected' : ''}>Painting</option>
              <option value="Landscaping" ${param.skills eq 'Landscaping' ? 'selected' : ''}>Landscaping</option>
            </select>
          </div>
          
          <div class="col-md-4">
            <label for="experienceLevel">Experience Level:</label>
            <select id="experienceLevel" name="experienceLevel" class="form-control">
              <option value="">All Experience Levels</option>
              <option value="1-2 years" ${param.experienceLevel eq '1-2 years' ? 'selected' : ''}>1-2 years</option>
              <option value="2-5 years" ${param.experienceLevel eq '2-5 years' ? 'selected' : ''}>2-5 years</option>
              <option value="5+ years" ${param.experienceLevel eq '5+ years' ? 'selected' : ''}>5+ years</option>
            </select>
          </div>

          <div class="col-md-4 d-flex align-items-end">
            <button type="submit" class="btn w-100">Apply Filters</button>
          </div>
        </div>
      </form>
    </div>
 --%>
 <!-- Filter Section -->
    <div class="filter-section">
      <form action="res_viewalldesigners" method="get">
        <div class="row">
          <div class="col-md-4">
            <label for="skills">Skills:</label>
            <select id="skills" name="skills" class="form-control">
              <option value="">All Skills</option>
              <option value="Renovation" ${param.skills eq 'Renovation' ? 'selected' : ''}>Renovation</option>
              <option value="Interior" ${param.skills eq 'Interior' ? 'selected' : ''}>Interior</option>
              <option value="Painting" ${param.skills eq 'Painting' ? 'selected' : ''}>Painting</option>
              <option value="Landscaping" ${param.skills eq 'Landscaping' ? 'selected' : ''}>Landscaping</option>
            </select>
          </div>

          <div class="col-md-4">
            <label for="experienceLevel">Experience Level:</label>
            <select id="experienceLevel" name="experienceLevel" class="form-control">
              <option value="">All Experience Levels</option>
              <option value="1-2 years" ${param.experienceLevel eq '1-2 years' ? 'selected' : ''}>1-2 years</option>
              <option value="2-5 years" ${param.experienceLevel eq '2-5 years' ? 'selected' : ''}>2-5 years</option>
              <option value="5+ years" ${param.experienceLevel eq '5+ years' ? 'selected' : ''}>5+ years</option>
            </select>
          </div>

          <div class="col-md-4 d-flex align-items-end">
            <button type="submit" class="btn w-100">Apply Filters</button>
          </div>
        </div>
      </form>
    </div>
    <!-- Designers List Section -->
    <div class="row">
      <c:choose>
        <c:when test="${empty designerList}">
          <div class="col-12">
            <div class="no-results">
              <h3>No Designers Found</h3>
              <p>No designers match your selected criteria. Try adjusting your filters.</p>
            </div>
          </div>
        </c:when>
        <c:otherwise>
          <c:forEach items="${designerList}" var="designer">
            <c:if test="${!designer.booked}">
              <div class="col-md-4">
                <div class="designer-card">
                  <div class="card-body">
                    <h5 class="card-title">${designer.name}</h5>
                    <p><strong>Email:</strong> ${designer.email}</p>
                    <div class="skills-container">
                      <strong>Skills:</strong><br>
                      <c:forEach items="${designer.skills}" var="skill">
                        <span class="skills-tag">${skill}</span>
                      </c:forEach>
                      
                    </div>
                    <p class="mt-3"><strong>Experience:</strong> ${designer.experienceLevel}</p>
                    
                    <div class="text-center mt-4">
                      <a href="designerProjectsPage?designerId=${designer.id}" class="book-btn">
    						View More
						</a>

                    </div>
                    
                  </div>
                </div>
              </div>
            </c:if>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>
  </div>

  <!-- Optional JavaScript -->
 <!--  <script>
    // Preserve filter values after form submission
    document.addEventListener('DOMContentLoaded', function() {
      const urlParams = new URLSearchParams(window.location.search);
      
      const skillsSelect = document.getElementById('skills');
      const experienceSelect = document.getElementById('experienceLevel');
      
      if (urlParams.has('skills')) {
        skillsSelect.value = urlParams.get('skills');
      }
      
      if (urlParams.has('experienceLevel')) {
        experienceSelect.value = urlParams.get('experienceLevel');
      }
    });
  </script> -->
  <jsp:include page="residentfooter.jsp" />
</body>
</html>