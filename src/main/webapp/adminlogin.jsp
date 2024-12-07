<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Sign-In</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400&family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet" />
</head>
<body>
    <main>
        <div class="box">
            <div class="inner-box">
                <div class="forms-wrap">
                    <form action="checkadminlogin" autocomplete="off" class="sign-in-form" method="post">
                        <a href="getstarted" class="back-btn" style="font-weight: bold;">Back</a> 
                        <div class="logo">
                            <i class="fas fa-home" style="font-size: 2rem; color: #151111;"></i>
                            <h4 style="margin-left: 0.5rem; font-family: 'Cinzel', serif;">PRIME HOME</h4>
                        </div>
                        
                        <div class="heading">
                            <h2 style="font-family: 'Poppins', sans-serif; font-weight: bold; font-size: 29px;">Admin Sign-On</h2>
                        </div>

                        <!-- Display error message if login failed -->
                        <c:if test="${not empty message}">
                            <p style="color: red; font-weight: bold;">${message}</p>
                        </c:if>

                        <div class="actual-form">
                            <div class="input-wrap">
                                <input
                                    type="text"
                                    name="aname"
                                    minlength="4"
                                    class="input-field"
                                    autocomplete="off"
                                    required
                                />
                                <label>Username</label>
                            </div>

                            <div class="input-wrap">
                                <input
                                    type="password"
                                    name="apassword"
                                    minlength="4"
                                    class="input-field"
                                    autocomplete="off"
                                    required
                                />
                                <label>Password</label>
                            </div>
                            
                            <input type="submit" value="Sign In" class="sign-btn" style="font-weight: bold;" />

                          <div class="socials">
                            <a href="#" class="social-icon"><i class="fas fa-lock"></i></a>
                            <a href="#" class="social-icon"><i class="fas fa-shield-alt"></i></a>
                            <a href="#" class="social-icon"><i class="fas fa-user-shield"></i></a>
                            <a href="#" class="social-icon"><i class="fas fa-key"></i></a>
                          </div>

                            <p class="text" style="margin-top: 1rem;">
                            </p>
                        </div>
                    </form>
                </div>
                
                <!-- Carousel (for visuals) -->
                <div class="carousel">
                    <div class="images-wrapper">
                        <img src="https://cdni.iconscout.com/illustration/premium/thumb/user-login-illustration-download-in-svg-png-gif-file-formats--password-profile-businessman-pack-business-illustrations-5857593.png?f=webp" class="image img-1 show" alt="" />
                        <img src="https://static.vecteezy.com/system/resources/previews/003/689/228/non_2x/online-registration-or-sign-up-login-for-account-on-smartphone-app-user-interface-with-secure-password-mobile-application-for-ui-web-banner-access-cartoon-people-illustration-vector.jpg" class="image img-2" alt="" />
                        <img src="https://img.freepik.com/premium-vector/secure-login-sign-up-concept-illustration-user-use-secure-login-password-protection-website-social-media-account-vector-flat-style_7737-2273.jpg" class="image img-3" alt="" />
                    </div>

                    <div class="text-slider">
                        <div class="text-wrap">
                            <div class="text-group">
                                <h3 class="title">Secure Admin Access</h3>
                                <h2 class="title">Enhance residential properties</h2>
                                <h2 class="title">Make homes more attractive</h2>
                            </div>
                        </div>
                    </div>
                    <div class="bullets">
                        <span class="active" data-value="1"></span>
                        <span data-value="2"></span>
                        <span data-value="3"></span>
                    </div>
                </div>
            </div>
        </div>
    </main>

        <style>
      @import url("https://fonts.googleapis.com/css2?family=Cinzel:wght@400&family=Poppins:wght@200;300;400;500;600;700;800&display=swap");

      * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
      }

      body,
      input {
        font-family: "Poppins", sans-serif;
      }

      main {
        width: 100%;
        min-height: 100vh;
        overflow: hidden;
     background: linear-gradient(to bottom, #9317E1 0%, white 100%);
        padding: 2rem;
        display: flex;
        align-items: center;
        justify-content: center;
      }
 
      .box {
        position: relative;
        width: 100%;
        max-width: 1020px;
        height: 640px;
        background-color: #fff;
        border-radius: 3.3rem;
        box-shadow: 0 60px 40px -30px rgba(0, 0, 0, 0.27);
      }

      .inner-box {
        position: absolute;
        width: calc(100% - 4.1rem);
        height: calc(100% - 4.1rem);
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
      }

      .back-button {
        position: absolute;
        top: 1rem;
        left: 1rem;
      }

      .back-btn {
        text-decoration: none;
        color: #151111;
        font-size: 1rem;
        font-weight: 500;
        transition: color 0.3s;
      }

      .back-btn:hover {
        color: #8371fd;
      }

      .forms-wrap {
        position: absolute;
        height: 100%;
        width: 45%;
        top: 0;
        left: 0;
        display: grid;
        grid-template-columns: 1fr;
        grid-template-rows: 1fr;
        transition: 0.8s ease-in-out;
      }

      form {
        max-width: 260px;
        width: 100%;
        margin: 0 auto;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;
        grid-column: 1 / 2;
        grid-row: 1 / 2;
        transition: opacity 0.02s 0.4s;
      }

      form.sign-up-form {
        opacity: 0;
        pointer-events: none;
      }

      .logo {
        display: flex;
        align-items: center;
      }

      .logo img {
        width: 27px;
        margin-right: 0.3rem;
      }

      .logo h4 {
        font-size: 1.1rem;
        margin-top: -9px;
        letter-spacing: -0.5px;
        color: #151111;
      }

      .heading h2 {
        font-family: "Cinzel", serif;
        font-size: 2.1rem;
        font-weight: 600;
        color: #151111;
      }

      .heading h6 {
        color: #bababa;
        font-weight: 400;
        font-size: 0.75rem;
        display: inline;
      }

      .toggle {
        color: #151111;
        text-decoration: none;
        font-size: 0.75rem;
        font-weight: 500;
        transition: 0.3s;
      }

      .toggle:hover {
        color: #8371fd;
      }

      .input-wrap {
        position: relative;
        height: 37px;
        margin-bottom: 2rem;
      }

      .input-field {
        position: absolute;
        width: 100%;
        height: 100%;
        background: none;
        border: none;
        outline: none;
        border-bottom: 1px solid #bbb;
        padding: 0;
        font-size: 0.95rem;
        color: #151111;
        transition: 0.4s;
      }
 
      

      label {
        position: absolute;
        left: 0;
        top: 50%;
        transform: translateY(-50%);
        font-size: 0.95rem;
        color: #bbb;
        pointer-events: none;
        transition: 0.4s;
      }

      .input-field.active {
        border-bottom-color: #151111;
      }

      .input-field.active + label {
        font-size: 0.75rem;
        top: -2px;
      }

      .sign-btn {
        display: inline-block;
        width: 100%;
        height: 43px;
        background-color: #151111;
        color: #fff;
        border: none;
        cursor: pointer;
        border-radius: 0.8rem;
        font-size: 0.8rem;
        margin-bottom: 2rem;
        transition: 0.3s;
      }

      .sign-btn:hover {
        background-color: #8371fd;
      }

      .text {
        color: #bbb;
        font-size: 0.7rem;
        text-align: center;
      }

      .text a {
        color: #bbb;
        transition: 0.3s;
      }

      .text a:hover {
        color: #8371fd;
      }

      .socials {
        display: flex;
        justify-content: center;
        margin-top: 1rem;
      }

      .social-icon {
        display: inline-block;
        width: 30px;
        height: 30px;
        margin: 0 5px;
        color: #151111;
        font-size: 1.5rem;
        transition: 0.3s;
      }

      .social-icon:hover {
        color: #8371fd;
      }

      main.sign-up-mode form.sign-in-form {
        opacity: 0;
        pointer-events: none;
      }

      main.sign-up-mode form.sign-up-form {
        opacity: 1;
        pointer-events: all;
      }

      main.sign-up-mode .forms-wrap {
        left: 55%;
      }

      main.sign-up-mode .carousel {
        left: 0%;
      }

      .carousel {
        position: absolute;
        height: 100%;
        width: 55%;
        left: 45%;
        top: 0;
        background-color: #ffffff;
        border-radius: 2rem;
        display: grid;
        grid-template-rows: auto 1fr;
        padding-bottom: 2rem;
        overflow: hidden;
        transition: 0.8s ease-in-out;
      }

      .images-wrapper {
        display: grid;
        grid-template-columns: 1fr;
        grid-template-rows: 1fr;
      }

      .image {
        width: 100%;
        grid-column: 1/2;
        grid-row: 1/2;
        opacity: 0;
        transition: opacity 0.3s, transform 0.5s;
      }

      .img-1 {
        transform: translate(0, -50px);
      }

      .img-2 {
        transform: scale(0.4, 0.5);
      }

      .img-3 {
        transform: scale(0.3) rotate(-20deg);
      }

      .image.show {
        opacity: 1;
        transform: none;
      }

      .text-slider {
  position: absolute;
  bottom: 20px; /* Adjust as needed */
  left: 50%;
  transform: translateX(-50%);
  text-align: center;
}

      .text-wrap {
        max-height: 2.2rem;
        overflow: hidden;
        margin-bottom: 2.5rem;
      }

      .text-group {
        display: flex;
        flex-direction: column;
        text-align: center;
        transform: translateY(0);
        transition: 0.5s;
      }

      .text-group h2 {
        line-height: 2.2rem;
        font-weight: 600;
        font-size: 1.6rem;
        font-family: "Cinzel", serif;
      }

      .bullets {
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .bullets span {
        display: block;
        width: 0.5rem;
        height: 0.5rem;
        background-color: #aaa;
        margin: 0 0.25rem;
        border-radius: 50%;
        cursor: pointer;
        transition: 0.3s;
      }

      .bullets span.active {
        width: 1.1rem;
        background-color: #151111;
        border-radius: 1rem;
      }

      @media (max-width: 850px) {
        .box {
          height: auto;
          max-width: 550px;
          overflow: hidden;
        }

        .inner-box {
          position: static;
          transform: none;
          width: revert;
          height: revert;
          padding: 2rem;
        }

        .forms-wrap {
          position: revert;
          width: 100%;
          height: auto;
        }

        form {
          max-width: revert;
          padding: 1.5rem 2.5rem 2rem;
          transition: transform 0.8s ease-in-out, opacity 0.45s linear;
        }

        .heading {
          margin: 2rem 0;
        }

        form.sign-up-form {
          transform: translateX(100%);
        }

        main.sign-up-mode form.sign-in-form {
          transform: translateX(-100%);
        }

        main.sign-up-mode form.sign-up-form {
          transform: translateX(0%);
        }

        .carousel {
          position: revert;
          height: auto;
          width: 100%;
          padding: 3rem 2rem;
          display: flex;
        }

        .images-wrapper {
          display: none;
        }

        .text-slider {
          width: 100%;
        }
      }

      @media (max-width: 530px) {
        main {
          padding: 1rem;
        }

        .box {
          border-radius: 2rem;
        }

        .inner-box {
          padding: 1rem;
        }

        .carousel {
          padding: 1.5rem 1rem;
          border-radius: 1.6rem;
        }

        .text-wrap {
          margin-bottom: 1rem;
        }

        .text-group h2 {
          font-size: 1.2rem;
        }

        form {
          padding: 1rem 2rem 1.5rem;
        }
        
        .carousel {
  overflow: hidden; /* Prevent overflow */
}

.images-wrapper {
  display: flex; /* Align images in a row */
  transition: transform 0.5s ease; /* Smooth transition */
}

.image {
  min-width: 100%; /* Each image takes full width */
  
}


        
      }
    </style>
    <script>
    const inputs = document.querySelectorAll(".input-field");
    const toggle_btn = document.querySelectorAll(".toggle");
    const main = document.querySelector("main");
    const bullets = document.querySelectorAll(".bullets span");
    const images = document.querySelectorAll(".image");
    const titles = document.querySelectorAll(".text-group .title"); // Select title elements directly

    inputs.forEach((inp) => {
      inp.addEventListener("focus", () => {
        inp.classList.add("active");
      });
      inp.addEventListener("blur", () => {
        if (inp.value !== "") return;
        inp.classList.remove("active");
      });
    });

    toggle_btn.forEach((btn) => {
      btn.addEventListener("click", () => {
        main.classList.toggle("sign-up-mode");
      });
    });

    let currentImageIndex = 0;
    const totalImages = images.length;

    const changeImage = () => {
      images.forEach((img, index) => {
        img.classList.remove("show");
        bullets[index].classList.remove("active");
        titles[index].classList.remove("show"); // Hide all titles
      });

      images[currentImageIndex].classList.add("show");
      bullets[currentImageIndex].classList.add("active");
      titles[currentImageIndex].classList.add("show"); // Show the active title

      const textSlider = document.querySelector(".text-group");
      textSlider.style.transform = `translateY(${-currentImageIndex * 2.2}rem)`;
    };

    const autoSlide = () => {
      currentImageIndex = (currentImageIndex + 1) % totalImages;
      changeImage();
    };

    // Event listeners for bullet navigation
    bullets.forEach((bullet, index) => {
      bullet.addEventListener("click", () => {
        currentImageIndex = index;
        changeImage();
      });
    });

    // Start auto sliding
    setInterval(autoSlide, 3000); // Change image every 4 seconds

    // Initialize first image and title
    changeImage();

    </script>
</body>
</html>
