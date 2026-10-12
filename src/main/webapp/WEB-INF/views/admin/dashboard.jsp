<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Admin Dashboard | Employee Management System</title>


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
   MAIN APP
========================================================= */

.app {

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


/* =========================================================
   BRAND
========================================================= */

.brand {

    height: 43px;

    display: flex;

    align-items: center;

    gap: 10px;

    padding: 0 8px;

    margin-bottom: 19px;
}

.brand-logo {

    width: 31px;

    height: 31px;

    border-radius: 7px;

    background: #b7ff45;

    color: #11150e;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 12px;

    font-weight: 800;

    box-shadow:
        0 3px 12px rgba(183,255,69,0.18);
}

.brand-name {

    color: #f3f3f3;

    font-size: 15px;

    font-weight: 650;

    letter-spacing: -0.3px;
}


/* =========================================================
   SIDEBAR SEARCH
========================================================= */

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

    box-shadow:
        inset 0 1px 0 rgba(255,255,255,0.025);
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


/* =========================================================
   NAVIGATION
========================================================= */

.nav-section {

    margin-bottom: 23px;
}

.nav-title {

    padding: 0 9px;

    margin-bottom: 9px;

    font-size: 10px;

    text-transform: uppercase;

    letter-spacing: 1px;

    color: #555b57;

    font-weight: 600;
}

.nav-link {

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

.nav-link:hover {

    background: #191c1a;

    color: #eeeeee;

    transform: translateX(2px);
}

.nav-link.active {

    background: #222622;

    color: #ffffff;

    box-shadow:
        inset 0 0 0 1px rgba(255,255,255,0.035);
}

.nav-icon {

    width: 18px;

    text-align: center;

    color: #858b86;

    font-size: 13px;
}

.nav-link.active .nav-icon {

    color: #b7ff45;
}


/* =========================================================
   SIDEBAR BOTTOM
========================================================= */

.sidebar-bottom {

    margin-top: auto;

    padding-top: 14px;

    border-top: 1px solid #222522;
}

.logout-link {

    display: flex;

    align-items: center;

    gap: 10px;

    height: 38px;

    padding: 0 11px;

    border-radius: 7px;

    color: #858a86;

    text-decoration: none;

    font-size: 12px;

    transition: 0.2s;
}

.logout-link:hover {

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

    box-shadow:
        inset 0 0 80px rgba(255,255,255,0.012);
}


/* =========================================================
   TOPBAR
========================================================= */

.topbar {

    height: 68px;

    border-bottom: 1px solid #272a28;

    background: #0d0f0e;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 27px;

    position: sticky;

    top: 0;

    z-index: 900;

    box-shadow:
        0 3px 18px rgba(255,255,255,0.018);
}

.topbar-left {

    display: flex;

    align-items: center;

    gap: 15px;
}

.topbar-title {

    font-size: 15px;

    color: #eeeeee;

    font-weight: 600;
}

.topbar-right {

    display: flex;

    align-items: center;

    gap: 9px;
}


/* =========================================================
   TOP SEARCH
========================================================= */

.top-search {

    width: 220px;

    height: 35px;

    border: 1px solid #292d2a;

    background: #141715;

    border-radius: 7px;

    display: flex;

    align-items: center;

    padding: 0 11px;

    color: #686e69;

    font-size: 10px;

    box-shadow:
        0 2px 10px rgba(255,255,255,0.018);
}

.top-search span {

    margin-right: 8px;

    font-size: 14px;
}


/* =========================================================
   TOP ICON
========================================================= */

.top-icon {

    width: 34px;

    height: 34px;

    border: 1px solid #292d2a;

    background: #141715;

    border-radius: 7px;

    display: flex;

    align-items: center;

    justify-content: center;

    color: #8a908b;

    font-size: 13px;

    transition: 0.2s;

    box-shadow:
        0 2px 8px rgba(255,255,255,0.018);
}

.top-icon:hover {

    color: #b7ff45;

    border-color: #3a413b;
}


/* =========================================================
   PROFILE
========================================================= */

.profile {

    display: flex;

    align-items: center;

    gap: 9px;

    padding-left: 7px;
}

.profile-avatar {

    width: 34px;

    height: 34px;

    border-radius: 50%;

    background: #202520;

    border: 1px solid #3a403b;

    display: flex;

    align-items: center;

    justify-content: center;

    color: #b7ff45;

    font-size: 11px;

    font-weight: 700;

    box-shadow:
        0 3px 12px rgba(255,255,255,0.025);
}

.profile-name {

    font-size: 11px;

    color: #e1e1e1;

    font-weight: 600;
}

.profile-role {

    font-size: 9px;

    color: #686e69;

    margin-top: 2px;
}


/* =========================================================
   CONTENT
========================================================= */

.content {

    padding: 28px;

    max-width: 1550px;

    margin: auto;
}


/* =========================================================
   PAGE HEADER
========================================================= */

.page-header {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 22px;
}

.page-heading h1 {

    font-size: 23px;

    font-weight: 650;

    letter-spacing: -0.7px;

    color: #f2f2f2;
}

.page-heading p {

    margin-top: 6px;

    color: #707570;

    font-size: 12px;
}

.workspace-badge {

    height: 33px;

    display: flex;

    align-items: center;

    padding: 0 12px;

    border: 1px solid #2b302c;

    background: #131614;

    border-radius: 7px;

    color: #909690;

    font-size: 10px;

    box-shadow:
        0 4px 14px rgba(255,255,255,0.018);
}

.workspace-dot {

    width: 7px;

    height: 7px;

    background: #b7ff45;

    border-radius: 50%;

    margin-right: 8px;

    box-shadow:
        0 0 8px rgba(183,255,69,0.55);
}


/* =========================================================
   STATISTICS
========================================================= */

.stats-grid {

    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 12px;

    margin-bottom: 14px;
}

.stat-card {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    border: 1px solid #292d2a;

    border-radius: 9px;

    padding: 17px;

    min-height: 132px;

    transition:
        border-color 0.2s ease,
        transform 0.2s ease;

    box-shadow:
        0 7px 22px rgba(255,255,255,0.025),
        0 10px 28px rgba(0,0,0,0.20);
}

.stat-card:hover {

    border-color: #3c433d;

    transform: translateY(-2px);

    box-shadow:
        0 10px 26px rgba(255,255,255,0.035),
        0 15px 30px rgba(0,0,0,0.25);
}

.stat-card-top {

    display: flex;

    justify-content: space-between;

    align-items: center;
}

.stat-icon {

    width: 33px;

    height: 33px;

    border-radius: 7px;

    background: #192016;

    border: 1px solid #303a2c;

    color: #b7ff45;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 14px;
}

.stat-more {

    color: #505650;

    font-size: 14px;
}

.stat-label {

    margin-top: 15px;

    color: #767b77;

    font-size: 11px;
}

.stat-number {

    margin-top: 5px;

    color: #f2f2f2;

    font-size: 28px;

    line-height: 1;

    font-weight: 650;

    letter-spacing: -0.9px;
}

.stat-description {

    margin-top: 8px;

    color: #5b605c;

    font-size: 9px;
}

.stat-description strong {

    color: #a0a5a1;

    font-weight: 500;
}


/* =========================================================
   RECENT LEAVE REQUESTS
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

    margin-bottom: 14px;
}

.card-header {

    min-height: 58px;

    padding: 0 17px;

    border-bottom: 1px solid #252925;

    display: flex;

    align-items: center;

    justify-content: space-between;
}

.card-title {

    font-size: 14px;

    color: #eeeeee;

    font-weight: 600;
}

.card-subtitle {

    color: #686e69;

    font-size: 10px;

    margin-top: 4px;
}

.card-action {

    height: 30px;

    padding: 0 11px;

    background: #171a18;

    border: 1px solid #303530;

    border-radius: 6px;

    color: #a0a5a1;

    font-size: 10px;

    text-decoration: none;

    display: flex;

    align-items: center;

    transition: 0.2s;
}

.card-action:hover {

    color: #b7ff45;

    border-color: #414941;

    background: #1b201b;
}


/* =========================================================
   TABLE
========================================================= */

.table-container {

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

    color: #666b67;

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

.employee-name {

    color: #e1e1e1;

    font-weight: 550;
}

.leave-type {

    color: #a0a5a1;
}


/* =========================================================
   STATUS
========================================================= */

.status {

    display: inline-flex;

    align-items: center;

    gap: 6px;

    padding: 6px 10px;

    border-radius: 20px;

    font-size: 9px;

    font-weight: 600;

    min-width: 76px;

    justify-content: center;
}

.status-dot {

    width: 6px;

    height: 6px;

    border-radius: 50%;
}


/* PENDING - YELLOW */

.status.pending {

    color: #f5c842;

    background: rgba(245,200,66,0.10);

    border: 1px solid rgba(245,200,66,0.20);
}

.status.pending .status-dot {

    background: #f5c842;

    box-shadow:
        0 0 7px rgba(245,200,66,0.55);
}


/* APPROVED - GREEN */

.status.approved {

    color: #4ade80;

    background: rgba(74,222,128,0.09);

    border: 1px solid rgba(74,222,128,0.20);
}

.status.approved .status-dot {

    background: #4ade80;

    box-shadow:
        0 0 7px rgba(74,222,128,0.55);
}


/* REJECTED - RED */

.status.rejected {

    color: #ff5c5c;

    background: rgba(255,92,92,0.09);

    border: 1px solid rgba(255,92,92,0.20);
}

.status.rejected .status-dot {

    background: #ff5c5c;

    box-shadow:
        0 0 7px rgba(255,92,92,0.55);
}


/* =========================================================
   BOTTOM TWO COLUMNS
========================================================= */

.bottom-grid {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 14px;

    margin-bottom: 14px;
}


/* =========================================================
   SYSTEM STATISTICS CARD
========================================================= */

.system-card,
.quick-card {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    border: 1px solid #292d2a;

    border-radius: 10px;

    min-height: 300px;

    box-shadow:
        0 8px 24px rgba(255,255,255,0.025),
        0 15px 35px rgba(0,0,0,0.20);

    overflow: hidden;
}


/* =========================================================
   SYSTEM STATISTICS GRID
========================================================= */

.system-grid {

    padding: 14px;

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 10px;
}

.system-item {

    min-height: 112px;

    background: #181c19;

    border: 1px solid #2a302c;

    border-radius: 8px;

    padding: 13px;

    box-shadow:
        0 5px 15px rgba(255,255,255,0.025),
        inset 0 1px 0 rgba(255,255,255,0.015);

    transition: 0.2s;
}

.system-item:hover {

    border-color: #3b443d;

    transform: translateY(-1px);
}

.system-item-top {

    display: flex;

    align-items: center;

    justify-content: space-between;
}

.system-item-icon {

    width: 30px;

    height: 30px;

    border-radius: 7px;

    background: #1e241e;

    color: #b7ff45;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 12px;
}

.system-item-menu {

    color: #555b56;

    font-size: 12px;
}

.system-item-label {

    margin-top: 13px;

    color: #777d78;

    font-size: 10px;
}

.system-item-value {

    margin-top: 4px;

    color: #f0f0f0;

    font-size: 20px;

    font-weight: 600;
}

.system-item-small {

    margin-top: 4px;

    color: #555b57;

    font-size: 8px;
}


/* =========================================================
   QUICK ACTIONS
========================================================= */

.quick-grid {

    padding: 14px;

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 10px;
}

.quick-action {

    min-height: 112px;

    padding: 14px;

    background: #181c19;

    border: 1px solid #2a302c;

    border-radius: 8px;

    text-decoration: none;

    box-shadow:
        0 5px 15px rgba(255,255,255,0.025),
        inset 0 1px 0 rgba(255,255,255,0.015);

    transition:
        0.2s ease;
}

.quick-action:hover {

    background: #1b201c;

    border-color: #3b443d;

    transform: translateY(-2px);

    box-shadow:
        0 8px 20px rgba(255,255,255,0.035);
}

.quick-icon {

    width: 31px;

    height: 31px;

    border-radius: 7px;

    background: #1e241e;

    color: #b7ff45;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 13px;

    margin-bottom: 12px;
}

.quick-title {

    color: #dedede;

    font-size: 11px;

    font-weight: 600;
}

.quick-description {

    color: #626862;

    font-size: 8px;

    margin-top: 4px;

    line-height: 1.4;
}


/* =========================================================
   FOOTER
========================================================= */

.footer {

    padding: 7px 0 2px;

    color: #464c47;

    font-size: 9px;

    text-align: center;
}


/* =========================================================
   RESPONSIVE
========================================================= */

@media (max-width: 1150px) {

    .stats-grid {

        grid-template-columns:
            repeat(2, 1fr);
    }

    .bottom-grid {

        grid-template-columns: 1fr;
    }
}


@media (max-width: 800px) {

    .sidebar {

        width: 68px;

        min-width: 68px;

        padding: 15px 8px;
    }

    .brand {

        justify-content: center;

        padding: 0;
    }

    .brand-name,
    .sidebar-search,
    .nav-title,
    .nav-link span,
    .logout-link span {

        display: none;
    }

    .brand-logo {

        width: 35px;

        height: 35px;
    }

    .nav-link {

        justify-content: center;

        padding: 0;
    }

    .nav-icon {

        width: auto;
    }

    .main {

        margin-left: 68px;

        width: calc(100% - 68px);
    }

    .top-search {

        display: none;
    }

    .profile-name,
    .profile-role {

        display: none;
    }
}


@media (max-width: 600px) {

    .content {

        padding: 17px;
    }

    .topbar {

        padding: 0 17px;
    }

    .stats-grid {

        grid-template-columns: 1fr;
    }

    .system-grid,
    .quick-grid {

        grid-template-columns: 1fr;
    }

    .page-header {

        align-items: flex-start;

        gap: 12px;

        flex-direction: column;
    }

    .workspace-badge {

        align-self: flex-start;
    }
}


@media (max-width: 400px) {

    .profile {

        display: none;
    }
}

</style>

</head>


<body>


<div class="app">


<!-- =====================================================
     SIDEBAR
===================================================== -->

<aside class="sidebar">


    <div class="brand">

        <div class="brand-logo">
            EM
        </div>

        <div class="brand-name">
            Employee MS
        </div>

    </div>


    <div class="sidebar-search">

        <span class="sidebar-search-icon">
            ⌕
        </span>

        Search

        <span class="sidebar-search-shortcut">
            /
        </span>

    </div>


    <div class="nav-section">

        <div class="nav-title">
            Main
        </div>


        <a
            href="${pageContext.request.contextPath}/admin"
            class="nav-link active">

            <span class="nav-icon">
                ▦
            </span>

            <span>
                Dashboard
            </span>

        </a>


        <a
            href="${pageContext.request.contextPath}/employees"
            class="nav-link">

            <span class="nav-icon">
                ♙
            </span>

            <span>
                Employees
            </span>

        </a>


        <a
            href="${pageContext.request.contextPath}/departments"
            class="nav-link">

            <span class="nav-icon">
                ▤
            </span>

            <span>
                Departments
            </span>

        </a>


        <a
            href="${pageContext.request.contextPath}/leave-types"
            class="nav-link">

            <span class="nav-icon">
                ▧
            </span>

            <span>
                Leave Types
            </span>

        </a>


        <a
            href="${pageContext.request.contextPath}/leave/pending"
            class="nav-link">

            <span class="nav-icon">
                ◷
            </span>

            <span>
                Leave Requests
            </span>

        </a>


        <a
            href="${pageContext.request.contextPath}/payroll"
            class="nav-link">

            <span class="nav-icon">
                ₹
            </span>

            <span>
                Payroll
            </span>

        </a>

    </div>


    <div class="nav-section">

        <div class="nav-title">
            Other
        </div>


        <a href="#" class="nav-link">

            <span class="nav-icon">
                ⚙
            </span>

            <span>
                Settings
            </span>

        </a>

    </div>


    <div class="sidebar-bottom">

        <a
            href="${pageContext.request.contextPath}/logout"
            class="logout-link">

            <span class="nav-icon">
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

    <header class="topbar">


        <div class="topbar-left">

            <div class="topbar-title">
                Admin Dashboard
            </div>

        </div>


        <div class="topbar-right">


            <div class="top-search">

                <span>
                    ⌕
                </span>

                Search employees, departments...

            </div>


            <div class="top-icon">
                ♢
            </div>


            <div class="top-icon">
                ◐
            </div>


            <div class="profile">

                <div class="profile-avatar">
                    A
                </div>

                <div>

                    <div class="profile-name">
                        Admin
                    </div>

                    <div class="profile-role">
                        Administrator
                    </div>

                </div>

            </div>


        </div>


    </header>



    <!-- CONTENT -->

    <section class="content">


        <!-- PAGE HEADER -->

        <div class="page-header">


            <div class="page-heading">

                <h1>
                    Overview
                </h1>

                <p>
                    Here's what's happening with your organization today.
                </p>

            </div>


            <div class="workspace-badge">

                <span class="workspace-dot"></span>

                Admin Workspace

            </div>


        </div>



        <!-- =================================================
             STAT CARDS
        ================================================== -->

        <div class="stats-grid">


            <div class="stat-card">

                <div class="stat-card-top">

                    <div class="stat-icon">
                        ♙
                    </div>

                    <div class="stat-more">
                        ···
                    </div>

                </div>

                <div class="stat-label">
                    Total Employees
                </div>

                <div class="stat-number">
                    ${totalEmployees}
                </div>

                <div class="stat-description">
                    <strong>Organization</strong> employees
                </div>

            </div>



            <div class="stat-card">

                <div class="stat-card-top">

                    <div class="stat-icon">
                        ▤
                    </div>

                    <div class="stat-more">
                        ···
                    </div>

                </div>

                <div class="stat-label">
                    Departments
                </div>

                <div class="stat-number">
                    ${departmentCount}
                </div>

                <div class="stat-description">
                    <strong>Active</strong> departments
                </div>

            </div>



            <div class="stat-card">

                <div class="stat-card-top">

                    <div class="stat-icon">
                        ◷
                    </div>

                    <div class="stat-more">
                        ···
                    </div>

                </div>

                <div class="stat-label">
                    Pending Leaves
                </div>

                <div class="stat-number">
                    ${pendingLeaves}
                </div>

                <div class="stat-description">
                    <strong>Requires</strong> attention
                </div>

            </div>



            <div class="stat-card">

                <div class="stat-card-top">

                    <div class="stat-icon">
                        ₹
                    </div>

                    <div class="stat-more">
                        ···
                    </div>

                </div>

                <div class="stat-label">
                    Monthly Collection
                </div>

                <div class="stat-number">
                    ₹12.8L
                </div>

                <div class="stat-description">
                    <strong>Current</strong> month
                </div>

            </div>


        </div>



        <!-- =================================================
             RECENT LEAVE REQUESTS
        ================================================== -->

        <div class="table-card">


            <div class="card-header">


                <div>

                    <div class="card-title">
                        Recent Leave Requests
                    </div>

                    <div class="card-subtitle">
                        Latest leave activity from employees
                    </div>

                </div>


                <a
                    href="${pageContext.request.contextPath}/leave/pending"
                    class="card-action">

                    View All →

                </a>


            </div>



            <div class="table-container">


                <table>


                    <thead>

                        <tr>

                            <th>
                                #
                            </th>

                            <th>
                                Employee
                            </th>

                            <th>
                                Leave Type
                            </th>

                            <th>
                                Duration
                            </th>

                            <th>
                                Status
                            </th>

                        </tr>

                    </thead>


                    <tbody>


                        <tr>

                            <td>
                                01
                            </td>

                            <td class="employee-name">
                                Rahul Sharma
                            </td>

                            <td class="leave-type">
                                Casual Leave
                            </td>

                            <td>
                                20 Sep - 22 Sep
                            </td>

                            <td>

                                <span class="status pending">

                                    <span class="status-dot"></span>

                                    Pending

                                </span>

                            </td>

                        </tr>



                        <tr>

                            <td>
                                02
                            </td>

                            <td class="employee-name">
                                Priya Patil
                            </td>

                            <td class="leave-type">
                                Sick Leave
                            </td>

                            <td>
                                18 Sep - 19 Sep
                            </td>

                            <td>

                                <span class="status approved">

                                    <span class="status-dot"></span>

                                    Approved

                                </span>

                            </td>

                        </tr>



                        <tr>

                            <td>
                                03
                            </td>

                            <td class="employee-name">
                                Amit Kulkarni
                            </td>

                            <td class="leave-type">
                                Earned Leave
                            </td>

                            <td>
                                24 Sep - 26 Sep
                            </td>

                            <td>

                                <span class="status rejected">

                                    <span class="status-dot"></span>

                                    Rejected

                                </span>

                            </td>

                        </tr>



                        <tr>

                            <td>
                                04
                            </td>

                            <td class="employee-name">
                                Sneha Joshi
                            </td>

                            <td class="leave-type">
                                Casual Leave
                            </td>

                            <td>
                                15 Sep - 16 Sep
                            </td>

                            <td>

                                <span class="status approved">

                                    <span class="status-dot"></span>

                                    Approved

                                </span>

                            </td>

                        </tr>



                        <tr>

                            <td>
                                05
                            </td>

                            <td class="employee-name">
                                Rohan Deshmukh
                            </td>

                            <td class="leave-type">
                                Sick Leave
                            </td>

                            <td>
                                12 Sep - 14 Sep
                            </td>

                            <td>

                                <span class="status pending">

                                    <span class="status-dot"></span>

                                    Pending

                                </span>

                            </td>

                        </tr>


                    </tbody>


                </table>


            </div>


        </div>



        <!-- =================================================
             SYSTEM STATISTICS + QUICK ACTIONS
        ================================================== -->

        <div class="bottom-grid">


            <!-- SYSTEM STATISTICS -->

            <div class="system-card">


                <div class="card-header">

                    <div>

                        <div class="card-title">
                            System Statistics
                        </div>

                        <div class="card-subtitle">
                            Key metrics about your organization
                        </div>

                    </div>


                    <span class="card-action">
                        This Month
                    </span>

                </div>


                <div class="system-grid">


                    <div class="system-item">


                        <div class="system-item-top">

                            <div class="system-item-icon">
                                ♙
                            </div>

                            <div class="system-item-menu">
                                ···
                            </div>

                        </div>


                        <div class="system-item-label">
                            Total Employees
                        </div>


                        <div class="system-item-value">
                            ${totalEmployees}
                        </div>


                        <div class="system-item-small">
                            Registered employees
                        </div>


                    </div>



                    <div class="system-item">


                        <div class="system-item-top">

                            <div class="system-item-icon">
                                ▤
                            </div>

                            <div class="system-item-menu">
                                ···
                            </div>

                        </div>


                        <div class="system-item-label">
                            Departments
                        </div>


                        <div class="system-item-value">
                            ${departmentCount}
                        </div>


                        <div class="system-item-small">
                            Active departments
                        </div>


                    </div>



                    <div class="system-item">


                        <div class="system-item-top">

                            <div class="system-item-icon">
                                ◷
                            </div>

                            <div class="system-item-menu">
                                ···
                            </div>

                        </div>


                        <div class="system-item-label">
                            Pending Leaves
                        </div>


                        <div class="system-item-value">
                            ${pendingLeaves}
                        </div>


                        <div class="system-item-small">
                            Requests requiring action
                        </div>


                    </div>



                    <div class="system-item">


                        <div class="system-item-top">

                            <div class="system-item-icon">
                                ₹
                            </div>

                            <div class="system-item-menu">
                                ···
                            </div>

                        </div>


                        <div class="system-item-label">
                            Monthly Collection
                        </div>


                        <div class="system-item-value">
                            ₹12.8L
                        </div>


                        <div class="system-item-small">
                            Current month
                        </div>


                    </div>


                </div>


            </div>



            <!-- QUICK ACTIONS -->

            <div class="quick-card">


                <div class="card-header">

                    <div>

                        <div class="card-title">
                            Quick Actions
                        </div>

                        <div class="card-subtitle">
                            Frequently used administration tools
                        </div>

                    </div>

                </div>


                <div class="quick-grid">


                    <a
                        href="${pageContext.request.contextPath}/employees/add"
                        class="quick-action">


                        <div class="quick-icon">
                            +
                        </div>


                        <div class="quick-title">
                            Add Employee
                        </div>


                        <div class="quick-description">
                            Create a new employee profile
                        </div>


                    </a>



                    <a
                        href="${pageContext.request.contextPath}/departments"
                        class="quick-action">


                        <div class="quick-icon">
                            ▤
                        </div>


                        <div class="quick-title">
                            Manage Departments
                        </div>


                        <div class="quick-description">
                            View and edit departments
                        </div>


                    </a>



                    <a
                        href="${pageContext.request.contextPath}/leave-types"
                        class="quick-action">


                        <div class="quick-icon">
                            ▧
                        </div>


                        <div class="quick-title">
                            Manage Leave Types
                        </div>


                        <div class="quick-description">
                            Configure leave policies
                        </div>


                    </a>



                    <a
                        href="${pageContext.request.contextPath}/leave/pending"
                        class="quick-action">


                        <div class="quick-icon">
                            ✓
                        </div>


                        <div class="quick-title">
                            Review Leave Requests
                        </div>


                        <div class="quick-description">
                            Approve or reject requests
                        </div>


                    </a>


                </div>


            </div>


        </div>



        <!-- FOOTER -->

        <div class="footer">

            Employee Management System · Admin Workspace

        </div>


    </section>


</main>


</div>


</body>

</html>