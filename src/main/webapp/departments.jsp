<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
    content="width=device-width, initial-scale=1.0">

<title>Departments | Employee Management System</title>

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

    color: #eeeeee;

    min-height: 100vh;
}


/* =====================================================
   MAIN CONTAINER
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

    background: #101311;

    color: white;

    padding: 22px 13px;

    position: fixed;

    top: 0;
    bottom: 0;
    left: 0;

    border-right: 1px solid #292d2a;
}


/* LOGO */

.logo {

    font-size: 16px;

    font-weight: 700;

    text-align: center;

    padding-bottom: 24px;

    border-bottom: 1px solid #292d2a;

    margin-bottom: 22px;

    color: #eeeeee;
}

.logo span {

    color: #b7ff45;
}


/* MENU TITLE */

.menu-title {

    font-size: 8px;

    color: #555b57;

    margin: 20px 9px 9px;

    text-transform: uppercase;

    letter-spacing: 1px;
}


/* MENU LINKS */

.menu a {

    display: block;

    text-decoration: none;

    color: #777d78;

    padding: 10px 12px;

    margin-bottom: 4px;

    border-radius: 6px;

    font-size: 9px;

    transition: 0.2s;
}

.menu a:hover {

    background: #191d1a;

    color: #eeeeee;
}

.menu a.active {

    background: rgba(183,255,69,0.10);

    color: #b7ff45;

    border: 1px solid rgba(183,255,69,0.14);
}


/* LOGOUT */

.logout {

    position: absolute;

    bottom: 20px;

    left: 13px;

    right: 13px;
}

.logout a {

    display: block;

    text-align: center;

    padding: 9px;

    border-radius: 6px;

    background: #191d1a;

    color: #ff6b6b;

    border: 1px solid #303530;

    text-decoration: none;

    font-size: 9px;

    transition: 0.2s;
}

.logout a:hover {

    background: #221616;

    border-color: #443030;
}


/* =====================================================
   MAIN
===================================================== */

.main {

    margin-left: 225px;

    width: calc(100% - 225px);

    padding: 25px;
}


/* =====================================================
   TOPBAR
===================================================== */

.topbar {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 18px;
}

.page-title h1 {

    font-size: 20px;

    margin-bottom: 5px;

    font-weight: 650;

    color: #eeeeee;
}

.page-title p {

    color: #666c67;

    font-size: 9px;
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

    border-radius: 7px;

    background: #b7ff45;

    color: #10140d;

    display: flex;

    justify-content: center;

    align-items: center;

    font-weight: 800;

    font-size: 11px;
}

.admin-text {

    font-size: 8px;

    color: #666c67;
}

.admin-text strong {

    display: block;

    font-size: 9px;

    color: #dddddd;

    margin-bottom: 2px;
}

.admin-text span {

    color: #555b57;
}


/* =====================================================
   ACTION BAR
===================================================== */

.action-bar {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    padding: 14px;

    border-radius: 8px;

    margin-bottom: 12px;

    display: flex;

    justify-content: space-between;

    align-items: center;

    border: 1px solid #292d2a;

    box-shadow:
        0 7px 20px rgba(255,255,255,0.015),
        0 10px 25px rgba(0,0,0,0.15);
}


/* SEARCH */

.search-box input {

    width: 280px;

    padding: 10px 12px;

    border: 1px solid #303530;

    border-radius: 6px;

    outline: none;

    font-size: 9px;

    background: #0d100e;

    color: #eeeeee;

    transition: 0.2s;
}

.search-box input::placeholder {

    color: #505651;
}

.search-box input:focus {

    border-color: #b7ff45;

    box-shadow:
        0 0 0 2px rgba(183,255,69,0.05);
}


/* ADD BUTTON */

.add-btn {

    background: #b7ff45;

    color: #10140d;

    border: none;

    padding: 10px 14px;

    border-radius: 6px;

    cursor: pointer;

    font-size: 9px;

    font-weight: 700;

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

    border-radius: 8px;

    border: 1px solid #292d2a;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.015),
        0 15px 30px rgba(0,0,0,0.16);

    overflow: hidden;
}


/* TABLE HEADER */

.table-header {

    padding: 15px 17px;

    border-bottom: 1px solid #292d2a;
}

.table-header h2 {

    font-size: 12px;

    color: #eeeeee;

    font-weight: 600;
}


/* =====================================================
   TABLE
===================================================== */

table {

    width: 100%;

    border-collapse: collapse;
}

th {

    background: #121513;

    text-align: left;

    padding: 12px 17px;

    font-size: 8px;

    color: #666c67;

    text-transform: uppercase;

    letter-spacing: 0.6px;

    border-bottom: 1px solid #292d2a;
}

