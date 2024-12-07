<%@ page import="java.util.Base64" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!-- Include Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    .project-container {
        margin: 20px auto;
        max-width: 600px;
        border: 1px solid #ddd;
        border-radius: 8px;
        margin-top:60px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        background-color: #ffffff;
    }

    .edit-icon {
        position: absolute;
        top: 200px;
        right: 210px;
        font-size: 30px;
        cursor: pointer;
        color: #9317e1;
        text-decoration: none;
    }
    
    .project-header {
        background-color: #9317e1;
        color: #fff;
        margin-top:150px;
        text-align: center;
        padding: 10px;
        font-size: 1.5rem;
        font-weight: bold;
    }

    .carousel img {
        width: 100%;
        height: auto;
    }

    .project-details {
        padding: 15px;
        text-align: center;
    }

    .project-details h3 {
        font-size: 1.25rem;
        margin: 15px 0;
        color: #9317e1;
    }

    .info {
        margin: 10px 0;
        font-size: 1rem;
        color: #264653;
        text-align: left;
    }

    .btn-view-more {
        background-color: #2a9d8f;
        color: white;
        margin-top: 15px;
        border: none;
        border-radius: 5px;
        padding: 10px 15px;
        transition: background-color 0.3s;
    }

    .btn-view-more:hover {
        background-color: #1b7c6d;
    }

    .collapse {
        margin-top: 15px;
        padding-top: 10px;
        border-top: 1px solid #e0e0e0;
    }

    .btn-add-project {
    margin-top:10px;
        background-color: #9317e1;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .btn-add-project:hover {
        background-color: #7f14b6;
    }
</style>

<%@ include file="designerdashboard.jsp" %> 

<div class="container">
    <div class="project-header">Property Details</div>

    <!-- Align the button to the right -->
    <div class="text-end">
        <button class="btn-add-project" onclick="window.location.href='addproperty'">Add Project</button>
    </div>

    <c:forEach var="propertyWithImage" items="${propertiesWithImages}">
        <div class="project-container">
            <!-- Carousel for Images -->
            <div id="carousel${propertyWithImage.property.id}" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="data:image/jpeg;base64,${propertyWithImage.beforeImageBase64}" class="d-block w-100" alt="Before Image">
                    </div>
                    <div class="carousel-item">
                        <img src="data:image/jpeg;base64,${propertyWithImage.afterImageBase64}" class="d-block w-100" alt="After Image">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carousel${propertyWithImage.property.id}" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carousel${propertyWithImage.property.id}" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

            <!-- Project Details -->
            <div class="project-details">
                <h3>${propertyWithImage.property.projectName}</h3>

                <!-- View More Button -->
                <button class="btn btn-view-more" type="button" data-bs-toggle="collapse" data-bs-target="#projectDetails${propertyWithImage.property.id}" aria-expanded="false" aria-controls="projectDetails">
                    View More
                </button>

                <!-- Collapsible Details Section -->
                <div class="collapse" id="projectDetails${propertyWithImage.property.id}">
                    <div class="info">
                        <strong>Type:</strong> ${propertyWithImage.property.projectType}
                    </div>
                    <div class="info">
                        <strong>Location:</strong> ${propertyWithImage.property.location}
                    </div>
                    <div class="info">
                        <strong>Timeline:</strong> ${propertyWithImage.property.timeline}
                    </div>
                    <div class="info">
                        <strong>Project Cost:</strong> ₹${propertyWithImage.property.projectCost}
                    </div>
                    <div class="info">
                        <strong>Highlights:</strong> ${propertyWithImage.property.highlights}
                    </div>
                    <div class="info">
                        <strong>Design Techniques:</strong> ${propertyWithImage.property.designTechniques}
                    </div>
                    <div class="info">
                        <strong>Materials Used:</strong> ${propertyWithImage.property.materialsUsed}
                    </div>
                    <div class="info">
                        <strong>Feedback:</strong> ${propertyWithImage.property.clientFeedback}
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
