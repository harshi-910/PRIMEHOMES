<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback Form</title>
<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
<style>
    .star-rating {
        direction: rtl;
        display: inline-block;
        font-size: 24px;
    }
    .star-rating input {
        display: none;
    }
    .star-rating label {
        color: #ccc;
        cursor: pointer;
    }
    .star-rating input:checked ~ label {
        color: #f39c12;
    }
    .star-rating label:hover,
    .star-rating label:hover ~ label {
        color: #f39c12;
    }
    .feedback-section {
        padding: 80px 0; /* Adds padding to the top and bottom */
    }
    .section-title {
        text-align: left; /* Aligns title to the left */
        margin-bottom: 40px; /* Space below the title */
    }
</style>
</head>
<body>
 <jsp:include page="residentnavbar.jsp" />

<br>
<br>
<br>
<br>
<br>

<!-- Feedback Section -->
<section id="contact" class="contact section feedback-section">

  <div class="container">
    <div class="row gx-lg-0 gy-4">

      <!-- Title Column -->
      <div class="col-lg-6 section-title" data-aos="fade-up">
      <h2 style="margin-top: 120px;">Your Feedback Matters</h2>
<p>Help us improve our services to enhance your property's value.</p>

      </div><!-- End Title Column -->

      <!-- Form Column -->
      <div class="col-lg-6">
        <form action="forms/contact.php" method="post" class="php-email-form" data-aos="fade" data-aos-delay="100">
          <div class="row gy-4">

            <div class="col-md-6">
              <input type="text" name="name" class="form-control" placeholder="Your Name" required="">
            </div>

            <div class="col-md-6">
              <input type="email" class="form-control" name="email" placeholder="Your Email" required="">
            </div>

            <div class="col-md-12">
              <textarea class="form-control" name="message" rows="8" placeholder="Message" required=""></textarea>
            </div>
 
            <div class="col-md-12">
              <label for="rating">Rate Us:</label>
              <div class="star-rating">
                <input type="radio" id="star1" name="rating" value="5" required=""/><label for="star1">★</label>
                <input type="radio" id="star2" name="rating" value="4"/><label for="star2">★</label>
                <input type="radio" id="star3" name="rating" value="3"/><label for="star3">★</label>
                <input type="radio" id="star4" name="rating" value="2"/><label for="star4">★</label>
                <input type="radio" id="star5" name="rating" value="1"/><label for="star5">★</label>
              </div>
            </div>
             
            <div class="col-md-12 text-center">
              <div class="loading">Loading</div>
              <div class="error-message"></div>
              <div class="sent-message">Your message has been sent. Thank you!</div>

              <button type="submit">Send Message</button>
            </div>

          </div>
        </form>
      </div><!-- End Form Column -->

    </div>
  </div>

</section><!-- /Feedback Section -->
 <jsp:include page="residentfooter.jsp" />
     <!-- Vendor JS Files -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 
</body>
</html>
