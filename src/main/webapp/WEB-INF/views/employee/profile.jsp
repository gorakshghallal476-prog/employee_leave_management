<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Employee Profile</title>

<style>

/* =====================================================
   RESET
===================================================== */

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica, sans-serif;
}

body {
    background: #0b0d0c;
    color: #eeeeee;
}

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

    background: #0d0f0e;

    color: white;

    padding: 19px 13px;

    position: fixed;

    top: 0;
    bottom: 0;
    left: 0;

    border-right: 1px solid #272a28;

    box-shadow:
        4px 0 20px rgba(255,255,255,0.025);
}


/* LOGO */

.logo {

    text-align: center;

    margin-bottom: 27px;

    padding-bottom: 20px;

    border-bottom: 1px solid #252925;
}

.logo h2 {

    font-size: 16px;

    color: #eeeeee;

    font-weight: 650;
}

.logo p {

    font-size: 8px;

    color: #666c67;

    margin-top: 6px;
}


/* MENU */

.menu a {

    height: 38px;

    display: flex;

    align-items: center;

    text-decoration: none;

    color: #929792;

    padding: 0 11px;

    margin-bottom: 4px;

    border-radius: 7px;

    font-size: 10px;

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


/* =====================================================
   LOGOUT
===================================================== */

.logout {

    margin-top: 22px;

    border-top: 1px solid #272a28;

    padding-top: 15px;
}

.logout a {

    display: flex;

    align-items: center;

    justify-content: center;

    height: 36px;

    border-radius: 7px;

    background: #171a18;

    border: 1px solid #303530;

    color: #888e89;

    text-decoration: none;

    font-size: 9px;

    transition: 0.2s;
}

.logout a:hover {

    background: #222622;

    color: #eeeeee;
}


/* =====================================================
   MAIN
===================================================== */

.main {

    flex: 1;

    margin-left: 225px;

    padding: 25px 28px 35px;

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

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    padding: 19px 22px;

    border-radius: 9px;

    margin-bottom: 18px;

    border: 1px solid #292d2a;

    box-shadow:
        0 8px 24px rgba(255,255,255,0.02),
        0 12px 30px rgba(0,0,0,0.15);
}

.topbar h1 {

    font-size: 20px;

    color: #eeeeee;

    font-weight: 650;

    letter-spacing: -0.3px;
}

.topbar p {

    color: #666c67;

    margin-top: 6px;

    font-size: 9px;
}


/* =====================================================
   PROFILE CARD
===================================================== */

.profile-card {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    border-radius: 9px;

    padding: 24px;

    border: 1px solid #292d2a;

    max-width: 900px;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02),
        0 15px 35px rgba(0,0,0,0.18);
}


/* =====================================================
   PROFILE HEADER
===================================================== */

.profile-header {

    display: flex;

    align-items: center;

    gap: 16px;

    padding-bottom: 20px;

    border-bottom: 1px solid #282c29;

    margin-bottom: 20px;
}


/* AVATAR */

.avatar {

    width: 62px;

    height: 62px;

    border-radius: 50%;

    background: #1c211b;

    border: 1px solid #3a4534;

    color: #b7ff45;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 23px;

    font-weight: bold;

    box-shadow:
        0 0 20px rgba(183,255,69,0.04);
}

.profile-header h2 {

    color: #eeeeee;

    margin-bottom: 5px;

    font-size: 18px;

    font-weight: 650;
}

.profile-header p {

    color: #666c67;

    font-size: 9px;
}


/* =====================================================
   DETAILS
===================================================== */

.details {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 10px;
}

.detail-box {

    background: #101311;

    border: 1px solid #292d2a;

    border-radius: 7px;

    padding: 14px;

    min-height: 68px;

    transition: 0.2s;
}

.detail-box:hover {

    border-color: #3a403b;

    background: #141715;
}

.detail-box label {

    display: block;

    color: #606661;

    font-size: 8px;

    margin-bottom: 7px;

    text-transform: uppercase;

    letter-spacing: 0.5px;
}

.detail-box span {

    font-size: 11px;

    font-weight: 600;

    color: #d8dbd9;
}


/* =====================================================
   ACTIONS
===================================================== */

.actions {

    margin-top: 22px;

    display: flex;

    gap: 9px;
}

.btn {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    min-height: 34px;

    padding: 0 14px;

    border-radius: 6px;

    text-decoration: none;

    font-size: 9px;

    font-weight: 600;

    border: 1px solid transparent;

    cursor: pointer;

    transition: 0.2s;
}


/* PRIMARY */

.btn-primary {

    background: #b7ff45;

    color: #10140d;

    border-color: #b7ff45;

    box-shadow:
        0 5px 15px rgba(183,255,69,0.08);
}

.btn-primary:hover {

    background: #c5ff67;

    transform: translateY(-1px);
}


/* SECONDARY */

.btn-secondary {

    background: #171a18;

    color: #929792;

    border-color: #303530;
}

.btn-secondary:hover {

    background: #222622;

    color: #eeeeee;
}


/* =====================================================
   EMPTY
===================================================== */

