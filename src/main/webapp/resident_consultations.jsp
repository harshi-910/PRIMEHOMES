<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Resident Consultations</title>
    <style>
        /* Global styling */
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        /* Centered heading container */
        .heading-container {
            text-align: center;
            margin-bottom: 20px;
            margin-top:-15rem;
        }

        /* Container for consultations */
        .container {
            width: 100%;
            max-width: 900px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px   rgba(0, 0, 0, 0.1);
           
        }

        /* Heading style */
        .heading-container h1 {
        margin-top:100px;
            font-size: 28px;
            font-weight: 700;
            color: #333;
        }

        .consultation {
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
        }

        .consultation h3 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        .consultation p {
            font-size: 16px;
            color: #666;
        }

        .consultation .status {
            font-weight: bold;
            color: green;
        }

        /* Button to manage consultation */
        .manage-btn {
            background-color: #9317E1;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .manage-btn:hover {
            background-color: #7e14b2;
        }
    </style>
</head>

<body>
   <%@ include file="residentnavbar.jsp" %>

<div class="heading-container">
    <h1>My Consultations</h1>
</div>

<div class="container">
    <c:forEach var="consultation" items="${consultations}">
    <div class="consultation">
        <h3>Consultation with ${consultation.designer.name}</h3>
        <p>Status: <span class="status">
            <c:choose>
                <c:when test="${consultation.status == 'Pending'}">Pending</c:when>
                <c:when test="${consultation.status == 'Accepted'}">Accepted</c:when>
                <c:otherwise>Rejected</c:otherwise>
            </c:choose>
        </span></p>
    </div>
</c:forEach>

</div>

<script>
    function showStatusOptions(id) {
        document.getElementById(`statusOptions-${id}`).style.display = 'block';
    }

    function updateStatus(consultationId, status) {
        window.location.href = `/updateConsultationStatus?id=${consultationId}&status=${status}`;
    }
</script>

</body>


</html>
