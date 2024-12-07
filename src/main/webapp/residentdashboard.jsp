	<%@ page import="com.klef.jfsd.sdpproject.model.Resident"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<!DOCTYPE html>
	<html lang="en">
	
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Resident Home</title>
	    <!-- Vendor CSS Files -->
	    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	    <link href="assets/css/style.css" rel="stylesheet">
	    <!-- Add any custom styles here -->
	</head>
	
	<body>
	
	<!-- Navbar Section -->
	<jsp:include page="residentnavbar.jsp" />
	<br>
	<br>
	<br>
	<br>
	<!-- Featured Properties Section -->
	<section id="featured-properties" class="featured-properties section">
	    <div class="container section-title" data-aos="fade-up">
	        <h2 style="font-weight: bold;">Featured Properties</h2>
	        <p>Explore our best properties available for rent or purchase.</p>
	    </div>
	
	    <div class="container">
	        <div class="row gy-4">
	            <!-- First Property -->
	            <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
	                <article>
	                    <div class="post-img">
	                        <img src="https://images1.apartments.com/i2/imitph-q7AgopscUxSyZLCAMogHh7cz0alp0LsDR4ds/117/level---south-olive-los-angeles-ca-building-photo.jpg?p=1" alt="Luxury Apartment" class="img-fluid">
	                    </div>
	                   <h3 class="title" style="font-weight: bold;">Luxury Apartment in Downtown</h3>
	                    <p class="post-excerpt">This spacious 2-bedroom apartment offers modern amenities in the heart of the city.</p>
	                </article>
	            </div>
	            <!-- Second Property -->
	            <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
	                <article>
	                    <div class="post-img">
	                        <img src="https://images.stockcake.com/public/4/e/a/4eaf866f-5755-432d-9cc6-f63ed07ac67e_large/suburban-family-home-stockcake.jpg" alt="Family Home" class="img-fluid">
	                    </div>
	                   <h3 class="title" style="font-weight: bold;">Cozy Family Home in Suburbs</h3>
	                    <p class="post-excerpt">A perfect family home with a large backyard and easy access to schools and parks.</p>
	                </article>
	            </div>
	            <!-- Third Property -->
	            <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
	                <article>
	                    <div class="post-img">
	                        <img src="https://conradproperties-1f861.kxcdn.com/uploads/properties/2390/new-stylish-3-4-bed-sea-view-villas-in-bophut-83510816.jpg" alt="Modern Villa" class="img-fluid">
	                    </div>
	                    <h3 class="title" style="font-weight: bold;">Modern Villa with Sea View</h3>
	                    <p class="post-excerpt">Enjoy breathtaking views from this luxury villa by the sea. A dream home!</p>
	                </article>
	            </div>
	        </div>
	    </div>
	</section>
	
	<!-- Resident Services Section -->
	<section id="resident-services" class="resident-services section">
	    <div class="container section-title" data-aos="fade-up">
	        <h2 style="font-weight: bold;">Resident Services</h2>
	        <p>We offer a wide range of services to make your living experience more comfortable.</p>
	    </div>
	
	    <div class="container">
	        <div class="row gy-4">
	            <!-- Service 1: Maintenance -->
	            <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
	                <article>
	                    <div class="post-img">
	                        <img src="https://www.bsminc.com/wp-content/uploads/2022/02/Concord-Commercial-Building-Maintenance-Services.jpg" alt="Maintenance" class="img-fluid">
	                    </div>
	                   <h3 class="title" style="font-weight: bold;">24/7 Maintenance Service</h3>
	                    <p class="post-excerpt">Request a repair or service anytime. Our team is available around the clock.</p>
	                </article>
	            </div>
	            <!-- Service 2: Security -->
	            <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
	                <article>
	                    <div class="post-img">
	                        <img src="https://www.ssasecurity.com/wp-content/uploads/2023/11/Why-Smart-Home-Integration-is-Essential-for-Enhanced-Home-Security-1200x774.jpg" alt="Security" class="img-fluid">
	                    </div>
	                    <h3 class="title" style="font-weight: bold;">Enhanced Security Systems</h3>
	                    <p class="post-excerpt">Your safety is our priority. Benefit from our high-tech security systems.</p>
	                </article>
	            </div>
	            <!-- Service 3: Housekeeping -->
	            <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
	                <article>
	                    <div class="post-img">
	                        <img src="https://5.imimg.com/data5/SELLER/Default/2022/3/MO/ZI/XM/78946335/housekeeping-services.jpg" alt="Housekeeping" class="img-fluid">
	                    </div>
	                  <h3 class="title" style="font-weight: bold;">Cleaning & Housekeeping Services</h3>
	                    <p class="post-excerpt">Let us take care of your home with our professional housekeeping services.</p>
	                </article>
	            </div>
	        </div>
	    </div>
	</section>
	
	<!-- Blog Posts Section -->
