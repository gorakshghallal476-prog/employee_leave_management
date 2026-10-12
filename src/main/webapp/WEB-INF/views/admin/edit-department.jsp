<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Edit Department | Employee Management System</title>

<style>

/* =========================================================
   RESET
========================================================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {

    font-family:
        Inter,
        -apple-system,
        BlinkMacSystemFont,
        "Segoe UI",
        Arial,
        sans-serif;

    background: #0b0d0c;

    color: #eeeeee;

    min-height: 100vh;
}


/* =========================================================
   MAIN CONTAINER
========================================================= */

.container {

    min-height: 100vh;

    display: flex;

    align-items: center;

    justify-content: center;

    padding: 30px;

    position: relative;

    overflow: hidden;
}


/* subtle background */

.container::before {

    content: "";

    position: absolute;

    width: 500px;

    height: 500px;

    border-radius: 50%;

    background:
        radial-gradient(
            circle,
            rgba(183,255,69,0.035),
            transparent 68%
        );

    top: -180px;

    right: -150px;

    pointer-events: none;
}


/* =========================================================
   BACK BUTTON
========================================================= */

.back-button {

    position: absolute;

    top: 25px;

    left: 30px;

    height: 35px;

    padding: 0 12px;

    display: inline-flex;

    align-items: center;

    gap: 7px;

    background: #141715;

    border: 1px solid #2c312d;

    border-radius: 7px;

    color: #8d938e;

    text-decoration: none;

    font-size: 10px;

    transition: 0.2s;

    box-shadow:
        0 5px 16px rgba(255,255,255,0.018);
}

.back-button:hover {

    color: #b7ff45;

    border-color: #414841;

    background: #191c1a;

    transform: translateX(-2px);
}


/* =========================================================
   FORM CARD
========================================================= */

.form-card {

    width: 520px;

    max-width: 100%;

    background:
        linear-gradient(
            145deg,
            #171a18,
            #111412
        );

    border: 1px solid #2d322e;

    border-radius: 12px;

    padding: 28px;

    position: relative;

    z-index: 2;

    box-shadow:
        0 20px 60px rgba(0,0,0,0.40),
        0 8px 28px rgba(255,255,255,0.025);

}


/* =========================================================
   CARD HEADER
========================================================= */

.form-header {

    display: flex;

    align-items: flex-start;

    gap: 13px;

    padding-bottom: 22px;

    border-bottom: 1px solid #282d29;

    margin-bottom: 23px;
}

.header-icon {

    width: 42px;

    height: 42px;

    flex-shrink: 0;

    border-radius: 9px;

    background: #1b2417;

    border: 1px solid #33402d;

    color: #b7ff45;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 17px;

    box-shadow:
        0 5px 16px rgba(183,255,69,0.06);
}

.form-header h1 {

    font-size: 19px;

    font-weight: 650;

    color: #eeeeee;

    letter-spacing: -0.4px;
}

.form-header p {

    color: #666c67;

    font-size: 10px;

    margin-top: 5px;

    line-height: 1.5;
}


/* =========================================================
   DEPARTMENT ID
========================================================= */

.department-id {

    display: flex;

    align-items: center;

    justify-content: space-between;

    background: #121513;

    border: 1px solid #282d29;

    border-radius: 7px;

    padding: 10px 12px;

    margin-bottom: 20px;
}

.id-label {

    color: #666c67;

    font-size: 9px;

    text-transform: uppercase;

    letter-spacing: 0.7px;
}

.id-value {

    color: #b7ff45;

    font-family: monospace;

    font-size: 10px;

    font-weight: 600;
}


/* =========================================================
   FORM GROUP
========================================================= */

.form-group {

    margin-bottom: 18px;
}

.form-group label {

    display: block;

    margin-bottom: 7px;

    color: #a1a6a2;

    font-size: 10px;

    font-weight: 600;
}

.form-group input,
.form-group textarea {

    width: 100%;

    background: #0e110f;

    color: #eeeeee;

    border: 1px solid #303530;

    border-radius: 7px;

    outline: none;

    font-size: 11px;

    padding: 12px 13px;

    transition: 0.2s;

    box-shadow:
        inset 0 1px 0 rgba(255,255,255,0.015);
}

.form-group input::placeholder,
.form-group textarea::placeholder {

    color: #555b57;
}

