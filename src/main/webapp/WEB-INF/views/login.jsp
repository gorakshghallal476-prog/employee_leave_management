<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
    content="width=device-width, initial-scale=1.0">

<title>Login | Employee Management System</title>

<style>

/* =====================================================
   RESET
===================================================== */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}


/* =====================================================
   BODY
===================================================== */

body {

    background: #0b0d0c;

    min-height: 100vh;

    display: flex;

    align-items: center;

    justify-content: center;

    color: #eeeeee;

    padding: 25px;
}


/* =====================================================
   LOGIN WRAPPER
===================================================== */

.login-wrapper {

    width: 100%;

    max-width: 1050px;

    min-height: 620px;

    display: grid;

    grid-template-columns: 1fr 1fr;

    background: #111412;

    border: 1px solid #292d2a;

    border-radius: 10px;

    overflow: hidden;

    box-shadow:
        0 10px 30px rgba(255,255,255,0.02),
        0 20px 50px rgba(0,0,0,0.30);
}


/* =====================================================
   LEFT SIDE
===================================================== */

.login-info {

    background:
        linear-gradient(
            145deg,
            #151817,
            #0f1210
        );

    color: #eeeeee;

    padding: 55px;

    display: flex;

    flex-direction: column;

    justify-content: center;

    border-right: 1px solid #292d2a;
}


/* =====================================================
   BRAND
===================================================== */

.brand {

    display: flex;

    align-items: center;

    gap: 12px;

    margin-bottom: 42px;
}

.brand-icon {

    width: 45px;

    height: 45px;

    border-radius: 8px;

    background: #b7ff45;

    color: #10140d;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 15px;

    font-weight: 800;

    box-shadow:
        0 5px 18px rgba(183,255,69,0.08);
}

.brand-name {

    font-size: 14px;

    font-weight: 700;

    color: #eeeeee;
}


/* =====================================================
   LEFT HEADING
===================================================== */

.login-info h1 {

    font-size: 34px;

    line-height: 1.18;

    margin-bottom: 18px;

    color: #eeeeee;

    font-weight: 650;
}

.login-info p {

    font-size: 11px;

    line-height: 1.8;

    color: #777d78;

    max-width: 410px;
}


/* =====================================================
   FEATURES
===================================================== */

.features {

    margin-top: 35px;
}

.feature {

    display: flex;

    align-items: center;

    margin-bottom: 14px;

    font-size: 10px;

    color: #aeb3af;
}

.feature-icon {

    width: 27px;

    height: 27px;

    margin-right: 10px;

    border-radius: 6px;

    background: rgba(183,255,69,0.08);

    border: 1px solid rgba(183,255,69,0.16);

    color: #b7ff45;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 10px;

    font-weight: 700;
}


/* =====================================================
   RIGHT SIDE
===================================================== */

.login-form-section {

    padding: 55px;

    display: flex;

    flex-direction: column;

    justify-content: center;

    background: #111412;
}


/* =====================================================
   FORM HEADER
===================================================== */

.form-header {

    margin-bottom: 28px;
}

.form-header h2 {

    font-size: 24px;

    color: #eeeeee;

    margin-bottom: 7px;

    font-weight: 650;
}

.form-header p {

    font-size: 10px;

    color: #666c67;
}


/* =====================================================
   FORM GROUP
===================================================== */

.form-group {

    margin-bottom: 18px;
}

.form-group label {

    display: block;

    font-size: 9px;

    font-weight: 600;

    color: #b8bdb9;

    margin-bottom: 7px;
}


/* =====================================================
   INPUT WRAPPER
===================================================== */

.input-wrapper {

    position: relative;
}

.input-icon {

    position: absolute;

    left: 13px;

    top: 50%;

    transform: translateY(-50%);

    color: #555b57;

    font-size: 11px;

    z-index: 1;
}


/* =====================================================
   FORM CONTROL
===================================================== */

.form-control {

    width: 100%;

    height: 45px;

    padding: 0 13px 0 38px;

    border: 1px solid #303530;

    border-radius: 6px;

    outline: none;

    font-size: 10px;

    color: #eeeeee;

    background: #0d100e;

    transition: 0.2s ease;
}

.form-control:focus {

    border-color: #b7ff45;

    box-shadow:
        0 0 0 2px rgba(183,255,69,0.06);
}

.form-control::placeholder {

    color: #505651;
}


/* =====================================================
   SELECT
===================================================== */

select.form-control {

    cursor: pointer;

    color-scheme: dark;
}


/* =====================================================
   OPTIONS
===================================================== */

.form-options {

    display: flex;

    align-items: center;

    justify-content: space-between;

    margin: 4px 0 22px;
}

.remember {

    display: flex;

    align-items: center;

    gap: 7px;

    font-size: 9px;

    color: #666c67;
}

.remember input {

    width: 13px;

    height: 13px;

    accent-color: #b7ff45;
}

