<%@ page import="com.klef.jfsd.sdpproject.model.Designer" %>
<%@ page import="com.klef.jfsd.sdpproject.model.Resident" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Book Consultation</title>

  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/css/main.css" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      height: 100vh;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #f4f4f4;
    }

    /* .navbar {
      background-color: #343a40 !important;
      color: white;
    } */

	form {
	margin-top: 45rem;}
    h1 {
      text-align: center;
      margin-bottom: 20px;
      font-size: 28px;
      color: #333;
    }

    .alert-info {
      background-color: #d1ecf1;
      color: #0c5460;
      border-color: #bee5eb;
      border-radius: 4px;
      margin-bottom: 20px;
      padding: 10px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      font-weight: bold;
      color: #333;
      font-size: 16px;
    }

    input[type="text"], input[type="email"], textarea {
      border: 1px solid #ddd;
      border-radius: 5px;
      padding: 10px;
      width: 100%;
      font-size: 14px;
      margin-top: 5px;
    }

    textarea {
      resize: vertical;
      min-height: 150px;
    }

    .btn-primary {
      background-color: #9317E1;
      border-color: #9317E1;
      padding: 12px 20px;
      font-size: 16px;
      border-radius: 5px;
      width: 100%;
    }

    .btn-primary:hover {
      background-color: #7511a1;
      border-color: #7511a1;
    }

    .back-btn {
      display: block;
      margin-top: 20px;
      text-align: center;
      text-decoration: none;
      font-size: 16px;
      color: #9317E1;
    }

    .back-btn:hover {
      text-decoration: underline;
      color: #7511a1; /* Add hover effect */
    }

    input[type="hidden"] {
      display: none; /* Explicitly hide the hidden input */
    }

    @media (max-width: 576px) {
      .container {
        padding: 15px;
        width: 100%;
      }

      .btn-primary {
        padding: 10px;
      }
    }
  </style>
</head>

<body>
 <%@ include file="residentnavbar.jsp" %>
  
    <div class="container">
        <h1>Book Consultation with Designer</h1>

        <c:if test="${not empty message}">
            <div class="alert alert-info">${message}</div>
        </c:if>

        <form action="bookconsultation" method="post">
            <input type="hidden" name="designerId" value="${designer.id}">

            <div class="form-group">
                <label for="designerName">Designer Name</label>
                <input type="text" class="form-control" id="designerName" value="${designer.name}" readonly>
            </div>

            <c:if test="${not empty resident}">
                <div class="form-group">
                    <label for="residentName">Your Name</label>
                    <input type="text" class="form-control" id="residentName" value="${resident.userName}" readonly>
                </div>

                <div class="form-group">
                    <label for="residentEmail">Your Email</label>
                    <input type="email" class="form-control" id="residentEmail" value="${resident.email}" readonly>
                </div>
            </c:if>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" placeholder="Enter any additional details"></textarea>
            </div>

            <div class="form-group">
                <label for="consultationDate">Preferred Consultation Date</label>
                <input type="date" class="form-control" id="consultationDate" name="consultationDate" required>
            </div>

            <div class="form-group">
                <label for="consultationTime">Preferred Consultation Time</label>
                <input type="time" class="form-control" id="consultationTime" name="consultationTime" required>
            </div>

            <div class="form-group">
                <label for="consultationType">Consultation Type</label>
                <select class="form-control" id="consultationType" name="consultationType" required>
                    <option value="In-Person">In-Person</option>
                    <option value="Virtual">Virtual</option>
                </select>
            </div>

            <div class="form-group">
                <label for="location">Location</label>
                <input type="text" class="form-control" id="location" name="location" placeholder="Enter your address" required>
            </div>

            <div class="form-group">
                <label for="communicationMethod">Preferred Communication Method</label>
                <select class="form-control" id="communicationMethod" name="communicationMethod" required>
                    <option value="Email">Email</option>
                    <option value="Phone">Phone</option>
                    <option value="WhatsApp">WhatsApp</option>
                </select>
            </div>

            <div class="form-group">
                <label for="attachment">Upload Attachment (Optional)</label>
                <input type="file" class="form-control" id="attachment" name="attachment">
            </div>

            <div class="form-group">
                <label for="budget">Estimated Budget</label>
                <input type="number" class="form-control" id="budget" name="budget" placeholder="Enter your budget" min="0">
            </div>

            <div class="form-group">
                <label for="projectType">Project Type</label>
                <select class="form-control" id="projectType" name="projectType" required>
                    <option value="Renovation">Renovation</option>
                    <option value="Interior Design">Interior Design</option>
                    <option value="Landscaping">Landscaping</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Book Consultation</button>
        </form>

        <a href="res_viewalldesigners" class="back-btn">Back to Designer List</a>
    </div>
</body>
</html>
