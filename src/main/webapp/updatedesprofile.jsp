<%@ page import="com.klef.jfsd.sdpproject.model.Designer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

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
            font-family: carousel;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            width: 600px;
            text-align: left;
            margin-top: 35%;
        }

        .form-container h3 {
            margin-bottom: 20px;
            font-size: 24px;
        }

        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="password"],
        .form-container select,
        .form-container input[type="date"] {
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

        .radio-buttons {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .skills-input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .skills-suggestions {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 15px;
        }

        .skill-suggestion {
            background-color: #e9ecef;
            padding: 5px 10px;
            border-radius: 15px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .skill-suggestion:hover {
            background-color: #dee2e6;
        }

        .selected-skills {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 15px;
        }

        .selected-skill {
    background-color: #4CAF50 !important; 
    color: white !important; 
    padding: 5px 40px;
    border-radius: 15px;
    display: inline-flex; 
    align-items: center;
    gap: 10px;
    margin: 5px;
    font-weight: bold; 
    font-size: 16px; 
    white-space: nowrap;
}


.remove-skill {
    cursor: pointer;
    font-size: 18px;
    color: white;
    padding: 0 5px;
}


     
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .message {
            margin-top: 15px;
            padding: 10px;
            border-radius: 4px;
            background-color: #d4edda;
            color: #155724;
        }
    </style>
</head>
<body>
    <div class="form-container">
    
    <%@ include file="designerdashboard.jsp" %>
        <h3>Update Profile</h3>
        
        <form id="skillsForm" action="updatedesprofile" method="post">
            <input type="hidden" name="id" value="${sessionScope.designer.id}">

            <label for="dname"><b>Name:</b></label>
            <input type="text" name="dname" value="${sessionScope.designer.name}" required>

            <label for="demail"><b>Email:</b></label>
            <input type="email" name="demail" value="${sessionScope.designer.email}" required readonly="readonly">

            <label for="dpassword"><b>Password:</b></label>
            <input type="password" name="dpassword" value="${sessionScope.designer.password}" required>

            <!-- Additional profile fields -->
            <label for="dcontact"><b>Contact:</b></label>
            <input type="text" name="dcontact" value="${sessionScope.designer.contact != null ? sessionScope.designer.contact : ""}">

            <label for="ddob"><b>Date of Birth:</b></label>
            <input type="date" name="ddob" value="${sessionScope.designer.dob != null ? sessionScope.designer.dob : ""}">

            <label for="dgender"><b>Gender:</b></label>
            <div class="radio-buttons">
                <label>
                    <input type="radio" name="dgender" value="Male" ${"Male".equals(sessionScope.designer.gender) ? "checked" : ""} required> Male
                </label>
                <label>
                    <input type="radio" name="dgender" value="Female" ${"Female".equals(sessionScope.designer.gender) ? "checked" : ""} required> Female
                </label>
            </div>

            <div class="form-group">
                <label for="dskills">Search Skills:</label>
                <input type="text" id="skillSearch" class="skills-input" placeholder="Type to search skills...">
                
                <div class="skills-suggestions" id="skillsSuggestions">
                    <div class="skill-suggestion" data-skill="Renovation">Renovation</div>
                    <div class="skill-suggestion" data-skill="Interior Design">Interior Design</div>
                    <div class="skill-suggestion" data-skill="Landscaping">Landscaping</div>
                    <div class="skill-suggestion" data-skill="Sustainability Solutions">Sustainability Solutions</div>
                    <div class="skill-suggestion" data-skill="Space Planning">Space Planning</div>
                    <div class="skill-suggestion" data-skill="Color Consultation">Color Consultation</div>
                    <div class="skill-suggestion" data-skill="3D Modeling">3D Modeling</div>
                    <div class="skill-suggestion" data-skill="Project Management">Project Management</div>
                </div>

                <div class="selected-skills" id="selectedSkills"></div>
                <input type="hidden" name="dskills" id="selectedSkillsInput">
            </div>
            
            <label for="dexperience_level"><b>Experience Level:</b></label>
            <div class="radio-buttons">
                <label>
                    <input type="radio" name="dexperience_level" value="1-2 years" ${"1-2 years".equals(sessionScope.designer.experienceLevel) ? "checked" : ""} required> 1-2 years
                </label>
                <label>
                    <input type="radio" name="dexperience_level" value="2-5 years" ${"2-5 years".equals(sessionScope.designer.experienceLevel) ? "checked" : ""} required> 2-5 years
                </label>
                <label>
                    <input type="radio" name="dexperience_level" value="5+ years" ${"5+ years".equals(sessionScope.designer.experienceLevel) ? "checked" : ""} required> 5+ years
                </label>
            </div>
            <div class="form-group">
                <button type="submit" class="btn">Save</button>
            </div>
        </form>
        
        <c:if test="${not empty message}">
            <div class="message">
                ${message}
            </div>
        </c:if>
        
       <script>
document.addEventListener('DOMContentLoaded', function() {
    const skillSearch = document.getElementById('skillSearch');
    const skillsSuggestions = document.getElementById('skillsSuggestions');
    const selectedSkills = document.getElementById('selectedSkills');
    const selectedSkillsInput = document.getElementById('selectedSkillsInput');
    
    let selectedSkillsArray = [];

    skillsSuggestions.addEventListener('click', function(e) {
        if (e.target.classList.contains('skill-suggestion')) {
            const skill = e.target.dataset.skill;
            if (!selectedSkillsArray.includes(skill)) {
                addSkill(skill);
            }
        }
    });

    skillSearch.addEventListener('input', function(e) {
        const searchTerm = e.target.value.toLowerCase();
        const suggestions = skillsSuggestions.getElementsByClassName('skill-suggestion');
        
        Array.from(suggestions).forEach(suggestion => {
            const skillName = suggestion.textContent.toLowerCase();
            suggestion.style.display = skillName.includes(searchTerm) ? 'block' : 'none';
        });
    });

    function addSkill(skill) {
        selectedSkillsArray.push(skill);
        updateSelectedSkills(); // Ensure this function is called to update the DOM
    }

    function updateSelectedSkills() {
        selectedSkills.innerHTML = ''; // Clear the current selected skills
        selectedSkillsArray.forEach(skill => {
            const skillElement = document.createElement('div');
            skillElement.className = 'selected-skill';
            skillElement.innerHTML = `
                ${skill}
                <span class="remove-skill" onclick="removeSkill('${skill}')">&times;</span>
            `;
            selectedSkills.appendChild(skillElement);
        });
        selectedSkillsInput.value = selectedSkillsArray.join(',');
    }

    // Make removeSkill function globally available
    window.removeSkill = function(skill) {
        selectedSkillsArray = selectedSkillsArray.filter(s => s !== skill); // Remove the skill
        updateSelectedSkills(); // Update the DOM after removal
    }
});
</script>


        </form>
    </div>
</body>
</html>