.forgot-password {

    color: #b7ff45;

    text-decoration: none;

    font-size: 9px;

    font-weight: 600;
}

.forgot-password:hover {

    color: #c5ff67;

    text-decoration: underline;
}


/* =====================================================
   LOGIN BUTTON
===================================================== */

.login-button {

    width: 100%;

    height: 46px;

    border: none;

    border-radius: 6px;

    background: #b7ff45;

    color: #10140d;

    font-size: 10px;

    font-weight: 800;

    cursor: pointer;

    transition: 0.2s ease;

    box-shadow:
        0 6px 18px rgba(183,255,69,0.08);
}

.login-button:hover {

    background: #c5ff67;

    transform: translateY(-1px);

    box-shadow:
        0 8px 22px rgba(183,255,69,0.12);
}

.login-button:active {

    transform: translateY(0);
}


/* =====================================================
   SECURITY NOTE
===================================================== */

.security-note {

    margin-top: 20px;

    padding: 11px 13px;

    border-radius: 6px;

    background: #0d100e;

    border: 1px solid #292e2b;

    color: #5f655f;

    font-size: 8px;

    line-height: 1.6;

    text-align: center;
}


/* =====================================================
   FOOTER
===================================================== */

.footer-text {

    margin-top: 20px;

    text-align: center;

    font-size: 8px;

    color: #4f5550;
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 800px) {

    .login-wrapper {

        grid-template-columns: 1fr;

        max-width: 500px;

        min-height: auto;
    }

    .login-info {

        display: none;
    }

    .login-form-section {

        padding: 45px 35px;
    }
}


@media (max-width: 450px) {

    body {

        padding: 12px;
    }

    .login-form-section {

        padding: 35px 22px;
    }

    .form-options {

        flex-direction: column;

        align-items: flex-start;

        gap: 12px;
    }
}

</style>

</head>


<body>


<div class="login-wrapper">


    <!-- LEFT SECTION -->

    <div class="login-info">


        <div class="brand">

            <div class="brand-icon">
                EM
            </div>

            <div class="brand-name">
                Employee Management
            </div>

        </div>



        <h1>

            Manage your workforce<br>
            with confidence.

        </h1>



        <p>

            A centralized platform for managing employees,
            departments, leave requests, attendance and
            payroll in one place.

        </p>



        <div class="features">


            <div class="feature">

                <div class="feature-icon">
                    ✓
                </div>

                <span>
                    Employee and department management
                </span>

            </div>



            <div class="feature">

                <div class="feature-icon">
                    ✓
                </div>

                <span>
                    Leave application and approval
                </span>

            </div>



            <div class="feature">

                <div class="feature-icon">
                    ✓
                </div>

                <span>
                    Payroll and salary management
                </span>

            </div>


        </div>


    </div>



    <!-- LOGIN FORM -->

    <div class="login-form-section">


        <div class="form-header">

            <h2>
                Welcome back
            </h2>

            <p>
                Sign in to access your account
            </p>

        </div>



        <!-- LoginController handles POST /login -->

        <form
            action="${pageContext.request.contextPath}/login"
            method="post">


            <!-- EMAIL -->

            <div class="form-group">

                <label for="email">
                    Email Address
                </label>

                <div class="input-wrapper">

                    <span class="input-icon">
                        @
                    </span>

                    <input
                        type="email"
                        id="email"
                        name="email"
                        class="form-control"
                        placeholder="Enter your email address"
                        required>

                </div>

            </div>



            <!-- PASSWORD -->

            <div class="form-group">

                <label for="password">
                    Password
                </label>

                <div class="input-wrapper">

                    <span class="input-icon">
                        *
                    </span>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-control"
                        placeholder="Enter your password"
                        required>

                </div>

            </div>



            <!-- ROLE -->

            <div class="form-group">

                <label for="role">
                    Login As
                </label>

                <div class="input-wrapper">

                    <span class="input-icon">
                        #
                    </span>

                    <select
                        id="role"
                        name="role"
                        class="form-control"
                        required>

                        <option value="">
                            Select your role
                        </option>

                        <option value="ADMIN">
                            Admin / HR
                        </option>

                        <option value="MANAGER">
                            Manager
                        </option>

                        <option value="EMPLOYEE">
                            Employee
                        </option>

                    </select>

                </div>

            </div>



            <!-- OPTIONS -->

            <div class="form-options">

                <label class="remember">

                    <input
                        type="checkbox"
                        name="remember"
                        value="true">

                    Remember me

                </label>


                <a
                    href="#"
                    class="forgot-password">

                    Forgot password?

                </a>

            </div>



            <!-- LOGIN BUTTON -->

            <button
                type="submit"
                class="login-button">

                Sign In

            </button>


        </form>



        <div class="security-note">

            Your account information is protected.
            Please do not share your password with anyone.

        </div>



        <div class="footer-text">

            Employee Management & Leave Management System

        </div>


    </div>


</div>


</body>

</html>