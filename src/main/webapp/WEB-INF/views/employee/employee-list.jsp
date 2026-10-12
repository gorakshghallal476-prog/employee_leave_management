<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
    content="width=device-width, initial-scale=1.0">

<title>Employees | Employee Management System</title>

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
}


/* =====================================================
   MAIN LAYOUT
===================================================== */

.container {
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

    z-index: 1000;

    box-shadow:
        4px 0 20px rgba(255,255,255,0.025);
}


/* LOGO */

.logo {

    display: flex;
    align-items: center;

    justify-content: center;

    gap: 5px;

    height: 43px;

    margin-bottom: 22px;

    color: #eeeeee;

    font-size: 15px;

    font-weight: 650;
}

.logo span {
    color: #b7ff45;
}


/* MENU */

.menu-title {

    color: #555b57;

    font-size: 9px;

    margin: 18px 9px 8px;

    text-transform: uppercase;

    letter-spacing: 1px;

    font-weight: 600;
}

.menu a {

    height: 38px;

    display: flex;

    align-items: center;

    gap: 10px;

    padding: 0 11px;

    margin-bottom: 4px;

    border-radius: 7px;

    text-decoration: none;

    color: #929792;

    font-size: 11px;

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

    position: absolute;

    bottom: 18px;

    left: 13px;

    right: 13px;
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

    font-size: 10px;

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

    margin-left: 225px;

    width: calc(100% - 225px);

    min-height: 100vh;

    padding: 25px 28px 35px;

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

    min-height: 55px;

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 20px;

    padding-bottom: 16px;

    border-bottom: 1px solid #272a28;
}

.page-title h1 {

    font-size: 21px;

    margin-bottom: 5px;

    color: #eeeeee;

    font-weight: 650;

    letter-spacing: -0.4px;
}

.page-title p {

    color: #666c67;

    font-size: 10px;
}


/* ADMIN INFO */

.admin-info {

    display: flex;

    align-items: center;

    gap: 9px;
}

.avatar {

    width: 34px;
    height: 34px;

    border-radius: 50%;

    background: #1c211b;

    border: 1px solid #343b31;

    color: #b7ff45;

    display: flex;

    justify-content: center;

    align-items: center;

    font-size: 11px;

    font-weight: 700;
}

.admin-text strong {

    display: block;

    font-size: 10px;

    color: #dddddd;
}

.admin-text span {

    color: #666c67;

    font-size: 8px;
}


/* =====================================================
   TOOLBAR
===================================================== */

.toolbar {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    padding: 15px;

    border-radius: 9px;

    margin-bottom: 15px;

    display: flex;

    justify-content: space-between;

    align-items: center;

    gap: 12px;

    border: 1px solid #292d2a;

    box-shadow:
        0 7px 20px rgba(255,255,255,0.02),
        0 12px 28px rgba(0,0,0,0.15);
}


/* SEARCH */

.search-form {

    display: flex;

    gap: 7px;

    flex: 1;
}

.search-input {

    width: 320px;

    height: 36px;

    padding: 0 12px;

    border: 1px solid #303530;

    border-radius: 7px;

    outline: none;

    font-size: 10px;

    background: #0e110f;

    color: #eeeeee;

    transition: 0.2s;
}

.search-input::placeholder {

    color: #555b57;
}

.search-input:focus {

    border-color: #566151;

    box-shadow:
        0 0 0 3px rgba(183,255,69,0.04);
}


/* SEARCH BUTTON */

.search-btn {

    height: 36px;

    background: #222622;

    color: #bfc3c0;

    border: 1px solid #303530;

    padding: 0 15px;

    border-radius: 7px;

    cursor: pointer;

    font-size: 10px;

    font-weight: 600;

    transition: 0.2s;
}

.search-btn:hover {

    background: #2b302c;

    color: #ffffff;
}


/* CLEAR */

.clear-btn {

    height: 36px;

    display: inline-flex;

    align-items: center;

    padding: 0 14px;

    background: #171a18;

    color: #777d78;

    border: 1px solid #303530;

    border-radius: 7px;

    text-decoration: none;

    font-size: 10px;

    font-weight: 600;

    transition: 0.2s;
}

.clear-btn:hover {

    background: #222622;

    color: #eeeeee;
}


/* ADD */

.add-btn {

    height: 36px;

    display: inline-flex;

    align-items: center;

    justify-content: center;

    padding: 0 15px;

    background: #b7ff45;

    color: #10140d;

    border: none;

    border-radius: 7px;

    cursor: pointer;

    font-size: 10px;

    font-weight: 700;

    text-decoration: none;

    white-space: nowrap;

    box-shadow:
        0 5px 15px rgba(183,255,69,0.09);

    transition: 0.2s;
}

.add-btn:hover {

    background: #c5ff67;

    transform: translateY(-1px);
}


