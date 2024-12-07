<%@ page import="com.klef.jfsd.sdpproject.model.Resident"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Resident res = (Resident) session.getAttribute("resident");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Profile</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .form-container {
            font-family:carousel;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            width: 600px;
            text-align: left;
            margin-top:45%;
        }

        .form-container h3 {
            margin-bottom: 20px;
            font-size: 24px;
        }

        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .form-container button {
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <%@ include file="residentnavbar.jsp" %>

    <div class="form-container">
        <h3>Update Profile</h3>
        <form action="updateresprofile" method="post">
            <input type="hidden" name="id" value="<%= res.getId() %>">
            <label for="rname"><b>Name:</b></label>
            <input type="text" name="rname" value="<%= res.getUserName() %>" required>

            <label for="remail"><b>Email:</b></label>
            <input type="email" name="remail" value="<%= res.getEmail() %>" required readonly="readonly">

            <label for="rpassword"><b>Password:</b></label>
            <input type="password" name="rpassword" value="<%= res.getPassword() %>" required>

            <!-- Additional profile fields -->
            <label for="mobile"><b>Mobile:</b></label>
            <input type="text" name="mobile" value="<%= res.getMobile() != null ? res.getMobile() : "" %>">

            <label for="addressLine1"><b>Address Line:</b></label>
            <input type="text" name="addressLine" value="<%= res.getAddressLine() != null ? res.getAddressLine() : "" %>">

           


            <label for="postcode"><b>Postcode:</b></label>
            <input type="text" name="postcode" value="<%= res.getPostcode() != null ? res.getPostcode() : "" %>">

            <label for="state"><b>State:</b></label>
            <input type="text" name="state" value="<%= res.getState() != null ? res.getState() : "" %>">

            <label for="area"><b>Area:</b></label>
            <input type="text" name="area" value="<%= res.getArea() != null ? res.getArea() : "" %>">

            <label for="country"><b>Country:</b></label>
            <input type="text" name="country" value="<%= res.getCountry() != null ? res.getCountry() : "" %>">

            <button type="submit">Update Profile</button>
        </form>
    </div>
</body>
</html>