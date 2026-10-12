<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
    content="width=device-width, initial-scale=1.0">

<title>Add Employee - Employee Management System</title>

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

body {
    background: #0b0d0c;
    color: #eeeeee;
    min-height: 100vh;
}


/* =====================================================
   LAYOUT
===================================================== */

.layout {
    display: flex;
    min-height: 100vh;
}


/* =====================================================
   SIDEBAR
===================================================== */

.sidebar {

    width: 225px;
    min-width: 225px;

    height: 100vh;

    position: fixed;

    top: 0;
    bottom: 0;
    left: 0;

    padding: 19px 13px;

    background: #0d0f0e;

    border-right: 1px solid #272a28;

    display: flex;
    flex-direction: column;

    z-index: 1000;

    box-shadow:
        4px 0 20px rgba(255,255,255,0.025);
}


/* =====================================================
   LOGO
===================================================== */

.logo {

    display: flex;

    align-items: center;

    gap: 10px;

    padding: 0 8px;

    height: 43px;

    margin-bottom: 22px;
}

.logo-box {

    width: 32px;
    height: 32px;

    border-radius: 7px;

    display: flex;
    align-items: center;
    justify-content: center;

    background: #b7ff45;

    color: #11150e;

    font-size: 10px;

    font-weight: 800;

    box-shadow:
        0 4px 13px rgba(183,255,69,0.16);
}

.logo h2 {

    color: #eeeeee;

    font-size: 15px;

    font-weight: 650;
}

.logo p {

    color: #666c67;

    font-size: 9px;

    margin-top: 2px;
}


/* =====================================================
   MENU
===================================================== */

.menu {

    list-style: none;
}

.menu-title {

    padding: 0 9px;

    margin: 9px 0;

    color: #555b57;

    font-size: 10px;

    text-transform: uppercase;

    letter-spacing: 1px;

    font-weight: 600;
}

.menu li {

    margin-bottom: 4px;
}

.menu a {

    height: 38px;

    display: flex;

    align-items: center;

    gap: 11px;

    padding: 0 11px;

    border-radius: 7px;

    text-decoration: none;

    color: #929792;

    font-size: 12px;

    transition: 0.2s ease;
}

.menu a:hover {

    background: #191c1a;

    color: #eeeeee;

    transform: translateX(2px);
}

.menu a.active {

    background: #222622;

    color: #ffffff;

    box-shadow:
        inset 0 0 0 1px rgba(255,255,255,0.035);
}

.menu-icon {

    width: 18px;

    text-align: center;

    color: #858b86;

    font-size: 13px;
}

.menu a.active .menu-icon {

    color: #b7ff45;
}


/* =====================================================
   MAIN
===================================================== */

.main {

    margin-left: 225px;

    width: calc(100% - 225px);

    min-height: 100vh;

    background:
        radial-gradient(
            circle at 80% 0%,
            rgba(255,255,255,0.025),
            transparent 28%
        );
}


/* =====================================================
   TOPBAR
===================================================== */

.topbar {

    height: 68px;

    padding: 0 28px;

    display: flex;

    justify-content: space-between;

    align-items: center;

    background: #0d0f0e;

    border-bottom: 1px solid #272a28;

    position: sticky;

    top: 0;

    z-index: 900;

    box-shadow:
        0 3px 18px rgba(255,255,255,0.018);
}

.topbar h1 {

    font-size: 22px;

    color: #eeeeee;

    font-weight: 650;

    letter-spacing: -0.5px;
}


/* =====================================================
   LOGOUT
===================================================== */

.logout {

    height: 34px;

    display: flex;

    align-items: center;

    padding: 0 13px;

    border-radius: 7px;

    text-decoration: none;

    background: #171a18;

    border: 1px solid #303530;

    color: #929792;

    font-size: 10px;

    transition: 0.2s;
}

.logout:hover {

    background: #222622;

    color: #eeeeee;

    border-color: #414741;
}


/* =====================================================
   CONTENT
===================================================== */

.content {

    padding: 28px;
}


/* =====================================================
   PAGE HEADER
===================================================== */

.page-heading {

    max-width: 850px;

    margin: 0 auto 16px;
}

.page-heading h2 {

    font-size: 17px;

    color: #eeeeee;

    font-weight: 600;
}

.page-heading p {

    margin-top: 5px;

    color: #666c67;

    font-size: 10px;
}


/* =====================================================
   CARD
===================================================== */

.card {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    max-width: 850px;

    margin: 0 auto;

    border-radius: 10px;

    padding: 26px;

    border: 1px solid #292d2a;

    box-shadow:
        0 8px 24px rgba(255,255,255,0.025),
        0 15px 35px rgba(0,0,0,0.20);
}


/* =====================================================
   CARD HEADER
===================================================== */

.card-header {

    margin-bottom: 22px;

    border-bottom: 1px solid #292d2a;

    padding-bottom: 17px;
}