.empty {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    padding: 40px;

    border-radius: 9px;

    text-align: center;

    color: #666c67;

    border: 1px solid #292d2a;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02);
}

.empty h3 {

    color: #dddddd;

    margin-bottom: 10px;

    font-size: 15px;
}

.empty p {

    font-size: 10px;

    margin-bottom: 15px;
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 800px) {

    .sidebar {

        width: 205px;

        min-width: 205px;
    }

    .main {

        margin-left: 205px;

        padding: 20px;
    }

    .details {

        grid-template-columns: 1fr;
    }
}


@media (max-width: 650px) {

    .layout {

        display: block;
    }

    .sidebar {

        position: relative;

        width: 100%;

        min-width: 100%;

        height: auto;

        padding-bottom: 20px;
    }

    .main {

        margin-left: 0;

        width: 100%;

        padding: 18px 14px;
    }

    .profile-card {

        padding: 18px;
    }

    .profile-header {

        align-items: flex-start;
    }

    .actions {

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


    <aside class="sidebar">


        <div class="logo">

            <h2>Employee Portal</h2>

            <p>Employee Management System</p>

        </div>


        <div class="menu">


            <a
                href="${pageContext.request.contextPath}/employees/dashboard?id=${employee.id}">

                Dashboard

            </a>


            <a
                href="${pageContext.request.contextPath}/employees">

                Employee List

            </a>


            <a
                href="${pageContext.request.contextPath}/employees/profile?id=${employee.id}"
                class="active">

                Employee Profile

            </a>


            <a
                href="${pageContext.request.contextPath}/leave/apply">

                Apply Leave

            </a>


            <a
                href="${pageContext.request.contextPath}/leave/history?employeeId=${employee.id}">

                Leave History

            </a>


            <a
                href="${pageContext.request.contextPath}/employees/leave-balance?id=${employee.id}">

                Leave Balance

            </a>


            <a
                href="${pageContext.request.contextPath}/payroll/my-payslip?employeeId=${employee.id}">

                My Payslip

            </a>


            <a
                href="${pageContext.request.contextPath}/payroll/history?employeeId=${employee.id}">

                Salary History

            </a>


            <div class="logout">

                <a
                    href="${pageContext.request.contextPath}/logout">

                    Logout

                </a>

            </div>


        </div>


    </aside>



    <main class="main">


        <div class="topbar">

            <h1>
                Employee Profile
            </h1>

            <p>
                View employee information and employment details.
            </p>

        </div>



        <c:choose>


            <c:when test="${not empty employee}">


                <div class="profile-card">


                    <div class="profile-header">


                        <div class="avatar">

                            ${employee.name.substring(0,1).toUpperCase()}

                        </div>


                        <div>

                            <h2>
                                ${employee.name}
                            </h2>

                            <p>
                                Employee ID: ${employee.id}
                            </p>

                        </div>


                    </div>



                    <div class="details">


                        <div class="detail-box">

                            <label>
                                Employee ID
                            </label>

                            <span>
                                ${employee.id}
                            </span>

                        </div>



                        <div class="detail-box">

                            <label>
                                Full Name
                            </label>

                            <span>
                                ${employee.name}
                            </span>

                        </div>



                        <div class="detail-box">

                            <label>
                                Email Address
                            </label>

                            <span>
                                ${employee.email}
                            </span>

                        </div>



                        <div class="detail-box">

                            <label>
                                Mobile Number
                            </label>

                            <span>
                                ${employee.mobile}
                            </span>

                        </div>



                        <div class="detail-box">

                            <label>
                                Department ID
                            </label>

                            <span>
                                ${employee.deptId}
                            </span>

                        </div>



                        <div class="detail-box">

                            <label>
                                Manager ID
                            </label>

                            <span>

                                <c:choose>

                                    <c:when test="${not empty employee.managerId}">

                                        ${employee.managerId}

                                    </c:when>

                                    <c:otherwise>

                                        Not Assigned

                                    </c:otherwise>

                                </c:choose>

                            </span>

                        </div>



                        <div class="detail-box">

                            <label>
                                Joining Date
                            </label>

                            <span>
                                ${employee.joiningDate}
                            </span>

                        </div>



                        <div class="detail-box">

                            <label>
                                Basic Salary
                            </label>

                            <span>
                                ₹ ${employee.basicSalary}
                            </span>

                        </div>


                    </div>



                    <div class="actions">


                        <a
                            href="${pageContext.request.contextPath}/employees"
                            class="btn btn-secondary">

                            ← Back to Employee List

                        </a>


                        <a
                            href="${pageContext.request.contextPath}/employees/edit?id=${employee.id}"
                            class="btn btn-primary">

                            Edit Employee

                        </a>


                    </div>


                </div>


            </c:when>



            <c:otherwise>


                <div class="empty">


                    <h3>
                        Employee Not Found
                    </h3>


                    <p>
                        The requested employee profile could not be found.
                    </p>


                    <br>


                    <a
                        href="${pageContext.request.contextPath}/employees"
                        class="btn btn-primary">

                        Back to Employee List

                    </a>


                </div>


            </c:otherwise>


        </c:choose>


    </main>


</div>


</body>

</html>