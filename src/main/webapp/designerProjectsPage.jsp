<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.jfsd.sdpproject.model.Properties" %>
<%@ page import="com.klef.jfsd.sdpproject.model.Designer" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Designer Projects</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .designer-header {
            background: #9317E1;
            color: white;
            padding: 20px;
            border-radius: 12px;
            margin-top:150px;
            margin-bottom: 25px;
            
        }
        .designer-header h2 {
    font-size: 2rem;
    font-weight: bold;
    color: white; /* Ensure text is white */
    margin: 0;
    /* text-align: center;  *//* Optional: For centering the text */
}
        
        .project-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            transition: transform 0.2s;
        }
        .project-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }
        .card-row {
            display: flex;
            align-items: center;
        }
        .card-image {
            width: 280px;
            height: 200px;
            flex-shrink: 0;
            position: relative;
        }
        .card-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .card-content {
            padding: 20px;
            flex-grow: 1;
        }
        .project-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 12px;
        }
        .project-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
            margin-bottom: 15px;
        }
        .detail-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .detail-label {
            color: #9317E1;
            font-size: 0.9rem;
        }
        .detail-value {
            color: #9317E1;
            font-weight: 500;
        }
        .tags-container {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-top: 12px;
        }
        .tag {
            background: #e0e7ff;
            color: #4f46e5;
            padding: 4px 10px;
            border-radius: 999px;
            font-size: 0.8rem;
            white-space: nowrap;
        }
        .feedback-section {
            margin-top: 12px;
            padding-top: 12px;
            border-top: 1px solid #e5e7eb;
        }
        .book-btn {
      padding: 10px 20px;
      background-color: #9317E1;
      color: white;
      border-radius: 5px;
      position:static;
      text-decoration: none;
      display: inline-block;
      transition: background-color 0.2s;
    }
        @media (max-width: 768px) {
            .card-row {
                flex-direction: column;
            }
            .card-image {
                width: 100%;
            }
            .project-details {
                grid-template-columns: 1fr;
            }
        }
    </style>
     <%@ include file="residentnavbar.jsp" %>
</head>
<body>
    <c:set var="designerId" value="${param.designerId}" />

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger" role="alert">
            ${errorMessage}
        </div>
    </c:if>

    <c:choose>
        <c:when test="${not empty designer}">
            <div class="designer-header">
                <h2 class="mb-2"><i class="fas fa-user-circle me-2"></i>${designer.name}'s Portfolio</h2>
                <div class="d-flex gap-4">
                    <span><i class="fas fa-envelope me-2"></i>${designer.email}</span>
                    <span><i class="fas fa-star me-2"></i>${designer.experienceLevel} Years Experience</span>
                </div>
            </div>

            <div class="projects-container">
                <c:forEach var="properties" items="${properties}">
                    <div class="project-card">
                        <div class="card-row">
                            <div class="card-image">
                                
                                <div id="carousel${properties.id}" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="${properties.beforeImage}" class="d-block w-100" alt="Before Image">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="${properties.afterImage}" class="d-block w-100" alt="After Image">
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carousel${properties.id}" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carousel${properties.id}" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                            </div>
                            <div class="card-content">
                                <h3 class="project-title">${properties.projectName}</h3>
                                <div class="project-details">
                                    <div class="detail-item">
                                        <i class="fas fa-map-marker-alt text-primary"></i>
                                        <span class="detail-value">${properties.location}</span>
                                    </div>
                                    <div class="detail-item">
                                        <i class="fas fa-clock text-primary"></i>
                                        <span class="detail-value">${properties.timeline}</span>
                                    </div>
                                    <div class="detail-item">
                                        <i class="fas fa-tag text-primary"></i>
                                        <span class="detail-value">${properties.projectType}</span>
                                    </div>
                                    <div class="detail-item">
                                        <i class="fas fa-dollar-sign text-primary"></i>
                                        <span class="detail-value">${properties.projectCost}</span>
                                    </div>
                                    <div class="detail-item">
                                        <i class="fas fa-cogs text-primary"></i>
                                        <span class="detail-value">${properties.designTechniques}</span>
                                    </div>
                                    <div class="detail-item">
                                        <i class="fas fa-box text-primary"></i>
                                        <span class="detail-value">${properties.materialsUsed}</span>
                                    </div>
                                </div>
                                <div class="tags-container">
                                    <span class="tag">${properties.designTechniques}</span>
                                    <span class="tag">${properties.materialsUsed}</span>
                                </div>
                                <div class="feedback-section">
                                    <small class="text-muted"><i class="fas fa-quote-left me-2"></i>${properties.clientFeedback}</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
                     <div class="text-center mt-4">
  <a href="res_bookconsultation?designerId=${designer.id}" class="book-btn">
    Book Consultation
  </a>
</div>

                    
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-info" role="alert">
                <i class="fas fa-info-circle me-2"></i>No designer found with the provided ID.
            </div>
        </c:otherwise>
    </c:choose>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
