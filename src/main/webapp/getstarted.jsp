<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home Access</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400&family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet" />
</head>
<body>
    <main>
        <div class="box">
            <div class="inner-box">
                <div class="forms-wrap">
                    <a href="index" class="back-btn" style="font-weight: bold; position: absolute; top: 10px; left: 10px;">Back</a>

                    <div class="logo" style="display: flex; align-items: center;">
                        <i class="fas fa-home" style="font-size: 2rem; color: #151111;"></i>
                        <h4 style="margin-left: 0.5rem; margin-top: 5px; font-family: 'Cinzel', serif; font-size: 20px;">PRIME HOME</h4><br/><br/><br/>
                    </div>
                    <div class="heading">
                        <h2 style="font-family: 'Poppins', sans-serif; margin-bottom: 0rem;">Select Access</h2>
                    </div>
                    <div class="actual-form" style="display: flex; flex-direction: column; align-items: center; justify-content: flex-start; height: auto; margin-top: 2rem;">
                        <a href="adminlogin" class="access-btn" style="display: inline-block; width: 80%; height: 50px; background-color: #000; color: #fff; text-decoration: none; border: none; cursor: pointer; border-radius: 0.8rem; font-size: 0.9rem; font-weight: bold; margin: 0.5rem 0; transition: 0.3s; text-align: center; line-height: 50px;">
                            <i class="fas fa-user-shield" style="margin-right: 0.5rem;"></i> Admin
                        </a>
                        <a href="designerlogin" class="access-btn" style="display: inline-block; width: 80%; height: 50px; background-color: #000; color: #fff; text-decoration: none; border: none; cursor: pointer; border-radius: 0.8rem; font-size: 0.9rem; font-weight: bold; margin: 0.5rem 0; transition: 0.3s; text-align: center; line-height: 50px;">
                            <i class="fas fa-user" style="margin-right: 0.5rem;"></i> Designer
                        </a>
                        <a href="login" class="access-btn" style="display: inline-block; width: 80%; height: 50px; background-color: #000; color: #fff; text-decoration: none; border: none; cursor: pointer; border-radius: 0.8rem; font-size: 0.9rem; font-weight: bold; margin: 0.5rem 0; transition: 0.3s; text-align: center; line-height: 50px;">
                            <i class="fa-solid fa-users" style="margin-right: 0.5rem;"></i> Resident
                        </a>

                        <div class="text" style="color: #bbb; font-size: 0.6rem; text-align: center; margin-top: 10rem;">
                            By accessing this platform, I agree to the 
                            <a href="#">Terms of Services</a> and 
                            <a href="#">Privacy Policy</a>
                        </div>
                    </div>
                </div>

                <div class="carousel">
                    <div class="images-wrapper">
                        <img src="https://st2.depositphotos.com/1001599/43046/v/450/depositphotos_430460192-stock-illustration-sign-page-abstract-concept-vector.jpg" class="image" alt="" />
                    </div>
                </div>
            </div>
        </div>
    </main>

    <style>
    .back-btn {
    display: inline-block;
    background-color: transparent; /* Transparent background */
    color: #000; /* Black text */
    text-decoration: none;
    font-size: 1rem; /* Font size */
    font-weight: bold; /* Bold text */
    margin: 1rem; /* Margin for spacing */
    transition: color 0.3s;
}

.back-btn:hover {
    color: #9317E1; /* Change color on hover */
}
    
        @import url("https://fonts.googleapis.com/css2?family=Cinzel:wght@400&family=Poppins:wght@200;300;400;500;600;700;800&display=swap");

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body, input {
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
            display: flex; /* Added for flex layout */
        }

        .forms-wrap {
            position: absolute;
            height: 100%;
            width: 45%;
            top: 0;
            left: 0;
            display: flex; /* Changed to flex */
            flex-direction: column; /* Ensure column direction */
            justify-content: flex-end; /* Keep content towards the bottom */
            align-items: center; /* Center horizontally */
            transition: 0.8s ease-in-out;
        }

        .actual-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: auto; /* Allow height to adjust */
            margin-bottom: 2rem; /* Give some space from bottom */
        }

        .access-btn {
            display: inline-block;
            width: 80%;
            height: 40px; /* Adjusted height */
            background-color: #9317E1; /* Updated color */
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 1.5rem; /* More stylish rounded corners */
            font-size: 0.9rem; /* Decreased font size */
            margin: 1rem 0;
            transition: 0.3s;
            font-family: "Poppins", sans-serif; /* Ensured font is Poppins */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Added shadow for depth */
        }

        .access-btn:hover {
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

        .carousel {
            position: absolute;
            height: 100%;
            width: 55%;
            left: 45%;
            top: 0;
            background-color: #ffffff;
            border-radius: 2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            padding-bottom: 2rem;
            overflow: hidden;
        }

        .images-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .image {
            width: 100%;
            height: auto;
            max-height: 640px; /* Adjust as necessary */
            border-radius: 2rem;
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

            .carousel {
                position: revert;
                height: auto;
                width: 100%;
                padding: 3rem 2rem;
                display: flex;
            }
        }
        @media (max-width: 640px) {
            .text-group h2 {
                font-size: 1.3rem;
            }
        }
    </style>
</body>
</html>