td {

    padding: 13px 17px;

    border-top: 1px solid #252925;

    font-size: 9px;

    color: #999e9a;
}

tr:hover {

    background: #181b19;
}

.department-name {

    font-weight: 600;

    color: #dddddd;
}

.description {

    color: #666c67;
}

.employee-count {

    font-weight: 600;

    color: #b8bdb9;
}


/* STATUS */

.status {

    display: inline-block;

    padding: 5px 9px;

    border-radius: 5px;

    font-size: 8px;

    font-weight: 700;

    background: rgba(74,222,128,0.10);

    color: #4ade80;

    border: 1px solid rgba(74,222,128,0.18);
}


/* =====================================================
   ACTIONS
===================================================== */

.actions {

    display: flex;

    gap: 7px;
}

.edit-btn,
.delete-btn {

    border: none;

    padding: 7px 10px;

    border-radius: 5px;

    cursor: pointer;

    font-size: 8px;

    text-decoration: none;

    transition: 0.2s;
}


/* EDIT */

.edit-btn {

    background: rgba(183,255,69,0.08);

    color: #b7ff45;

    border: 1px solid rgba(183,255,69,0.15);
}

.edit-btn:hover {

    background: rgba(183,255,69,0.14);
}


/* DELETE */

.delete-btn {

    background: rgba(255,92,92,0.08);

    color: #ff5c5c;

    border: 1px solid rgba(255,92,92,0.15);
}

.delete-btn:hover {

    background: rgba(255,92,92,0.14);
}


/* =====================================================
   MODAL
===================================================== */

.modal {

    display: none;

    position: fixed;

    z-index: 1000;

    left: 0;

    top: 0;

    width: 100%;

    height: 100%;

    background: rgba(0,0,0,0.72);

    align-items: center;

    justify-content: center;

    backdrop-filter: blur(3px);
}


/* MODAL CONTENT */

.modal-content {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    width: 420px;

    max-width: calc(100% - 30px);

    padding: 22px;

    border-radius: 8px;

    border: 1px solid #303530;

    box-shadow:
        0 15px 45px rgba(0,0,0,0.40);
}

.modal-content h2 {

    margin-bottom: 20px;

    font-size: 15px;

    color: #eeeeee;

    font-weight: 650;
}


/* FORM */

.form-group {

    margin-bottom: 14px;
}

.form-group label {

    display: block;

    margin-bottom: 6px;

    font-size: 9px;

    font-weight: 600;

    color: #b8bdb9;
}

.form-group input,
.form-group textarea {

    width: 100%;

    padding: 10px 11px;

    border: 1px solid #303530;

    border-radius: 6px;

    font-size: 9px;

    outline: none;

    background: #0d100e;

    color: #eeeeee;
}

.form-group input::placeholder,
.form-group textarea::placeholder {

    color: #505651;
}

.form-group input:focus,
.form-group textarea:focus {

    border-color: #b7ff45;

    box-shadow:
        0 0 0 2px rgba(183,255,69,0.05);
}

.form-group textarea {

    height: 90px;

    resize: vertical;
}


/* MODAL ACTIONS */

.form-actions {

    display: flex;

    justify-content: flex-end;

    gap: 8px;

    margin-top: 20px;
}

.cancel-btn,
.save-btn {

    border: none;

    padding: 9px 13px;

    border-radius: 6px;

    cursor: pointer;

    font-size: 9px;

    font-weight: 700;
}

.cancel-btn {

    background: #252a27;

    color: #b8bdb9;

    border: 1px solid #343a36;
}

.cancel-btn:hover {

    background: #303631;
}

.save-btn {

    background: #b7ff45;

    color: #10140d;
}

.save-btn:hover {

    background: #c5ff67;
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 900px) {

    .sidebar {

        width: 205px;
    }

    .main {

        margin-left: 205px;

        width: calc(100% - 205px);

        padding: 20px;
    }

    .search-box input {

        width: 220px;
    }
}


@media (max-width: 700px) {

    .sidebar {

        position: relative;

        width: 100%;

        min-height: auto;
    }

    .logout {

        position: static;

        margin-top: 20px;
    }

    .container {

        display: block;
    }

    .main {

        margin-left: 0;

        width: 100%;
    }

    .topbar {

        display: block;
    }

    .admin-info {

        margin-top: 15px;
    }

    .action-bar {

        display: block;
    }

    .search-box input {

        width: 100%;

        margin-bottom: 10px;
    }

    .add-btn {

        width: 100%;
    }

    .table-card {

        overflow-x: auto;
    }

    table {

        min-width: 800px;
    }
}

</style>

</head>


<body>