/* =====================================================
   TABLE CARD
===================================================== */

.table-card {

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
        0 8px 24px rgba(255,255,255,0.02),
        0 15px 35px rgba(0,0,0,0.18);
}


/* TABLE HEADER */

.table-header {

    min-height: 55px;

    padding: 0 17px;

    border-bottom: 1px solid #252925;

    display: flex;

    justify-content: space-between;

    align-items: center;
}

.table-header h2 {

    font-size: 13px;

    color: #eeeeee;

    font-weight: 600;
}

.employee-count {

    color: #666c67;

    font-size: 9px;
}


/* =====================================================
   TABLE
===================================================== */

.table-wrapper {

    overflow-x: auto;
}

table {

    width: 100%;

    border-collapse: collapse;

    min-width: 900px;
}

th {

    background: #121513;

    text-align: left;

    padding: 12px 14px;

    font-size: 8px;

    color: #666c67;

    text-transform: uppercase;

    letter-spacing: 0.6px;

    white-space: nowrap;
}

td {

    padding: 13px 14px;

    border-top: 1px solid #222622;

    font-size: 10px;

    color: #909590;

    white-space: nowrap;
}

tbody tr {

    transition: 0.2s;
}

tbody tr:hover {

    background: #181b19;
}


/* =====================================================
   EMPLOYEE DATA
===================================================== */

.employee-name {

    font-weight: 600;

    color: #e2e2e2;
}

.email {

    color: #707671;
}


/* DEPARTMENT */

.department {

    display: inline-flex;

    align-items: center;

    padding: 5px 8px;

    background: #1a2117;

    color: #b7ff45;

    border: 1px solid #303a2c;

    border-radius: 5px;

    font-size: 8px;

    font-weight: 600;
}


/* SALARY */

.salary {

    font-weight: 600;

    color: #d5d8d6;
}


/* =====================================================
   ACTION BUTTONS
===================================================== */

.actions {

    display: flex;

    gap: 6px;
}

.profile-btn,
.edit-btn,
.delete-btn {

    border: none;

    height: 28px;

    padding: 0 9px;

    border-radius: 5px;

    cursor: pointer;

    font-size: 8px;

    font-weight: 600;

    text-decoration: none;

    display: inline-flex;

    align-items: center;

    justify-content: center;

    transition: 0.2s;
}


/* VIEW */

.profile-btn {

    background: rgba(74,222,128,0.08);

    color: #4ade80;

    border: 1px solid rgba(74,222,128,0.15);
}

.profile-btn:hover {

    background: rgba(74,222,128,0.15);
}


/* EDIT */

.edit-btn {

    background: rgba(183,255,69,0.07);

    color: #b7ff45;

    border: 1px solid rgba(183,255,69,0.14);
}

.edit-btn:hover {

    background: rgba(183,255,69,0.14);
}


/* DELETE */

.delete-btn {

    background: rgba(255,92,92,0.07);

    color: #ff7070;

    border: 1px solid rgba(255,92,92,0.14);
}

.delete-btn:hover {

    background: rgba(255,92,92,0.14);
}


/* =====================================================
   EMPTY DATA
===================================================== */

.empty-message {

    padding: 40px;

    text-align: center;

    color: #666c67;

    font-size: 10px;
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 1000px) {

    .sidebar {

        width: 205px;

        min-width: 205px;
    }

    .main {

        margin-left: 205px;

        width: calc(100% - 205px);

        padding: 20px;
    }

    .toolbar {

        flex-wrap: wrap;
    }

    .search-input {

        width: 250px;
    }
}


@media (max-width: 700px) {

    .container {

        display: block;
    }

    .sidebar {

        position: relative;

        width: 100%;

        min-width: 100%;

        height: auto;

        min-height: auto;

        padding-bottom: 70px;
    }

    .main {

        margin-left: 0;

        width: 100%;

        padding: 20px 15px;
    }

    .topbar {

        display: block;

        padding-bottom: 15px;
    }

    .admin-info {

        margin-top: 14px;
    }

    .toolbar {

        display: block;
    }

    .search-form {

        display: block;
    }

    .search-input,
    .search-btn,
    .clear-btn {

        width: 100%;

        display: flex;

        margin-bottom: 8px;

        justify-content: center;
    }

    .add-btn {

        width: 100%;

        display: flex;

        text-align: center;
    }

    .logout {

        position: absolute;

        left: 13px;

        right: 13px;

        bottom: 18px;
    }
}

</style>

</head>


<body>


