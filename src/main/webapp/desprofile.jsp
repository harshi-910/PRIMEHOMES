<%@ page import="com.klef.jfsd.sdpproject.model.Designer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Designer designer = (Designer) session.getAttribute("designer");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Designer Profile</title>
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

     <%@ include file="designerdashboard.jsp" %> 

<div class="profile-container">

        <a href="updatedesprofile" class="edit-icon">✎</a>
        
        <%-- <div class="profile-picture-container">
            <div class="profile-picture-upload">
                <img src="<%= designer.getProfilePicture() != null ? designer.getProfilePicture() : "" %>" 
                     
                     class="profile-picture">
                <label for="profile-upload" class="upload-icon">
                    📷
                </label>
                <input type="file" 
                       id="profile-upload" 
                       accept="image/*" 
                       onchange="handleProfilePictureChange(this)">
            </div>
        </div>
     --%>
     <h3 align="center">Designer Profile</h3>
     <div class="profile-avatar">
    <c:choose>
        <c:when test="${designer.getProfilePicture() != null}">
            <form method="post" action="addprofilepicture" enctype="multipart/form-data">
                <div class="avatar-placeholder">
                    <label for="fileInput" style="cursor: pointer;">
                        <img src="displayprofilepicture?id=<%= designer.getId() %>" alt="Profile picture" class="profile-picture">
                    </label>
                </div>
                <input type="file" id="fileInput" name="profile" accept="image/*" style="display: none;" onchange="submitForm()" />
            </form>
        </c:when>
        <c:otherwise>
            <form method="post" action="addprofilepicture" enctype="multipart/form-data">
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

     
        
        
        <hr />

        <b>NAME: </b><%= designer.getName() %><br><br>
        <b>EMAIL: </b><%= designer.getEmail() %><br><br>
        <b>PASSWORD: </b><%= designer.getPassword() %><br><br>

        <!-- Additional Profile Fields -->
        <b>CONTACT: </b><%= designer.getContact() != null ? designer.getContact() : "Not updated yet" %><br><br>
        <b>DATE OF BIRTH: </b><%= designer.getDob() != null ? designer.getDob() : "Not updated yet" %><br><br>
        <b>GENDER: </b><%= designer.getGender() != null ? designer.getGender() : "Not updated yet" %><br><br>
        <b>SKILLS: </b><%= designer.getSkills() != null ? designer.getSkills() : "Not updated yet" %><br><br>
        <b>EXPERIENCE LEVEL: </b><%= designer.getExperienceLevel() != null ? designer.getExperienceLevel() : "Not updated yet" %><br><br>
        <b>STATUS: </b><%= designer.getStatus() != null ? designer.getStatus() : "Not updated yet" %><br><br>
        <b>BOOKED: </b><%= designer.getisBooked() ? "Yes" : "No" %><br><br>
    </div>
</body>
</html>
