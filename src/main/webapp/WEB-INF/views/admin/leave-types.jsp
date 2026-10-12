<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Leave Types | Employee Management System</title>

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

    left: 0;

    top: 0;

    background: #0d0f0e;

    border-right: 1px solid #272a28;

    padding: 19px 13px;

    display: flex;

    flex-direction: column;

    z-index: 1000;

    box-shadow:
        4px 0 20px rgba(255,255,255,0.025);
}


/* BRAND */

.logo {

    height: 43px;

    display: flex;

    align-items: center;

    gap: 10px;

    padding: 0 8px;

    margin-bottom: 19px;

    color: #f3f3f3;

    font-size: 15px;

    font-weight: 650;

    letter-spacing: -0.3px;
}

.logo-box {

    width: 31px;

    height: 31px;

    border-radius: 7px;

    background: #b7ff45;

    color: #11150e;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 11px;

    font-weight: 800;

    box-shadow:
        0 3px 12px rgba(183,255,69,0.18);
}


/* SEARCH */

.sidebar-search {

    height: 36px;

    background: #141715;

    border: 1px solid #292d2a;

    border-radius: 7px;

    display: flex;

    align-items: center;

    padding: 0 10px;

    margin: 0 2px 24px;

    color: #717671;

    font-size: 11px;
}

.sidebar-search-icon {

    margin-right: 8px;

    font-size: 14px;
}

.sidebar-search-shortcut {

    margin-left: auto;

    color: #555b57;

    font-size: 10px;
}


/* NAVIGATION */

.menu-title {

    padding: 0 9px;

    margin-bottom: 9px;

    font-size: 10px;

    text-transform: uppercase;

    letter-spacing: 1px;

    color: #555b57;

    font-weight: 600;
}

.menu {

    width: 100%;
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

    transition:
        background 0.2s ease,
        color 0.2s ease,
        transform 0.2s ease;
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

    background:
        radial-gradient(
            circle at 80% 0%,
            rgba(255,255,255,0.025),
            transparent 28%
        );

    padding: 0 28px 30px;

    box-shadow:
        inset 0 0 80px rgba(255,255,255,0.012);
}


/* =========================================================
   TOPBAR
========================================================= */