.card-header h2 {

    color: #eeeeee;

    font-size: 17px;

    font-weight: 600;
}

.card-header p {

    color: #666c67;

    margin-top: 5px;

    font-size: 10px;
}


/* =====================================================
   INFO BOX
===================================================== */

.info-box {

    background: rgba(183,255,69,0.045);

    border: 1px solid rgba(183,255,69,0.14);

    border-left: 3px solid #b7ff45;

    padding: 12px 14px;

    margin-bottom: 24px;

    font-size: 10px;

    color: #aab2a5;

    border-radius: 6px;
}


/* =====================================================
   FORM GRID
===================================================== */

.form-grid {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 18px;
}

.form-group {

    display: flex;

    flex-direction: column;
}

.form-group.full {

    grid-column: span 2;
}


/* =====================================================
   LABELS
===================================================== */

label {

    margin-bottom: 7px;

    font-size: 10px;

    font-weight: 600;

    color: #9da29e;
}

.required {

    color: #ff7070;

    margin-left: 2px;
}


/* =====================================================
   INPUTS
===================================================== */

input,
select {

    width: 100%;

    height: 40px;

    padding: 0 12px;

    border: 1px solid #303530;

    border-radius: 7px;

    outline: none;

    font-size: 11px;

    background: #0e110f;

    color: #eeeeee;

    transition: 0.2s;
}

input::placeholder {

    color: #555b57;
}

input:focus,
select:focus {

    border-color: #566151;

    box-shadow:
        0 0 0 3px rgba(183,255,69,0.045);
}


/* SELECT */