<div class="container">


    <!-- =================================================
         SIDEBAR
    ================================================== -->

    <aside class="sidebar">


        <div class="logo">

            Employee<span>MS</span>

        </div>


        <div class="menu">


            <div class="menu-title">
                Main
            </div>


            <a
                href="${pageContext.request.contextPath}/admin">

                Dashboard

            </a>


            <a
                href="${pageContext.request.contextPath}/departments">

                Departments

            </a>


            <a
                href="${pageContext.request.contextPath}/leave-types">

                Leave Types

            </a>



            <div class="menu-title">
                Management
            </div>


            <a
                href="${pageContext.request.contextPath}/employees"
                class="active">

                Employees

            </a>


            <a
                href="${pageContext.request.contextPath}/leave/pending">

                Leave Requests

            </a>


            <a
                href="${pageContext.request.contextPath}/payroll">

                Payroll

            </a>



            <div class="menu-title">
                Reports
            </div>


            <a href="#">

                Reports

            </a>


        </div>


        <div class="logout">

            <a
                href="${pageContext.request.contextPath}/logout">

                Logout

            </a>

        </div>


    </aside>



    <!-- =================================================
         MAIN
    ================================================== -->

    <main class="main">


        <!-- TOP BAR -->

        <div class="topbar">


            <div class="page-title">

                <h1>
                    Employees
                </h1>

                <p>
                    View and manage all employees.
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



        <!-- =================================================
             TOOLBAR
        ================================================== -->

        <div class="toolbar">


            <form
                action="${pageContext.request.contextPath}/employees/search"
                method="get"
                class="search-form">


                <input
                    type="text"
                    name="keyword"
                    class="search-input"
                    placeholder="Search by name, email or mobile..."
                    required>


                <button
                    type="submit"
                    class="search-btn">

                    Search

                </button>


                <a
                    href="${pageContext.request.contextPath}/employees"
                    class="clear-btn">

                    Clear

                </a>


            </form>


            <a
                href="${pageContext.request.contextPath}/employees/add"
                class="add-btn">

                + Add Employee

            </a>


        </div>



        <!-- =================================================
             EMPLOYEE TABLE
        ================================================== -->

        <div class="table-card">


            <div class="table-header">


                <h2>
                    Employee List
                </h2>


                <span class="employee-count">

                    Total: ${employees.size()}
                    Employees

                </span>


            </div>



            <div class="table-wrapper">


                <table>


                    <thead>

                        <tr>

                            <th>
                                ID
                            </th>

                            <th>
                                Employee
                            </th>

                            <th>
                                Email
                            </th>

                            <th>
                                Mobile
                            </th>

                            <th>
                                Department ID
                            </th>

                            <th>
                                Manager ID
                            </th>

                            <th>
                                Joining Date
                            </th>

                            <th>
                                Basic Salary
                            </th>

                            <th>
                                Actions
                            </th>

                        </tr>

                    </thead>


                    <tbody>


                        <c:forEach
                            var="employee"
                            items="${employees}">


                            <tr>


                                <td>
                                    ${employee.id}
                                </td>


                                <td class="employee-name">

                                    ${employee.name}

                                </td>


                                <td class="email">

                                    ${employee.email}

                                </td>


                                <td>

                                    ${employee.mobile}

                                </td>


                                <td>


                                    <span class="department">

                                        ${employee.deptId}

                                    </span>


                                </td>


                                <td>


                                    <c:choose>


                                        <c:when
                                            test="${employee.managerId != null}">

                                            ${employee.managerId}

                                        </c:when>


                                        <c:otherwise>

                                            -

                                        </c:otherwise>


                                    </c:choose>


                                </td>


                                <td>

                                    ${employee.joiningDate}

                                </td>


                                <td class="salary">

                                    ₹ ${employee.basicSalary}

                                </td>


                                <td>


                                    <div class="actions">


                                        <!-- VIEW -->

                                        <a
                                            href="${pageContext.request.contextPath}/employees/profile?id=${employee.id}"
                                            class="profile-btn">

                                            View

                                        </a>



                                        <!-- EDIT -->

                                        <a
                                            href="${pageContext.request.contextPath}/employees/edit?id=${employee.id}"
                                            class="edit-btn">

                                            Edit

                                        </a>



                                        <!-- DELETE -->

                                        <button
                                            type="button"
                                            class="delete-btn"
                                            onclick="deleteEmployee(${employee.id})">

                                            Delete

                                        </button>


                                    </div>


                                </td>


                            </tr>


                        </c:forEach>


                    </tbody>


                </table>


            </div>



            <!-- NO EMPLOYEE -->

            <c:if test="${empty employees}">

                <div class="empty-message">

                    No employees found.

                </div>

            </c:if>


        </div>


    </main>


</div>



<!-- =====================================================
     JAVASCRIPT
===================================================== -->

<script>

function deleteEmployee(id) {

    const confirmation = confirm(
        "Are you sure you want to delete Employee ID " + id + "?"
    );

    if (confirmation) {

        window.location.href =
            "${pageContext.request.contextPath}/employees/delete?id=" + id;

    }
}

</script>


</body>

</html>