.topbar {

    height: 68px;

    margin: 0 -28px 28px;

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


/* TITLE */

.page-title h1 {

    font-size: 22px;

    font-weight: 650;

    color: #f2f2f2;

    letter-spacing: -0.6px;
}

.page-title p {

    color: #707570;

    font-size: 11px;

    margin-top: 5px;
}


/* ADMIN */

.admin-info {

    display: flex;

    align-items: center;

    gap: 9px;
}

.avatar {

    width: 34px;

    height: 34px;

    border-radius: 50%;

    background: #202520;

    border: 1px solid #3a403b;

    color: #b7ff45;

    display: flex;

    justify-content: center;

    align-items: center;

    font-size: 11px;

    font-weight: 700;

    box-shadow:
        0 3px 12px rgba(255,255,255,0.025);
}

.admin-text {

    font-size: 10px;
}

.admin-text strong {

    display: block;

    font-size: 11px;

    color: #e1e1e1;
}

.admin-text span {

    color: #686e69;

    font-size: 9px;
}


/* =========================================================
   PAGE HEADER
========================================================= */

.page-header {

    display: flex;

    justify-content: space-between;

    align-items: flex-end;

    margin-bottom: 18px;
}

.page-header-left h2 {

    font-size: 18px;

    font-weight: 600;

    color: #eeeeee;
}

.page-header-left p {

    color: #666c67;

    font-size: 10px;

    margin-top: 5px;
}

.page-badge {

    height: 31px;

    padding: 0 11px;

    display: flex;

    align-items: center;

    border: 1px solid #2b302c;

    background: #131614;

    border-radius: 7px;

    color: #909690;

    font-size: 9px;

    box-shadow:
        0 4px 14px rgba(255,255,255,0.018);
}

.page-badge-dot {

    width: 6px;

    height: 6px;

    background: #b7ff45;

    border-radius: 50%;

    margin-right: 7px;

    box-shadow:
        0 0 8px rgba(183,255,69,0.55);
}


/* =========================================================
   ACTION BAR
========================================================= */

.action-bar {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    border: 1px solid #292d2a;

    border-radius: 10px;

    min-height: 72px;

    padding: 14px;

    margin-bottom: 13px;

    display: flex;

    justify-content: space-between;

    align-items: center;

    gap: 12px;

    box-shadow:
        0 8px 24px rgba(255,255,255,0.025),
        0 15px 35px rgba(0,0,0,0.20);
}


/* SEARCH */

.search-box {

    position: relative;

    width: 330px;
}

.search-box input {

    width: 100%;

    height: 39px;

    padding: 0 13px 0 37px;

    background: #0f1210;

    color: #dddddd;

    border: 1px solid #303530;

    border-radius: 7px;

    outline: none;

    font-size: 11px;

    transition: 0.2s;

    box-shadow:
        inset 0 1px 0 rgba(255,255,255,0.018);
}

.search-box input::placeholder {

    color: #5d635e;
}

.search-box input:focus {

    border-color: #566151;

    box-shadow:
        0 0 0 3px rgba(183,255,69,0.045);
}

.search-icon {

    position: absolute;

    left: 13px;

    top: 50%;

    transform: translateY(-50%);

    color: #666c67;

    font-size: 14px;

    pointer-events: none;
}


/* ADD BUTTON */

.add-btn {

    height: 39px;

    background: #b7ff45;

    color: #10140d;

    border: none;

    padding: 0 16px;

    border-radius: 7px;

    cursor: pointer;

    font-size: 11px;

    font-weight: 700;

    transition: 0.2s;

    box-shadow:
        0 5px 15px rgba(183,255,69,0.10);
}

.add-btn:hover {

    background: #c5ff67;

    transform: translateY(-1px);

    box-shadow:
        0 7px 18px rgba(183,255,69,0.15);
}


/* =========================================================
   TABLE CARD
========================================================= */

.table-card {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    border: 1px solid #292d2a;

    border-radius: 10px;

    overflow: hidden;

    box-shadow:
        0 8px 24px rgba(255,255,255,0.025),
        0 15px 35px rgba(0,0,0,0.20);
}


/* TABLE HEADER */

.table-header {

    min-height: 60px;

    padding: 0 17px;

    border-bottom: 1px solid #252925;

    display: flex;

    justify-content: space-between;

    align-items: center;
}

.table-header-left h2 {

    font-size: 14px;

    color: #eeeeee;

    font-weight: 600;
}

.table-header-left p {

    font-size: 9px;

    color: #656b66;

    margin-top: 4px;
}

.leave-count {

    min-width: 31px;

    height: 26px;

    padding: 0 8px;

    display: flex;

    align-items: center;

    justify-content: center;

    background: #1a2117;

    border: 1px solid #303a2c;

    color: #b7ff45;

    border-radius: 6px;

    font-size: 10px;

    font-weight: 600;
}


/* =========================================================
   TABLE
========================================================= */

.table-wrapper {

    overflow-x: auto;
}

table {

    width: 100%;

    border-collapse: collapse;
}

thead {

    background: #121513;
}

th {

    text-align: left;

    padding: 13px 17px;

    color: #666c67;

    font-size: 9px;

    font-weight: 600;

    text-transform: uppercase;

    letter-spacing: 0.7px;

    white-space: nowrap;
}

td {

    padding: 15px 17px;

    border-top: 1px solid #222622;

    color: #929792;

    font-size: 11px;

    white-space: nowrap;
}

tbody tr {

    transition: background 0.2s ease;
}

tbody tr:hover {

    background: #171a18;
}


/* ID */

.id-cell {

    color: #606660;

    font-size: 10px;

    font-family: monospace;
}


/* LEAVE NAME */

.leave-name {

    color: #e1e1e1;

    font-weight: 600;

    font-size: 12px;
}


/* DAYS */

.days {

    color: #d1d5d2;

    font-weight: 600;

    font-size: 11px;
}

.days-number {

    color: #b7ff45;

    font-size: 12px;

    font-weight: 700;
}


/* STATUS */

.status {

    display: inline-flex;

    align-items: center;

    gap: 6px;

    padding: 6px 10px;

    border-radius: 20px;

    font-size: 9px;

    font-weight: 600;

    color: #4ade80;

    background: rgba(74,222,128,0.09);

    border: 1px solid rgba(74,222,128,0.20);
}

.status-dot {

    width: 6px;

    height: 6px;

    border-radius: 50%;

    background: #4ade80;

    box-shadow:
        0 0 7px rgba(74,222,128,0.55);
}


/* ACTIONS */

.actions {

    display: flex;

    align-items: center;

    gap: 7px;
}

.edit-btn,
.delete-btn {

    height: 29px;

    padding: 0 10px;

    border-radius: 6px;

    cursor: pointer;

    font-size: 9px;

    font-weight: 600;

    text-decoration: none;

    display: inline-flex;

    align-items: center;

    justify-content: center;

    transition: 0.2s;
}


/* EDIT */

.edit-btn {

    background: rgba(183,255,69,0.08);

    border: 1px solid rgba(183,255,69,0.18);

    color: #b7ff45;
}

.edit-btn:hover {

    background: rgba(183,255,69,0.14);

    border-color: rgba(183,255,69,0.30);
}


/* DELETE */

.delete-btn {

    background: rgba(255,92,92,0.08);

    border: 1px solid rgba(255,92,92,0.18);

    color: #ff7070;
}

.delete-btn:hover {

    background: rgba(255,92,92,0.14);

    border-color: rgba(255,92,92,0.30);
}


/* =========================================================
   EMPTY STATE
========================================================= */

.empty-message {

    text-align: center;

    padding: 65px 20px;

    color: #676d68;
}

.empty-icon {

    width: 48px;

    height: 48px;

    margin: 0 auto 14px;

    border-radius: 10px;

    background: #181c19;

    border: 1px solid #2b302c;

    color: #b7ff45;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 18px;
}

.empty-message h3 {

    margin-bottom: 7px;

    color: #d8d8d8;

    font-size: 14px;
}

.empty-message p {

    font-size: 10px;

    color: #626862;
}


/* =========================================================
   MODAL
========================================================= */

.modal {

    display: none;

    position: fixed;

    z-index: 2000;

    left: 0;

    top: 0;

    width: 100%;

    height: 100%;

    background: rgba(0,0,0,0.72);

    backdrop-filter: blur(5px);

    align-items: center;

    justify-content: center;

    padding: 20px;
}


/* MODAL CONTENT */

.modal-content {

    background:
        linear-gradient(
            145deg,
            #181b19,
            #111412
        );

    width: 430px;

    max-width: 100%;

    padding: 23px;

    border-radius: 11px;

    border: 1px solid #343934;

    box-shadow:
        0 25px 70px rgba(0,0,0,0.55),
        0 0 30px rgba(255,255,255,0.025);
}


/* MODAL HEADER */

.modal-header {

    display: flex;

    align-items: flex-start;

    justify-content: space-between;

    margin-bottom: 21px;
}

.modal-header h2 {

    font-size: 17px;

    color: #eeeeee;

    font-weight: 600;
}

.modal-header p {

    color: #656b66;

    font-size: 9px;

    margin-top: 5px;
}

.close-btn {

    width: 29px;

    height: 29px;

    border-radius: 6px;

    border: 1px solid #303530;

    background: #161916;

    color: #777d78;

    cursor: pointer;

    font-size: 15px;

    display: flex;

    align-items: center;

    justify-content: center;
}

.close-btn:hover {

    color: #ffffff;

    border-color: #454c46;
}


/* =========================================================
   FORM
========================================================= */

.form-group {

    margin-bottom: 16px;
}

.form-group label {

    display: block;

    margin-bottom: 7px;

    color: #9da29e;

    font-size: 10px;

    font-weight: 600;
}

.form-group input {

    width: 100%;

    padding: 11px 12px;

    background: #0e110f;

    border: 1px solid #303530;

    border-radius: 7px;

    color: #eeeeee;

    font-size: 11px;

    outline: none;

    transition: 0.2s;
}

.form-group input::placeholder {

    color: #555b57;
}

.form-group input:focus {

    border-color: #566151;

    box-shadow:
        0 0 0 3px rgba(183,255,69,0.045);
}


/* FORM ACTIONS */

.form-actions {

    display: flex;

    justify-content: flex-end;

    gap: 9px;

    margin-top: 21px;
}

.cancel-btn,
.save-btn {

    height: 36px;

    border: none;

    padding: 0 15px;

    border-radius: 7px;

    cursor: pointer;

    font-size: 10px;

    font-weight: 600;
}

.cancel-btn {

    background: #222622;

    color: #9a9f9b;

    border: 1px solid #303530;
}

.cancel-btn:hover {

    background: #292e2a;

    color: #eeeeee;
}

.save-btn {

    background: #b7ff45;

    color: #10140d;

    box-shadow:
        0 5px 15px rgba(183,255,69,0.10);
}

.save-btn:hover {

    background: #c5ff67;
}


/* =========================================================
   FOOTER
========================================================= */

.footer {

    text-align: center;

    padding: 18px 0 0;

    color: #454b46;

    font-size: 9px;
}


/* =========================================================
   RESPONSIVE
========================================================= */

@media (max-width: 1000px) {

    .sidebar {

        width: 205px;

        min-width: 205px;
    }

    .main {

        margin-left: 205px;

        width: calc(100% - 205px);
    }

    .search-box {

        width: 260px;
    }
}


@media (max-width: 750px) {

    .sidebar {

        width: 68px;

        min-width: 68px;

        padding: 15px 8px;
    }

    .logo {

        justify-content: center;

        padding: 0;
    }

    .logo > span,
    .sidebar-search,
    .menu-title,
    .menu a span:not(.menu-icon),
    .logout a span:not(.menu-icon) {

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

    .menu-icon {

        width: auto;
    }

    .main {

        margin-left: 68px;

        width: calc(100% - 68px);

        padding: 0 17px 25px;
    }

    .topbar {

        margin-left: -17px;

        margin-right: -17px;

        padding: 0 17px;
    }

    .admin-text {

        display: none;
    }

    .action-bar {

        align-items: stretch;

        flex-direction: column;
    }

    .search-box {

        width: 100%;
    }

    .add-btn {

        width: 100%;
    }

    .page-header {

        align-items: flex-start;

        flex-direction: column;

        gap: 12px;
    }
}


@media (max-width: 500px) {

    .table-header {

        padding: 0 13px;
    }

    th,
    td {

        padding-left: 13px;

        padding-right: 13px;
    }

    table {

        min-width: 760px;
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


    <!-- BRAND -->

    <div class="logo">

        <div class="logo-box">
            EM
        </div>

        <span>
            Employee MS
        </span>

    </div>


    <!-- SEARCH -->

    <div class="sidebar-search">

        <span class="sidebar-search-icon">
            ⌕
        </span>

        Search

        <span class="sidebar-search-shortcut">
            /
        </span>

    </div>


    <!-- NAVIGATION -->

    <div class="menu">


        <div class="menu-title">
            Main
        </div>


        <a
            href="${pageContext.request.contextPath}/admin">

            <span class="menu-icon">
                ▦
            </span>

            <span>
                Dashboard
            </span>

        </a>


        <a
            href="${pageContext.request.contextPath}/departments">

            <span class="menu-icon">
                ▤
            </span>

            <span>
                Departments
            </span>

        </a>


        <a
            href="${pageContext.request.contextPath}/leave-types"
            class="active">

            <span class="menu-icon">
                ▧
            </span>

            <span>
                Leave Types
            </span>

        </a>



        <div class="menu-title">
            Management
        </div>


        <a
            href="${pageContext.request.contextPath}/employees">

            <span class="menu-icon">
                ♙
            </span>

            <span>
                Employees
            </span>

        </a>


        <a
            href="${pageContext.request.contextPath}/leave/pending">

            <span class="menu-icon">
                ◷
            </span>

            <span>
                Leave Requests
            </span>

        </a>


        <a
            href="${pageContext.request.contextPath}/payroll">

            <span class="menu-icon">
                ₹
            </span>

            <span>
                Payroll
            </span>

        </a>


        <div class="menu-title">
            Reports
        </div>


        <a href="#">

            <span class="menu-icon">
                ▤
            </span>

            <span>
                Reports
            </span>

        </a>


    </div>


    <!-- LOGOUT -->

    <div class="logout">

        <a
            href="${pageContext.request.contextPath}/logout">

            <span class="menu-icon">
                ↪
            </span>

            <span>
                Logout
            </span>

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
                Leave Types
            </h1>

            <p>
                Manage employee leave types and allowed days.
            </p>

        </div>


        <div class="admin-info">

            <div class="avatar">
                A
            </div>

            <div class="admin-text">

                <strong>
                    Administrator
                </strong>

                <span>
                    HR Admin
                </span>

            </div>

        </div>


    </div>



    <!-- PAGE HEADER -->

    <div class="page-header">


        <div class="page-header-left">

            <h2>
                Leave Type Management
            </h2>

            <p>
                Configure available leave categories and maximum allowed days.
            </p>

        </div>


        <div class="page-badge">

            <span class="page-badge-dot"></span>

            Leave Configuration

        </div>


    </div>



    <!-- ACTION BAR -->

    <div class="action-bar">


        <div class="search-box">

            <span class="search-icon">
                ⌕
            </span>

            <input
                type="text"
                id="searchInput"
                placeholder="Search leave type..."
                onkeyup="searchLeaveType()">

        </div>


        <button
            type="button"
            class="add-btn"
            onclick="openLeaveTypeModal()">

            + Add Leave Type

        </button>


    </div>



    <!-- =================================================
         TABLE
    ================================================== -->

    <div class="table-card">


        <!-- TABLE HEADER -->

        <div class="table-header">


            <div class="table-header-left">

                <h2>
                    Leave Type List
                </h2>

                <p>
                    All leave categories currently configured in the system.
                </p>

            </div>


            <div class="leave-count">

                ${leaveTypes.size()}

            </div>


        </div>



        <!-- TABLE -->

        <div class="table-wrapper">


            <c:choose>


                <c:when test="${not empty leaveTypes}">


                    <table id="leaveTypeTable">


                        <thead>

                            <tr>

                                <th>
                                    ID
                                </th>

                                <th>
                                    Leave Type
                                </th>

                                <th>
                                    Maximum Days
                                </th>

                                <th>
                                    Status
                                </th>

                                <th>
                                    Actions
                                </th>

                            </tr>

                        </thead>


                        <tbody>


                            <c:forEach
                                var="leaveType"
                                items="${leaveTypes}">


                                <tr>


                                    <!-- ID -->

                                    <td class="id-cell">

                                        #${leaveType.id}

                                    </td>


                                    <!-- LEAVE TYPE -->

                                    <td>

                                        <div class="leave-name">

                                            ${leaveType.typeName}

                                        </div>

                                    </td>


                                    <!-- MAX DAYS -->

                                    <td>

                                        <span class="days-number">

                                            ${leaveType.maxDaysAllowed}

                                        </span>

                                        <span class="days">
                                            days
                                        </span>

                                    </td>


                                    <!-- STATUS -->

                                    <td>

                                        <span class="status">

                                            <span class="status-dot"></span>

                                            Active

                                        </span>

                                    </td>


                                    <!-- ACTIONS -->

                                    <td>

                                        <div class="actions">


                                            <a
                                                href="${pageContext.request.contextPath}/leave-types/edit?id=${leaveType.id}"
                                                class="edit-btn">

                                                Edit

                                            </a>


                                            <button
                                                type="button"
                                                class="delete-btn"
                                                onclick="deleteLeaveType(${leaveType.id})">

                                                Delete

                                            </button>


                                        </div>

                                    </td>


                                </tr>


                            </c:forEach>


                        </tbody>


                    </table>


                </c:when>


                <c:otherwise>


                    <div class="empty-message">


                        <div class="empty-icon">
                            ▧
                        </div>


                        <h3>
                            No Leave Types Found
                        </h3>


                        <p>
                            There are currently no leave types configured.
                        </p>


                    </div>


                </c:otherwise>


            </c:choose>


        </div>


    </div>



    <!-- FOOTER -->

    <div class="footer">

        Employee Management System · Leave Configuration

    </div>


</main>


</div>



<!-- =====================================================
     ADD LEAVE TYPE MODAL
===================================================== -->

<div
    class="modal"
    id="leaveTypeModal">


    <div class="modal-content">


        <div class="modal-header">


            <div>

                <h2>
                    Add Leave Type
                </h2>

                <p>
                    Create a new leave category for employees.
                </p>

            </div>


            <button
                type="button"
                class="close-btn"
                onclick="closeLeaveTypeModal()">

                ×

            </button>


        </div>



        <form
            action="${pageContext.request.contextPath}/leave-types/add"
            method="post">


            <!-- LEAVE TYPE NAME -->

            <div class="form-group">

                <label for="typeName">
                    Leave Type Name
                </label>

                <input
                    type="text"
                    id="typeName"
                    name="typeName"
                    placeholder="Example: Casual Leave"
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
                    placeholder="Example: 12"
                    min="1"
                    required>

            </div>



            <!-- ACTIONS -->

            <div class="form-actions">


                <button
                    type="button"
                    class="cancel-btn"
                    onclick="closeLeaveTypeModal()">

                    Cancel

                </button>


                <button
                    type="submit"
                    class="save-btn">

                    Save Leave Type

                </button>


            </div>


        </form>


    </div>


</div>



<script>

/* =========================================================
   SEARCH
========================================================= */

function searchLeaveType() {

    let input =
        document
            .getElementById("searchInput")
            .value
            .toLowerCase()
            .trim();

    let table =
        document.getElementById("leaveTypeTable");

    if (!table) {
        return;
    }

    let rows =
        table.getElementsByTagName("tr");

    for (let i = 1; i < rows.length; i++) {

        let leaveName =
            rows[i]
                .getElementsByTagName("td")[1];

        if (leaveName) {

            let text =
                leaveName.textContent.toLowerCase();

            rows[i].style.display =
                text.includes(input)
                    ? ""
                    : "none";
        }
    }
}


/* =========================================================
   OPEN MODAL
========================================================= */

function openLeaveTypeModal() {

    document
        .getElementById("leaveTypeModal")
        .style.display = "flex";

    document
        .getElementById("typeName")
        .focus();
}


/* =========================================================
   CLOSE MODAL
========================================================= */

function closeLeaveTypeModal() {

    document
        .getElementById("leaveTypeModal")
        .style.display = "none";
}


/* =========================================================
   DELETE
========================================================= */

function deleteLeaveType(id) {

    let confirmDelete =
        confirm(
            "Are you sure you want to delete this leave type?"
        );

    if (confirmDelete) {

        window.location.href =
            "${pageContext.request.contextPath}/leave-types/delete?id="
            + id;
    }
}


/* =========================================================
   CLOSE MODAL OUTSIDE CLICK
========================================================= */

window.onclick = function(event) {

    let modal =
        document.getElementById("leaveTypeModal");

    if (event.target === modal) {

        modal.style.display = "none";
    }
};


/* =========================================================
   ESCAPE KEY
========================================================= */

document.addEventListener(
    "keydown",
    function(event) {

        if (event.key === "Escape") {

            closeLeaveTypeModal();
        }

    }
);

</script>


</body>

</html>