select {

    appearance: none;

    cursor: pointer;

    background-image:
        linear-gradient(45deg, transparent 50%, #777 50%),
        linear-gradient(135deg, #777 50%, transparent 50%);

    background-position:
        calc(100% - 16px) 17px,
        calc(100% - 11px) 17px;

    background-size:
        5px 5px,
        5px 5px;

    background-repeat: no-repeat;
}

select option {

    background: #151817;

    color: #eeeeee;
}


/* =====================================================
   BUTTON ROW
===================================================== */

.button-row {

    margin-top: 27px;

    padding-top: 20px;

    border-top: 1px solid #292d2a;

    display: flex;

    gap: 9px;
}

.btn {

    height: 38px;

    border: none;

    padding: 0 17px;

    border-radius: 7px;

    font-size: 10px;

    font-weight: 600;

    cursor: pointer;

    text-decoration: none;

    display: inline-flex;

    align-items: center;

    justify-content: center;

    transition: 0.2s;
}


/* PRIMARY */

.btn-primary {

    background: #b7ff45;

    color: #10140d;

    box-shadow:
        0 5px 15px rgba(183,255,69,0.10);
}

.btn-primary:hover {

    background: #c5ff67;

    transform: translateY(-1px);

    box-shadow:
        0 7px 18px rgba(183,255,69,0.15);
}


/* SECONDARY */

.btn-secondary {

    background: #222622;

    color: #9a9f9b;

    border: 1px solid #303530;
}

.btn-secondary:hover {

    background: #292e2a;

    color: #eeeeee;
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 900px) {

    .sidebar {

        width: 205px;

        min-width: 205px;
    }

    .main {

        margin-left: 205px;

        width: calc(100% - 205px);
    }
}


@media (max-width: 768px) {

    .sidebar {

        width: 68px;

        min-width: 68px;

        padding: 15px 8px;
    }

    .logo {

        justify-content: center;

        padding: 0;
    }

    .logo h2,
    .logo p {

        display: none;
    }

    .logo-box {

        width: 35px;

        height: 35px;
    }

    .menu a {

        justify-content: center;

        padding: 0;
    }

    .menu a {

        font-size: 0;
    }

    .menu a::first-letter {

        font-size: 13px;
    }

    .main {

        margin-left: 68px;

        width: calc(100% - 68px);
    }

    .topbar {

        padding: 0 17px;
    }

    .content {

        padding: 20px 15px;
    }

    .form-grid {

        grid-template-columns: 1fr;
    }

    .form-group.full {

        grid-column: span 1;
    }
}


@media (max-width: 500px) {

    .card {

        padding: 20px 16px;
    }

    .topbar h1 {

        font-size: 18px;
    }

    .button-row {

        flex-direction: column;
    }

    .btn {

        width: 100%;
    }
}

</style>

</head>


<body>


<div class="layout">


    <!-- =================================================
         SIDEBAR
    ================================================== -->

    <aside class="sidebar">


        <div class="logo">

            <div class="logo-box">
                EM
            </div>

            <div>

                <h2>
                    Employee EMS
                </h2>

                <p>
                    Management System
                </p>

            </div>

        </div>


        <ul class="menu">


            <li>
                <a href="${pageContext.request.contextPath}/admin">

                    <span class="menu-icon">
                        ▦
                    </span>

                    Dashboard

                </a>
            </li>


            <li>
                <a href="${pageContext.request.contextPath}/employees">

                    <span class="menu-icon">
                        ♙
                    </span>

                    Employees

                </a>
            </li>


            <li>
                <a
                    href="${pageContext.request.contextPath}/employees/add"
                    class="active">

                    <span class="menu-icon">
                        +
                    </span>

                    Add Employee

                </a>
            </li>


            <li>
                <a href="${pageContext.request.contextPath}/departments">

                    <span class="menu-icon">
                        ▤
                    </span>

                    Departments

                </a>
            </li>


            <li>
                <a href="${pageContext.request.contextPath}/leave/pending">

                    <span class="menu-icon">
                        ◷
                    </span>

                    Leave Requests

                </a>
            </li>


            <li>
                <a href="${pageContext.request.contextPath}/payroll">

                    <span class="menu-icon">
                        ₹
                    </span>

                    Payroll

                </a>
            </li>


            <li>
                <a href="${pageContext.request.contextPath}/manager">

                    <span class="menu-icon">
                        ♙
                    </span>

                    Managers

                </a>
            </li>


        </ul>


    </aside>



    <!-- =================================================
         MAIN CONTENT
    ================================================== -->

    <main class="main">


        <!-- TOPBAR -->

        <div class="topbar">

            <h1>
                Add Employee
            </h1>

            <a
                href="${pageContext.request.contextPath}/logout"
                class="logout">

                Logout

            </a>

        </div>



        <!-- CONTENT -->

        <div class="content">


            <div class="page-heading">

                <h2>
                    Employee Management
                </h2>

                <p>
                    Register a new employee in the organization.
                </p>

            </div>



            <!-- CARD -->

            <div class="card">


                <!-- CARD HEADER -->

                <div class="card-header">

                    <h2>
                        Employee Registration
                    </h2>

                    <p>
                        Enter the employee details below.
                    </p>

                </div>



                <!-- INFO -->

                <div class="info-box">

                    Please fill in all required employee
                    information before submitting the form.

                </div>



                <!-- FORM -->

                <form
                    action="${pageContext.request.contextPath}/employees/add"
                    method="post">


                    <div class="form-grid">


                        <!-- NAME -->

                        <div class="form-group">

                            <label>

                                Employee Name

                                <span class="required">
                                    *
                                </span>

                            </label>

                            <input
                                type="text"
                                name="name"
                                placeholder="Enter employee name"
                                required>

                        </div>



                        <!-- EMAIL -->

                        <div class="form-group">

                            <label>

                                Email

                                <span class="required">
                                    *
                                </span>

                            </label>

                            <input
                                type="email"
                                name="email"
                                placeholder="Enter email address"
                                required>

                        </div>



                        <!-- MOBILE -->

                        <div class="form-group">

                            <label>

                                Mobile Number

                                <span class="required">
                                    *
                                </span>

                            </label>

                            <input
                                type="text"
                                name="mobile"
                                placeholder="Enter mobile number"
                                maxlength="15"
                                required>

                        </div>



                        <!-- DEPARTMENT -->

                        <div class="form-group">

                            <label>

                                Department

                                <span class="required">
                                    *
                                </span>

                            </label>

                            <select
                                name="deptId"
                                required>

                                <option value="">
                                    -- Select Department --
                                </option>

                                <c:forEach
                                    var="department"
                                    items="${departments}">

                                    <option
                                        value="${department.id}">

                                        ${department.deptName}

                                    </option>

                                </c:forEach>

                            </select>

                        </div>



                        <!-- MANAGER -->

                        <div class="form-group">

                            <label>
                                Manager ID
                            </label>

                            <input
                                type="number"
                                name="managerId"
                                placeholder="Enter manager ID"
                                min="1">

                        </div>



                        <!-- JOINING DATE -->

                        <div class="form-group">

                            <label>

                                Joining Date

                                <span class="required">
                                    *
                                </span>

                            </label>

                            <input
                                type="date"
                                name="joiningDate"
                                required>

                        </div>



                        <!-- BASIC SALARY -->

                        <div class="form-group full">

                            <label>

                                Basic Salary

                                <span class="required">
                                    *
                                </span>

                            </label>

                            <input
                                type="number"
                                name="basicSalary"
                                placeholder="Enter basic salary"
                                min="0"
                                step="0.01"
                                required>

                        </div>


                    </div>



                    <!-- BUTTONS -->

                    <div class="button-row">


                        <button
                            type="submit"
                            class="btn btn-primary">

                            Add Employee

                        </button>


                        <a
                            href="${pageContext.request.contextPath}/employees"
                            class="btn btn-secondary">

                            Cancel

                        </a>


                    </div>


                </form>


            </div>


        </div>


    </main>


</div>


</body>

</html>