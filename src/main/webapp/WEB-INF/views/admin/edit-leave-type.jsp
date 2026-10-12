<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Edit Leave Type | Employee Management System</title>

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
   CONTAINER
========================================================= */

.container {

    min-height: 100vh;

    display: flex;

    align-items: center;

    justify-content: center;

    padding: 70px 30px 30px;

    position: relative;

    overflow: hidden;
}


/* =========================================================
   BACKGROUND GLOW
========================================================= */

.container::before {

    content: "";

    position: absolute;

    width: 520px;

    height: 520px;

    border-radius: 50%;

    background:
        radial-gradient(
            circle,
            rgba(183,255,69,0.035),
            transparent 68%
        );

    top: -190px;

    right: -160px;

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

    width: 540px;

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
   HEADER
========================================================= */

.header {

    display: flex;

    align-items: flex-start;

    gap: 13px;

    padding-bottom: 22px;

    border-bottom: 1px solid #282d29;

    margin-bottom: 22px;
}


/* ICON */

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


/* TITLE */

.header h1 {

    font-size: 19px;

    color: #eeeeee;

    font-weight: 650;

    letter-spacing: -0.4px;
}

.header p {

    color: #666c67;

    font-size: 10px;

    margin-top: 5px;

    line-height: 1.5;
}


/* =========================================================
   ID FIELD
========================================================= */

.id-field-wrapper {

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

    font-size: 10px;

    font-weight: 600;

    color: #a1a6a2;
}

.form-group input {

    width: 100%;

    padding: 12px 13px;

    background: #0e110f;

    color: #eeeeee;

    border: 1px solid #303530;

    border-radius: 7px;

    outline: none;

    font-size: 11px;

    transition: 0.2s;

    box-shadow:
        inset 0 1px 0 rgba(255,255,255,0.015);
}

.form-group input::placeholder {

    color: #555b57;
}

.form-group input:focus {

    border-color: #596454;

    box-shadow:
        0 0 0 3px rgba(183,255,69,0.045);
}


/* =========================================================
   READONLY ID
========================================================= */

.id-field {

    background: #181c19 !important;

    color: #777d78 !important;

    border-color: #282d29 !important;

    cursor: not-allowed;
}


/* =========================================================
   BUTTON SECTION
========================================================= */

.buttons {

    display: flex;

    justify-content: flex-end;

    align-items: center;

    gap: 9px;

    padding-top: 20px;

    margin-top: 23px;

    border-top: 1px solid #282d29;
}


/* =========================================================
   BUTTON
========================================================= */

.btn {

    height: 37px;

    padding: 0 16px;

    border-radius: 7px;

    font-size: 10px;

    font-weight: 600;

    text-decoration: none;

    border: none;

    cursor: pointer;

    display: inline-flex;

    align-items: center;

    justify-content: center;

    transition: 0.2s;
}


/* CANCEL */

.cancel-btn {

    background: #1b1e1c;

    color: #919792;

    border: 1px solid #303530;
}

.cancel-btn:hover {

    background: #242824;

    color: #eeeeee;

    border-color: #414741;
}


/* UPDATE */

.update-btn {

    background: #b7ff45;

    color: #10140d;

    border: 1px solid #b7ff45;

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
   FOOTER
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

    .header h1 {

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
        href="${pageContext.request.contextPath}/leave-types"
        class="back-button">

        ←

        <span>
            Back to Leave Types
        </span>

    </a>



    <!-- =================================================
         FORM CARD
    ================================================== -->

    <div class="form-card">


        <!-- HEADER -->

        <div class="header">


            <div class="header-icon">
                ✎
            </div>


            <div>

                <h1>
                    Edit Leave Type
                </h1>

                <p>
                    Update the leave type information below.
                </p>

            </div>


        </div>



        <!-- LEAVE TYPE ID -->

        <div class="id-field-wrapper">

            <span class="id-label">
                Leave Type ID
            </span>

            <span class="id-value">
                #${leaveType.id}
            </span>

        </div>



        <!-- FORM -->

        <form
            action="${pageContext.request.contextPath}/leave-types/update"
            method="post">


            <!-- Hidden ID -->

            <input
                type="hidden"
                name="id"
                value="${leaveType.id}">



            <!-- LEAVE TYPE NAME -->

            <div class="form-group">

                <label for="typeName">
                    Leave Type Name
                </label>

                <input
                    type="text"
                    id="typeName"
                    name="typeName"
                    value="${leaveType.typeName}"
                    placeholder="Enter leave type name"
                    required>

            </div>



            <!-- MAXIMUM DAYS -->

            <div class="form-group">

                <label for="maxDaysAllowed">
                    Maximum Days Allowed
                </label>

                <input
                    type="number"
                    id="maxDaysAllowed"
                    name="maxDaysAllowed"
                    value="${leaveType.maxDaysAllowed}"
                    placeholder="Enter maximum days"
                    min="1"
                    required>

            </div>



            <!-- BUTTONS -->

            <div class="buttons">


                <a
                    href="${pageContext.request.contextPath}/leave-types"
                    class="btn cancel-btn">

                    Cancel

                </a>


                <button
                    type="submit"
                    class="btn update-btn">

                    Update Leave Type

                </button>


            </div>


        </form>



        <div class="footer-note">

            Changes will be saved to the leave management system.

        </div>


    </div>


</div>


</body>

</html>