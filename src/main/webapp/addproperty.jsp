<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Property</title>
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <style>
        /* Prevent the form from being hidden under the navbar */
        body {
            padding-top: 150px; /* Adjust this value based on your navbar height */
            padding-bottom: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        h2 {
            text-align: center;
        }
    </style>
</head>
<body>

<%@ include file="designerdashboard.jsp" %> 

<div class="container">
    <h2 class="my-4">Add Property</h2>
    <form action="insertproperty" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="projectName">Project Name:</label>
            <input type="text" class="form-control" id="projectName" name="projectName" required>
        </div>
        <div class="form-group">
            <label for="projectType">Project Type:</label>
            <input type="text" class="form-control" id="projectType" name="projectType" required>
        </div>
        <div class="form-group">
            <label for="location">Location:</label>
            <input type="text" class="form-control" id="location" name="location" required>
        </div>
        <div class="form-group">
            <label for="timeline">Timeline:</label>
            <input type="text" class="form-control" id="timeline" name="timeline" required>
        </div>
        <div class="form-group">
            <label for="projectCost">Project Cost:</label>
            <input type="number" step="0.01" class="form-control" id="projectCost" name="projectCost" required>
        </div>
        <div class="form-group">
            <label for="highlights">Highlights:</label>
            <textarea class="form-control" id="highlights" name="highlights" required></textarea>
        </div>
        <div class="form-group">
            <label for="designTechniques">Design Techniques:</label>
            <textarea class="form-control" id="designTechniques" name="designTechniques" required></textarea>
        </div>
        <div class="form-group">
            <label for="materialsUsed">Materials Used:</label>
            <textarea class="form-control" id="materialsUsed" name="materialsUsed" required></textarea>
        </div>

        <!-- Image Uploads -->
        <div class="form-group">
            <label for="beforeImage">Before Image:</label>
            <input type="file" class="form-control" id="beforeImage" name="beforeImage">
        </div>
        <div class="form-group">
            <label for="afterImage">After Image:</label>
            <input type="file" class="form-control" id="afterImage" name="afterImage">
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