<div class="container">


    <!-- ================= SIDEBAR ================= -->

    <aside class="sidebar">


        <div class="logo">

            Employee<span>MS</span>

        </div>


        <div class="menu">


            <div class="menu-title">
                Main
            </div>


            <a
                href="${pageContext.request.contextPath}/admin/dashboard">

                Dashboard

            </a>


            <a
                href="${pageContext.request.contextPath}/departments"
                class="active">

                Departments

            </a>


            <a
                href="${pageContext.request.contextPath}/admin/leave-types">

                Leave Types

            </a>


            <div class="menu-title">
                Management
            </div>


            <a
                href="${pageContext.request.contextPath}/employees">

                Employees

            </a>


            <a
                href="${pageContext.request.contextPath}/leave/requests">

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



    <!-- ================= MAIN CONTENT ================= -->

    <main class="main">


        <!-- TOP BAR -->

        <div class="topbar">


            <div class="page-title">

                <h1>
                    Departments
                </h1>

                <p>
                    Manage and organize employee departments.
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



        <!-- ACTION BAR -->

        <div class="action-bar">


            <div class="search-box">

                <input
                    type="text"
                    placeholder="Search department..."
                    id="searchInput"
                    onkeyup="searchDepartment()">

            </div>


            <button
                class="add-btn"
                onclick="addDepartment()">

                + Add Department

            </button>


        </div>



        <!-- DEPARTMENT TABLE -->

        <div class="table-card">


            <div class="table-header">

                <h2>
                    Department List
                </h2>

            </div>


            <table id="departmentTable">


                <thead>

                    <tr>

                        <th>
                            ID
                        </th>

                        <th>
                            Department
                        </th>

                        <th>
                            Description
                        </th>

                        <th>
                            Employees
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
                        var="department"
                        items="${departments}">


                        <tr>


                            <td>
                                ${department.id}
                            </td>


                            <td class="department-name">
                                ${department.deptName}
                            </td>


                            <td class="description">
                                ${department.description}
                            </td>


                            <td class="employee-count">
                                0
                            </td>


                            <td>

                                <span class="status">
                                    Active
                                </span>

                            </td>


                            <td>


                                <div class="actions">


                                    <a
                                        href="${pageContext.request.contextPath}/departments/edit?id=${department.id}"
                                        class="edit-btn">

                                        Edit

                                    </a>


                                    <button
                                        class="delete-btn"
                                        onclick="deleteDepartment(${department.id})">

                                        Delete

                                    </button>


                                </div>


                            </td>


                        </tr>


                    </c:forEach>


                </tbody>


            </table>


        </div>



        <!-- ================= ADD DEPARTMENT MODAL ================= -->

        <div
            class="modal"
            id="departmentModal">


            <div class="modal-content">


                <h2>
                    Add Department
                </h2>


                <form
                    action="${pageContext.request.contextPath}/departments/add"
                    method="post">


                    <div class="form-group">

                        <label>
                            Department Name
                        </label>

                        <input
                            type="text"
                            name="deptName"
                            placeholder="Enter department name"
                            required>

                    </div>


                    <div class="form-group">

                        <label>
                            Description
                        </label>

                        <textarea
                            name="description"
                            placeholder="Enter department description"
                            required></textarea>

                    </div>


                    <div class="form-actions">


                        <button
                            type="button"
                            class="cancel-btn"
                            onclick="closeDepartmentModal()">

                            Cancel

                        </button>


                        <button
                            type="submit"
                            class="save-btn">

                            Save Department

                        </button>


                    </div>


                </form>


            </div>


        </div>


    </main>


</div>



<script>


/* ================= SEARCH ================= */

function searchDepartment() {

    let input =
        document.getElementById("searchInput")
            .value.toLowerCase();

    let table =
        document.getElementById("departmentTable");

    let rows =
        table.getElementsByTagName("tr");

    for (let i = 1; i < rows.length; i++) {

        let department =
            rows[i]
                .getElementsByTagName("td")[1];

        if (department) {

            let text =
                department.textContent.toLowerCase();

            rows[i].style.display =
                text.includes(input) ? "" : "none";
        }
    }
}


/* ================= ADD DEPARTMENT ================= */

function addDepartment() {

    document.getElementById(
        "departmentModal"
    ).style.display = "flex";
}


/* ================= CLOSE MODAL ================= */

function closeDepartmentModal() {

    document.getElementById(
        "departmentModal"
    ).style.display = "none";
}


/* ================= DELETE DEPARTMENT ================= */

function deleteDepartment(id) {

    let confirmDelete =
        confirm(
            "Are you sure you want to delete this department?"
        );

    if (confirmDelete) {

        window.location.href =
            "${pageContext.request.contextPath}/departments/delete?id="
            + id;
    }
}

</script>


</body>

</html>