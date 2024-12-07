<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Designer Consultations</title>
    <style>
        /* Global styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 80%;
            max-width: 900px;
            padding: 20px;
            border-radius: 10px;
        }

        h1 {
            text-align: center;
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .table th, .table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            color: #555;
        }

        .table th {
            background-color: #6c757d;
            color: #ffffff;
            font-weight: bold;
        }

        .table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Button styling */
        .manage-btn {
            background-color: #007bff;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Popup styling */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .popup button {
            margin: 5px;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .accept-btn {
            background-color: #28a745;
            color: white;
        }

        .reject-btn {
            background-color: #dc3545;
            color: white;
        }

        .close-btn {
            background-color: #6c757d;
            color: white;
        }

    </style>

    <script>
        function openPopup(consultationId) {
            document.getElementById("popup").style.display = "block";
            document.getElementById("consultationId").value = consultationId;
        }

        function closePopup() {
            document.getElementById("popup").style.display = "none";
        }
    </script>
</head>

<body>
   <%@ include file="designerdashboard.jsp" %>

<div class="container">
    <h1>Your Consultations</h1>

    <c:if test="${not empty consultations}">
        <table class="table">
            <thead>
                <tr>
                    <th>Resident Name</th>
                    <th>Resident Email</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="consultation" items="${consultations}">
    <tr>
        <td>${consultation.resident.userName}</td>
        <td>${consultation.resident.email}</td>
        <td>${consultation.description}</td>
        <td>
            <span class="${consultation.status == 'Pending' ? 'pending-status' : (consultation.status == 'Accepted' ? 'accepted-status' : 'rejected-status')}">
                ${consultation.status}
            </span>
        </td>
        <td>
            <c:if test="${consultation.status == 'Pending'}">
                <button class="manage-btn" onclick="openPopup(${consultation.id})">Manage Consultation</button>
            </c:if>
        </td>
    </tr>
</c:forEach>

            </tbody>
        </table>
    </c:if>
    
    <c:if test="${empty consultations}">
        <p class="no-consultations">No consultations found.</p>
    </c:if>
</div>

<!-- Popup for Accept/Reject -->
<!-- Popup for Accept/Reject -->
<div id="popup" class="popup">
    <h3>Manage Consultation Status</h3>
    <p>Would you like to accept or reject this consultation?</p>
    <form action="/updateConsultationStatus" method="post">
        <input type="hidden" id="consultationId" name="id" value=""/>
        <button type="submit" name="status" value="Accepted" class="accept-btn">Accept</button>
        <button type="submit" name="status" value="Rejected" class="reject-btn">Reject</button>
        <button type="button" onclick="closePopup()" class="close-btn">Cancel</button>
    </form>
</div>

<script>
    function openPopup(id) {
        document.getElementById('consultationId').value = id;
        document.getElementById('popup').style.display = 'block';
    }

    function closePopup() {
        document.getElementById('popup').style.display = 'none';
    }
</script>


</body>

</html>