<section id="recent-posts" class="recent-posts section">
    <div class="container section-title" data-aos="fade-up">
        <h2>Recent Blog Posts</h2>
        <p>Stay updated with the latest tips and trends for enhancing your property's value.</p>
    </div>

    <div class="container">
        <div class="row gy-4">
            <!-- First Blog Post -->
            <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                <article>
                    <div class="post-img">
                        <img src="https://media.istockphoto.com/id/1364970910/photo/real-estate-market-investing-house-money.jpg?s=612x612&w=0&k=20&c=uwoBTBf96aGpQnDE7wNOSVhnBVCE2X4P1LU7GCH5S2U=" alt="Home Renovation Tips" class="img-fluid">
                    </div>
                    <p class="post-category">Home Improvement</p>
                    <h2 class="title">
                        <a href="blog-details">5 Simple Renovations to Increase Your Home's Value</a>
                    </h2>
                    <div class="d-flex align-items-center">
                        <img src="assets/img/blog/blog-author.jpg" alt="Author" class="img-fluid post-author-img flex-shrink-0">
                        <div class="post-meta">
                            <p class="post-author">Rithu Gupta</p>
                            <p class="post-date"><time datetime="2023-09-15">Sep 15, 2023</time></p>
                        </div>
                    </div>
                </article>
            </div>
            <!-- Second Blog Post -->
            <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                <article>
                    <div class="post-img">
                        <img src="https://img.freepik.com/premium-photo/rendering-luxury-home-woodlands_781958-4028.jpg" alt="Budget-Friendly Tips" class="img-fluid">
                    </div>
                    <p class="post-category">Budgeting</p>
                    <h2 class="title">
                        <a href="blog-details1">Affordable Ways to Boost Your Property's Curb Appeal</a>
                    </h2>
                    <div class="d-flex align-items-center">
                        <img src="assets/img/blog/blog-author-2.jpg" alt="Author" class="img-fluid post-author-img flex-shrink-0">
                        <div class="post-meta">
                            <p class="post-author">Neetha Singh</p>
                            <p class="post-date"><time datetime="2023-08-25">Aug 25, 2023</time></p>
                        </div>
                    </div>
                </article>
            </div>
            <!-- Third Blog Post -->
            <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
                <article>
                    <div class="post-img">
                        <img src="assets/img/blog/blog-3.jpg" alt="Market Trends" class="img-fluid">
                    </div>
                    <p class="post-category">Market Insights</p>
                    <h2 class="title">
                        <a href="blog-details2">Understanding the Real Estate Market: Trends to Watch</a>
                    </h2>
                    <div class="d-flex align-items-center">
                        <img src="assets/img/blog/blog-author-3.jpg" alt="Author" class="img-fluid post-author-img flex-shrink-0">
                        <div class="post-meta">
                            <p class="post-author">Aarav</p>
                            <p class="post-date"><time datetime="2023-07-10">Jul 10, 2023</time></p>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </div>
</section>
 <!-- Contact Section -->
<%-- <% 
    String section = request.getParameter("section");
%>

<!-- Other content here -->

<% if ("contact".equals(section)) { %> --%>
    <!-- Contact Section -->
    <section id="contact" class="contact section" style="margin-top: 100px;">
        <div class="container section-title" data-aos="fade-up">
            <h2>Contact Us</h2>
            <p>We're here to help you enhance your property's value. Reach out to us!</p>
        </div><!-- End Section Title -->

        <div class="container" data-aos="fade-up" data-aos-delay="100">
            <div class="row gx-lg-0 gy-4">
                <div class="col-lg-4">
                    <div class="info-container d-flex flex-column align-items-center justify-content-center">
                        <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="200">
                            <i class="bi bi-geo-alt flex-shrink-0"></i>
                            <div>
                                <h3>Address</h3>
                                <p>123 Property Lane, India</p>
                            </div>
                        </div><!-- End Info Item -->
                        <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="300">
                            <i class="bi bi-telephone flex-shrink-0"></i>
                            <div>
                                <h3>Call Us</h3>
                                <p>+1 1234567890</p>
                            </div>
                        </div><!-- End Info Item -->
                        <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="400">
                            <i class="bi bi-envelope flex-shrink-0"></i>
                            <div>
                                <h3>Email Us</h3>
                                <p>primehome@email.com</p>
                            </div>
                        </div><!-- End Info Item -->
                        <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="500">
                            <i class="bi bi-clock flex-shrink-0"></i>
                            <div>
                                <h3>Open Hours:</h3>
                                <p>Mon-Sat: 9AM - 6PM</p>
                            </div>
                        </div><!-- End Info Item -->
                    </div>
                </div>

                <div class="col-lg-8">
                    <form action="sendemail" method="post">
                        <div class="row gy-4">
                            <div class="col-md-6">
                                <input type="text" name="name" class="form-control" placeholder="Your Name" required>
                            </div>
                            <div class="col-md-6">
                                <input type="email" class="form-control" name="email" placeholder="Your Email" required>
                            </div>
                            <div class="col-md-12">
                                <input type="text" class="form-control" name="subject" placeholder="Subject" required>
                            </div>
                            <div class="col-md-12">
                                <textarea class="form-control" name="message" rows="8" placeholder="Message" required></textarea>
                            </div>
                            <div class="col-md-12 text-center">
                                <div class="error-message">${errorMessage}</div>
                                <div class="sent-message">${sentMessage}</div>
                                <button type="submit">Send Message</button>
                            </div>
                        </div>
                    </form>
                </div><!-- End Contact Form -->
            </div>
        </div>
    </section><!-- /Contact Section -->
<%-- <% } %> --%>
<!-- /Contact Section -->

	<!-- Footer Section -->
	<jsp:include page="residentfooter.jsp" />
	
	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/js/main.js"></script>
	
	</body>
	
	</html>