.form-group input:focus,
.form-group textarea:focus {

    border-color: #596454;

    box-shadow:
        0 0 0 3px rgba(183,255,69,0.045);
}

.form-group textarea {

    height: 105px;

    resize: vertical;

    line-height: 1.5;
}


/* =========================================================
   FORM FOOTER
========================================================= */

.buttons {

    display: flex;

    justify-content: flex-end;

    align-items: center;

    gap: 9px;

    margin-top: 25px;

    padding-top: 20px;

    border-top: 1px solid #282d29;
}


/* =========================================================
   BUTTONS
========================================================= */

.btn {

    height: 37px;

    padding: 0 16px;

    border-radius: 7px;

    cursor: pointer;

    text-decoration: none;

    font-size: 10px;

    font-weight: 600;

    display: inline-flex;

    align-items: center;

    justify-content: center;

    transition: 0.2s;
}


/* CANCEL */

.cancel-btn {

    background: #1b1e1c;

    border: 1px solid #303530;

    color: #919792;
}

.cancel-btn:hover {

    background: #242824;

    color: #eeeeee;

    border-color: #414741;
}


/* UPDATE */

.update-btn {

    background: #b7ff45;

    border: 1px solid #b7ff45;

    color: #10140d;

    box-shadow:
        0 5px 17px rgba(183,255,69,0.10);
}

.update-btn:hover {

    background: #c5ff67;

    border-color: #c5ff67;

    transform: translateY(-1px);

    box-shadow:
        0 7px 20px rgba(183,255,69,0.15);
}


/* =========================================================
   FOOTER NOTE
========================================================= */

.footer-note {

    text-align: center;

    margin-top: 17px;

    color: #454b46;

    font-size: 8px;

    line-height: 1.5;
}


/* =========================================================
   RESPONSIVE
========================================================= */

@media (max-width: 600px) {

    .container {

        padding: 70px 17px 25px;

        align-items: flex-start;
    }

    .back-button {

        top: 18px;

        left: 17px;
    }

    .form-card {

        padding: 21px;

        border-radius: 10px;
    }

    .form-header h1 {

        font-size: 17px;
    }

    .buttons {

        flex-direction: column-reverse;

        align-items: stretch;
    }

    .btn {

        width: 100%;
    }
}

</style>

</head>


<body>


<div class="container">


    <!-- =================================================
         BACK BUTTON
    ================================================== -->

    <a
        href="${pageContext.request.contextPath}/departments"
        class="back-button">

        ←

        <span>
            Back to Departments
        </span>

    </a>



    <!-- =================================================
         FORM CARD
    ================================================== -->

    <div class="form-card">


        <!-- HEADER -->

        <div class="form-header">


            <div class="header-icon">
                ✎
            </div>


            <div>

                <h1>
                    Edit Department
                </h1>

                <p>
                    Update the department information below.
                </p>

            </div>


        </div>



        <!-- DEPARTMENT ID -->

        <div class="department-id">

            <span class="id-label">
                Department ID
            </span>

            <span class="id-value">
                #${department.id}
            </span>

        </div>



        <!-- FORM -->

        <form
            action="${pageContext.request.contextPath}/departments/update"
            method="post">


            <!-- Hidden ID -->

            <input
                type="hidden"
                name="id"
                value="${department.id}">



            <!-- DEPARTMENT NAME -->

            <div class="form-group">

                <label for="deptName">
                    Department Name
                </label>

                <input
                    type="text"
                    id="deptName"
                    name="deptName"
                    value="${department.deptName}"
                    placeholder="Enter department name"
                    required>

            </div>



            <!-- DESCRIPTION -->

            <div class="form-group">

                <label for="description">
                    Description
                </label>

                <textarea
                    id="description"
                    name="description"
                    placeholder="Enter department description"
                    required>${department.description}</textarea>

            </div>



            <!-- BUTTONS -->

            <div class="buttons">


                <a
                    href="${pageContext.request.contextPath}/departments"
                    class="btn cancel-btn">

                    Cancel

                </a>


                <button
                    type="submit"
                    class="btn update-btn">

                    Update Department

                </button>


            </div>


        </form>



        <div class="footer-note">

            Changes will be saved to the employee management system.

        </div>


    </div>


</div>


</body>

</html>