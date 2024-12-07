<%@ page import="com.klef.jfsd.sdpproject.model.Resident"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="jakarta.tags.core" prefix="c" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Resident res = (Resident) session.getAttribute("resident");
System.out.println(res.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resident Profile</title>
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

        .profile-container {
            font-family: carousel;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            position: relative;
            margin-top: 24rem;
        }

        .profile-picture-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #9317e1;
            margin-bottom: 10px;
            
            
        }

        .profile-picture-upload {
            position: relative;
            display: inline-flex;
        }

        .upload-icon {
            position: absolute;
            bottom: 10px;
            right: 0;
            background-color: #9317e1;
            color: white;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
        }

        .upload-icon:hover {
            background-color: #0056b3;
        }

        .profile-container h3 {
            font-size: 24px;
            text-transform: uppercase;
            display: inline-block;
        }

        .edit-icon {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 24px;
            cursor: pointer;
            color: #007bff;
            text-decoration: none;
        }

        hr {
            margin: 20px 0;
            border: 0;
            border-top: 2px solid #333;
        }

        .profile-container b {
            font-size: 18px;
            color: #333;
            min-width: 120px;
            display: inline-block;
        }
.profile-avatar {
    display: flex;
    justify-content: center; 
    align-items: center;    
    margin-bottom: 20px;    
}
        .profile-info {
            margin: 10px 0;
            padding: 8px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .profile-info:hover {
            background-color: #f8f9fa;
        }

        input[type="file"] {
            display: none;
        }
        
      
    </style>
    <script>
    function submitForm() {
        // Additional validation or processing logic can go here if needed
        document.querySelector('form').submit(); // Submit the form manually
        document.querySelector('form').onsubmit = () => false; // Prevent automatic resubmission
    }
</script>
</head>
<body>
    <%@ include file="residentnavbar.jsp" %>

    <div class="profile-container">
        <a href="updateresprofile" class="edit-icon">✎</a>
        
        <div class="profile-avatar">
    <c:choose>
        <c:when test="${res.getProfilePicture().length() != 0}">
            <form method="post" action="addprofilepic" enctype="multipart/form-data">
                <div class="avatar-placeholder">
                    <label for="fileInput" style="cursor: pointer;">
                        <img src="displayprofilepic?id=<%= res.getId() %>" alt="Profile picture" class="profile-picture">
                    </label>
                </div>
                <input type="file" id="fileInput" name="profile" accept="image/*" style="display: none;" onchange="submitForm()" />
            </form>
        </c:when>
        <c:otherwise>
            <form method="post" action="addprofilepic" enctype="multipart/form-data">
                <div class="avatar-placeholder">
                    <label for="fileInput" style="cursor: pointer;">
                        <img src="default-profile.png" alt="Default profile picture" class="profile-picture">
                    </label>
                </div>
                <input type="file" id="fileInput" name="profile" accept="image/*" style="display: none;" onchange="submitForm()" />
            </form>
        </c:otherwise>
    </c:choose>
</div>


        <h3>My Profile</h3>
        <hr />

        <div class="profile-info">
            <b>NAME: </b><%= res.getUserName() %>
        </div>
        <div class="profile-info">
            <b>EMAIL: </b><%= res.getEmail() %>
        </div>
        <div class="profile-info">
            <b>PASSWORD: </b><%= res.getPassword() %>
        </div>
        <div class="profile-info">
            <b>MOBILE: </b><%= res.getMobile() != null ? res.getMobile() : "Not updated yet" %>
        </div>
        <div class="profile-info">
            <b>ADDRESS: </b><%= res.getAddressLine() != null ? res.getAddressLine() : "Not updated yet" %>
        </div>
        <div class="profile-info">
            <b>POSTALCODE: </b><%= res.getPostcode() != null ? res.getPostcode() : "Not updated yet" %>
        </div>
        <div class="profile-info">
            <b>STATE: </b><%= res.getState() != null ? res.getState() : "Not updated yet" %>
        </div>
        <div class="profile-info">
            <b>AREA: </b><%= res.getArea() != null ? res.getArea() : "Not updated yet" %>
        </div>
        <div class="profile-info">
            <b>COUNTRY: </b><%= res.getCountry() != null ? res.getCountry() : "Not updated yet" %>
        </div>
    </div>

    <script>
        function handleProfilePictureChange(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                
                reader.onload = function(e) {
                    document.querySelector('.profile-picture').src = e.target.result;
                    // Here you would typically make an API call to update the profile picture
                };
                
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</body>
</html>