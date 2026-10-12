<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Employee Dashboard | Employee Management System</title>

<style>

/* =========================================================
   RESET
========================================================= */

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


/* =========================================================
   LAYOUT
========================================================= */

.container {
    display: flex;
    min-height: 100vh;
}


/* =========================================================
   SIDEBAR
========================================================= */

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

    z-index: 1000;

    display: flex;
    flex-direction: column;

    box-shadow:
        4px 0 20px rgba(255,255,255,0.025);
}


/* LOGO */

.logo {

    height: 43px;

    display: flex;
    align-items: center;

    gap: 10px;

    padding: 0 8px;

    margin-bottom: 24px;

    color: #eeeeee;

    font-size: 15px;

    font-weight: 650;
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


/* MENU */

.menu-title {

    padding: 0 9px;

    margin: 12px 0 9px;

    color: #555b57;

    font-size: 10px;

    text-transform: uppercase;

    letter-spacing: 1px;

    font-weight: 600;
}

.menu a {

    height: 38px;

    display: flex;
    align-items: center;

    gap: 11px;

    padding: 0 11px;

    margin-bottom: 4px;

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


/* LOGOUT */

.logout {

    margin-top: auto;

    padding-top: 14px;

    border-top: 1px solid #222522;
}

.logout a {

    height: 38px;

    display: flex;
    align-items: center;

    gap: 10px;

    padding: 0 11px;

    border-radius: 7px;

    color: #858a86;

    text-decoration: none;

    font-size: 12px;

    transition: 0.2s;
}

.logout a:hover {

    background: #191c1a;

    color: #eeeeee;
}


/* =========================================================
   MAIN
========================================================= */

.main {

    margin-left: 225px;

    width: calc(100% - 225px);

    min-height: 100vh;

    padding: 0 28px 30px;

    background:
        radial-gradient(
            circle at 80% 0%,
            rgba(255,255,255,0.025),
            transparent 28%
        );
}


/* =========================================================
   TOPBAR
========================================================= */

.topbar {

    height: 68px;

    margin: 0 -28px 25px;

    padding: 0 28px;

    background: #0d0f0e;

    border-bottom: 1px solid #272a28;

    display: flex;

    justify-content: space-between;

    align-items: center;

    position: sticky;

    top: 0;

    z-index: 900;

    box-shadow:
        0 3px 18px rgba(255,255,255,0.018);
}

.page-title h1 {

    font-size: 22px;

    color: #eeeeee;

    font-weight: 650;

    letter-spacing: -0.5px;
}

.page-title p {

    color: #666c67;

    font-size: 10px;

    margin-top: 5px;
}


/* EMPLOYEE INFO */

.employee-info {

    display: flex;

    align-items: center;

    gap: 9px;
}

.avatar {

    width: 35px;
    height: 35px;

    border-radius: 50%;

    background: #202520;

    border: 1px solid #3a403b;

    color: #b7ff45;

    display: flex;

    justify-content: center;

    align-items: center;

    font-size: 12px;

    font-weight: 700;

    box-shadow:
        0 3px 12px rgba(255,255,255,0.025);
}

.employee-text strong {

    display: block;

    font-size: 11px;

    color: #e1e1e1;
}

.employee-text span {

    color: #686e69;

    font-size: 9px;
}


/* =========================================================
   WELCOME CARD
========================================================= */

.welcome-card {

    background:
        linear-gradient(
            145deg,
            #171b17,
            #111411
        );

    color: #eeeeee;

    padding: 25px;

    border-radius: 10px;

    margin-bottom: 18px;

    display: flex;

    justify-content: space-between;

    align-items: center;

    border: 1px solid #30352f;

    box-shadow:
        0 8px 24px rgba(255,255,255,0.025),
        0 15px 35px rgba(0,0,0,0.20);

    position: relative;

    overflow: hidden;
}

.welcome-card::after {

    content: "";

    position: absolute;

    width: 180px;
    height: 180px;

    right: -70px;
    top: -90px;

    border-radius: 50%;

    border: 1px solid rgba(183,255,69,0.08);
}

.welcome-card h2 {

    font-size: 20px;

    margin-bottom: 7px;

    color: #f0f0f0;
}

.welcome-card h2::first-letter {

    color: #b7ff45;
}

.welcome-card p {

    font-size: 11px;

    color: #777d78;
}

.welcome-icon {

    font-size: 42px;

    opacity: 0.22;

    color: #b7ff45;
}


/* =========================================================
   STAT CARDS
========================================================= */

.stats {

    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 13px;

    margin-bottom: 18px;
}

.stat-card {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    padding: 18px;

    min-height: 110px;

    border-radius: 9px;

    border: 1px solid #292d2a;

    box-shadow:
        0 7px 20px rgba(255,255,255,0.022),
        0 12px 28px rgba(0,0,0,0.16);

    transition: 0.2s;
}

.stat-card:hover {

    transform: translateY(-2px);

    border-color: #363c37;
}

.stat-card .label {

    color: #777d78;

    font-size: 10px;

    margin-bottom: 10px;
}

.stat-card h3 {

    font-size: 24px;

    margin-bottom: 5px;
}

.stat-card .small {

    color: #555b57;

    font-size: 9px;
}


/* COLORS */

.blue {

    color: #b7ff45;
}

.green {

    color: #4ade80;
}

.orange {

    color: #f5c842;
}

.red {

    color: #ff5c5c;
}


/* =========================================================
   CONTENT GRID
========================================================= */

.content-grid {

    display: grid;

    grid-template-columns: 2fr 1fr;

    gap: 14px;
}


/* =========================================================
   CARD
========================================================= */

.card {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    border-radius: 9px;

    border: 1px solid #292d2a;

    overflow: hidden;

    box-shadow:
        0 7px 20px rgba(255,255,255,0.022),
        0 12px 28px rgba(0,0,0,0.16);
}

.card-header {

    min-height: 57px;

    padding: 0 17px;

    border-bottom: 1px solid #252925;

    display: flex;

    justify-content: space-between;

    align-items: center;
}

.card-header h2 {

    font-size: 14px;

    color: #eeeeee;

    font-weight: 600;
}

.view-link {

    color: #b7ff45;

    text-decoration: none;

    font-size: 9px;

    transition: 0.2s;
}

.view-link:hover {

    color: #caff75;
}


/* =========================================================
   LEAVE TABLE
========================================================= */

.table-wrapper {

    overflow-x: auto;
}

table {

    width: 100%;

    border-collapse: collapse;
}

th {

    background: #121513;

    text-align: left;

    padding: 12px 17px;

    font-size: 8px;

    color: #656b66;

    text-transform: uppercase;

    letter-spacing: 0.6px;

    white-space: nowrap;
}

td {

    padding: 14px 17px;

    border-top: 1px solid #222622;

    font-size: 10px;

    color: #909590;

    white-space: nowrap;
}

tbody tr {

    transition: 0.2s;
}

tbody tr:hover {

    background: #171a18;
}


/* =========================================================
   STATUS BADGES
========================================================= */

.badge {

    display: inline-flex;

    align-items: center;

    padding: 5px 9px;

    border-radius: 20px;

    font-size: 8px;

    font-weight: 600;
}

.pending {

    background: rgba(245,200,66,0.09);

    color: #f5c842;

    border: 1px solid rgba(245,200,66,0.18);
}

.approved {

    background: rgba(74,222,128,0.09);

    color: #4ade80;

    border: 1px solid rgba(74,222,128,0.18);
}

.rejected {

    background: rgba(255,92,92,0.09);

    color: #ff7070;

    border: 1px solid rgba(255,92,92,0.18);
}


/* =========================================================
   QUICK ACTIONS
========================================================= */

.quick-actions {

    padding: 13px;
}

.quick-action {

    min-height: 57px;

    display: flex;

    align-items: center;

    gap: 11px;

    padding: 10px;

    margin-bottom: 8px;

    border: 1px solid #292d2a;

    border-radius: 7px;

    text-decoration: none;

    color: #d1d4d2;

    background: #121513;

    transition: 0.2s;
}

.quick-action:hover {

    background: #191c1a;

    border-color: #3c443d;

    transform: translateX(2px);
}

.action-icon {

    width: 33px;
    height: 33px;

    flex-shrink: 0;

    background: #1a2117;

    border: 1px solid #303a2c;

    color: #b7ff45;

    border-radius: 7px;

    display: flex;

    justify-content: center;

    align-items: center;

    font-weight: bold;

    font-size: 12px;
}

.action-text strong {

    display: block;

    font-size: 10px;

    color: #e0e0e0;

    margin-bottom: 3px;
}

.action-text span {

    color: #666c67;

    font-size: 8px;
}


/* =========================================================
   EMPTY MESSAGE
========================================================= */

.empty-message {

    text-align: center;

    padding: 35px 20px;

    color: #666c67;

    font-size: 10px;
}


/* =========================================================
   RESPONSIVE
========================================================= */

@media (max-width: 1100px) {

    .stats {

        grid-template-columns:
            repeat(2, 1fr);
    }

    .content-grid {

        grid-template-columns: 1fr;
    }
}


@media (max-width: 700px) {

    .sidebar {

        position: relative;

        width: 100%;

        min-width: 100%;

        height: auto;

        min-height: auto;
    }

    .container {

        display: block;
    }

    .main {

        margin-left: 0;

        width: 100%;

        padding: 20px;
    }

    .topbar {

        margin: 0 -20px 20px;

        padding: 18px 20px;

        height: auto;

        display: block;
    }

    .employee-info {

        margin-top: 15px;
    }

    .stats {

        grid-template-columns: 1fr;
    }

    .welcome-card {

        display: block;
    }

    .welcome-icon {

        display: none;
    }

    .card {

        overflow-x: auto;
    }

    table {

        min-width: 600px;
    }

    .logout {

        margin-top: 15px;
    }
}

</style>

</head>


<body>


<div class="container">


<!-- =====================================================
     SIDEBAR
===================================================== -->

<aside class="sidebar">


    <div class="logo">

        <div class="logo-box">
            EM
        </div>

        Employee MS

    </div>


    <div class="menu">


        <div class="menu-title">
            Main
        </div>


        <a
            href="${pageContext.request.contextPath}/employees/dashboard?id=${employee.id}"
            class="active">

            <span class="menu-icon">
                ▦
            </span>

            Dashboard

        </a>


        <a
            href="${pageContext.request.contextPath}/employees/profile?id=${employee.id}">

            <span class="menu-icon">
                ♙
            </span>

            My Profile

        </a>



        <div class="menu-title">
            Leave Management
        </div>


        <a
            href="${pageContext.request.contextPath}/leave/apply">

            <span class="menu-icon">
                +
            </span>

            Apply Leave

        </a>


        <a
            href="${pageContext.request.contextPath}/leave/history?employeeId=${employee.id}">

            <span class="menu-icon">
                ≡
            </span>

            Leave History

        </a>



        <div class="menu-title">
            Payroll
        </div>


        <a
            href="${pageContext.request.contextPath}/payroll/my-payslip?employeeId=${employee.id}">

            <span class="menu-icon">
                ₹
            </span>

            My Payslip

        </a>


        <a
            href="${pageContext.request.contextPath}/payroll/history?employeeId=${employee.id}">

            <span class="menu-icon">
                ▤
            </span>

            Salary History

        </a>


    </div>


    <div class="logout">

        <a
            href="${pageContext.request.contextPath}/logout">

            <span class="menu-icon">
                ↪
            </span>

            Logout

        </a>

    </div>


</aside>



<!-- =====================================================
     MAIN
===================================================== -->

<main class="main">


    <!-- TOPBAR -->

    <div class="topbar">


        <div class="page-title">

            <h1>
                Employee Dashboard
            </h1>

            <p>
                Manage your profile, leaves and payroll information.
            </p>

        </div>


        <div class="employee-info">


            <div class="avatar">

                <c:choose>

                    <c:when test="${not empty employee.name}">

                        ${employee.name.substring(0,1).toUpperCase()}

                    </c:when>

                    <c:otherwise>
                        E
                    </c:otherwise>

                </c:choose>

            </div>


            <div class="employee-text">

                <strong>

                    <c:choose>

                        <c:when test="${not empty employee}">

                            ${employee.name}

                        </c:when>

                        <c:otherwise>
                            Employee
                        </c:otherwise>

                    </c:choose>

                </strong>

                <span>
                    Employee
                </span>

            </div>


        </div>


    </div>



    <!-- =================================================
         WELCOME
    ================================================== -->

    <div class="welcome-card">


        <div>

            <h2>

                Welcome back,

                <c:choose>

                    <c:when test="${not empty employee.name}">

                        ${employee.name}!

                    </c:when>

                    <c:otherwise>

                        Employee!

                    </c:otherwise>

                </c:choose>

                👋

            </h2>

            <p>
                Here's an overview of your employee account.
            </p>

        </div>


        <div class="welcome-icon">
            💼
        </div>


    </div>



    <!-- =================================================
         STAT CARDS
    ================================================== -->

    <div class="stats">


        <!-- AVAILABLE LEAVE -->

        <div class="stat-card">

            <div class="label">
                Available Leave
            </div>

            <h3 class="blue">
                ${availableLeaveDays}
            </h3>

            <div class="small">
                Days remaining
            </div>

        </div>



        <!-- PENDING -->

        <div class="stat-card">

            <div class="label">
                Pending Requests
            </div>

            <h3 class="orange">
                ${pendingLeaves}
            </h3>

            <div class="small">
                Waiting for approval
            </div>

        </div>



        <!-- APPROVED -->

        <div class="stat-card">

            <div class="label">
                Approved Leaves
            </div>

            <h3 class="green">
                ${approvedLeaveDays}
            </h3>

            <div class="small">
                Approved leave days
            </div>

        </div>



        <!-- LOP -->

        <div class="stat-card">

            <div class="label">
                LOP Days
            </div>

            <h3 class="red">
                0
            </h3>

            <div class="small">
                Current month
            </div>

        </div>


    </div>



    <!-- =================================================
         CONTENT GRID
    ================================================== -->

    <div class="content-grid">


        <!-- =================================================
             RECENT LEAVE REQUESTS
        ================================================== -->

        <div class="card">


            <div class="card-header">

                <h2>
                    Recent Leave Requests
                </h2>


                <a
                    href="${pageContext.request.contextPath}/leave/history?employeeId=${employee.id}"
                    class="view-link">

                    View All

                </a>

            </div>



            <div class="table-wrapper">


                <table>


                    <thead>

                        <tr>

                            <th>
                                Leave Type
                            </th>

                            <th>
                                Dates
                            </th>

                            <th>
                                Days
                            </th>

                            <th>
                                Status
                            </th>

                        </tr>

                    </thead>


                    <tbody>


                        <c:choose>


                            <c:when test="${not empty leaveRequests}">


                                <c:forEach
                                    var="leave"
                                    items="${leaveRequests}"
                                    varStatus="status">


                                    <c:if test="${status.index < 5}">


                                        <tr>


                                            <td>
                                                Leave Type ID:
                                                ${leave.leaveTypeId}
                                            </td>


                                            <td>
                                                ${leave.startDate}
                                                -
                                                ${leave.endDate}
                                            </td>


                                            <td>
                                                ${leave.totalDays}
                                            </td>


                                            <td>


                                                <c:choose>


                                                    <c:when
                                                        test="${leave.status == 'Approved'}">

                                                        <span class="badge approved">
                                                            Approved
                                                        </span>

                                                    </c:when>


                                                    <c:when
                                                        test="${leave.status == 'Rejected'}">

                                                        <span class="badge rejected">
                                                            Rejected
                                                        </span>

                                                    </c:when>


                                                    <c:otherwise>

                                                        <span class="badge pending">
                                                            Pending
                                                        </span>

                                                    </c:otherwise>


                                                </c:choose>


                                            </td>


                                        </tr>


                                    </c:if>


                                </c:forEach>


                            </c:when>


                            <c:otherwise>


                                <tr>

                                    <td colspan="4">

                                        <div class="empty-message">

                                            No leave requests found.

                                        </div>

                                    </td>

                                </tr>


                            </c:otherwise>


                        </c:choose>


                    </tbody>


                </table>


            </div>


        </div>



        <!-- =================================================
             QUICK ACTIONS
        ================================================== -->

        <div class="card">


            <div class="card-header">

                <h2>
                    Quick Actions
                </h2>

            </div>


            <div class="quick-actions">


                <!-- APPLY LEAVE -->

                <a
                    href="${pageContext.request.contextPath}/leave/apply"
                    class="quick-action">


                    <div class="action-icon">
                        +
                    </div>


                    <div class="action-text">

                        <strong>
                            Apply Leave
                        </strong>

                        <span>
                            Submit a new leave request
                        </span>

                    </div>


                </a>



                <!-- PROFILE -->

                <a
                    href="${pageContext.request.contextPath}/employees/profile?id=${employee.id}"
                    class="quick-action">


                    <div class="action-icon">
                        👤
                    </div>


                    <div class="action-text">

                        <strong>
                            My Profile
                        </strong>

                        <span>
                            View your employee details
                        </span>

                    </div>


                </a>



                <!-- PAYSLIP -->

                <a
                    href="${pageContext.request.contextPath}/payroll/my-payslip?employeeId=${employee.id}"
                    class="quick-action">


                    <div class="action-icon">
                        ₹
                    </div>


                    <div class="action-text">

                        <strong>
                            View Payslip
                        </strong>

                        <span>
                            Check your latest salary slip
                        </span>

                    </div>


                </a>



                <!-- LEAVE HISTORY -->

                <a
                    href="${pageContext.request.contextPath}/leave/history?employeeId=${employee.id}"
                    class="quick-action">


                    <div class="action-icon">
                        ≡
                    </div>


                    <div class="action-text">

                        <strong>
                            Leave History
                        </strong>

                        <span>
                            View previous leave requests
                        </span>

                    </div>


                </a>


            </div>


        </div>


    </div>


</main>


</div>


</body>

</html>