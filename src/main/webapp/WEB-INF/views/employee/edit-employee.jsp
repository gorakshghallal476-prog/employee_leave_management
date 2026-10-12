<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
    content="width=device-width, initial-scale=1.0">

<title>Edit Employee | Employee Management System</title>

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

.container {

    min-height: 100vh;

    display: flex;

    align-items: center;

    justify-content: center;

    padding: 30px;

    background:
        radial-gradient(
            circle at 50% 0%,
            rgba(255,255,255,0.025),
            transparent 35%
        );
}


/* =====================================================
   FORM CARD
===================================================== */

.form-card {

    width: 760px;

    max-width: 100%;

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    padding: 30px;

    border-radius: 11px;

    border: 1px solid #292d2a;

    box-shadow:
        0 10px 30px rgba(0,0,0,0.35),
        0 0 35px rgba(255,255,255,0.02);
}


/* =====================================================
   HEADER
===================================================== */

.header {

    margin-bottom: 25px;

    padding-bottom: 18px;

    border-bottom: 1px solid #292d2a;
}

.header-top {

    display: flex;

    justify-content: space-between;

    align-items: flex-start;

    gap: 15px;
}

.header h1 {

    font-size: 21px;

    margin-bottom: 6px;

    color: #eeeeee;

    font-weight: 650;

    letter-spacing: -0.4px;
}

.header p {

    color: #666c67;

    font-size: 10px;
}

.employee-badge {

    display: inline-flex;

    align-items: center;

    gap: 6px;

    padding: 7px 10px;

    background: #1a2117;

    border: 1px solid #303a2c;

    border-radius: 6px;

    color: #b7ff45;

    font-size: 9px;

    font-weight: 600;

    white-space: nowrap;
}

.employee-badge-dot {

    width: 6px;

    height: 6px;

    background: #b7ff45;

    border-radius: 50%;

    box-shadow:
        0 0 7px rgba(183,255,69,0.5);
}


/* =====================================================
   FORM ROW
===================================================== */

.form-row {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 18px;
}

.form-group {

    margin-bottom: 18px;
}


/* =====================================================
   LABEL
===================================================== */

.form-group label {

    display: block;

    margin-bottom: 7px;

    font-size: 10px;

    font-weight: 600;

    color: #9da29e;
}


/* =====================================================
   INPUT + SELECT
===================================================== */

.form-group input,
.form-group select {

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

.form-group input::placeholder {

    color: #555b57;
}

.form-group input:focus,
.form-group select:focus {

    border-color: #566151;

    box-shadow:
        0 0 0 3px rgba(183,255,69,0.045);
}


/* SELECT */

.form-group select {

    cursor: pointer;

    appearance: none;

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

.form-group select option {

    background: #151817;

    color: #eeeeee;
}


/* =====================================================
   EMPLOYEE ID
===================================================== */

.employee-id {

    background: #171a18 !important;

    color: #777d78 !important;

    border-color: #292d2a !important;

    cursor: not-allowed;

    font-family: monospace;

    font-size: 11px !important;
}


/* =====================================================
   BUTTONS
===================================================== */

.buttons {

    display: flex;

    justify-content: flex-end;

    gap: 9px;

    margin-top: 8px;

    padding-top: 20px;

    border-top: 1px solid #292d2a;
}

.btn {

    height: 38px;

    padding: 0 17px;

    border-radius: 7px;

    font-size: 10px;

    font-weight: 600;

    cursor: pointer;

    text-decoration: none;

    border: none;

    display: inline-flex;

    align-items: center;

    justify-content: center;

    transition: 0.2s;
}


/* CANCEL */

.cancel-btn {

    background: #222622;

    color: #9a9f9b;

    border: 1px solid #303530;
}

.cancel-btn:hover {

    background: #292e2a;

    color: #eeeeee;
}


/* UPDATE */

.update-btn {

    background: #b7ff45;

    color: #10140d;

    box-shadow:
        0 5px 15px rgba(183,255,69,0.10);
}

.update-btn:hover {

    background: #c5ff67;

    transform: translateY(-1px);

    box-shadow:
        0 7px 18px rgba(183,255,69,0.15);
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 700px) {

    .form-card {

        width: 100%;

        padding: 23px 20px;
    }

    .form-row {

        grid-template-columns: 1fr;

        gap: 0;
    }

    .container {

        padding: 15px;
    }

    .header-top {

        flex-direction: column;
    }

    .employee-badge {

        align-self: flex-start;
    }

    .buttons {

        flex-direction: column;
    }

    .btn {

        width: 100%;
    }
}

</style>

</head>


<body>


<div class="container">


    <div class="form-card">


        <!-- HEADER -->

        <div class="header">

            <div class="header-top">


                <div>

                    <h1>
                        Edit Employee
                    </h1>

                    <p>
                        Update the employee information below.
                    </p>

                </div>


                <div class="employee-badge">

                    <span class="employee-badge-dot"></span>

                    Employee #${employee.id}

                </div>


            </div>

        </div>



        <!-- FORM -->

        <form
            action="${pageContext.request.contextPath}/employees/update"
            method="post">


            <!-- Hidden Employee ID -->

            <input
                type="hidden"
                name="id"
                value="${employee.id}">



            <!-- Employee ID -->

            <div class="form-group">

                <label>
                    Employee ID
                </label>

                <input
                    type="text"
                    value="${employee.id}"
                    class="employee-id"
                    readonly>

            </div>



            <!-- NAME + EMAIL -->

            <div class="form-row">


                <div class="form-group">

                    <label>
                        Employee Name
                    </label>

                    <input
                        type="text"
                        name="name"
                        value="${employee.name}"
                        placeholder="Enter employee name"
                        required>

                </div>



                <div class="form-group">

                    <label>
                        Email
                    </label>

                    <input
                        type="email"
                        name="email"
                        value="${employee.email}"
                        placeholder="Enter email address"
                        required>

                </div>


            </div>



            <!-- MOBILE + DEPARTMENT -->

            <div class="form-row">


                <div class="form-group">

                    <label>
                        Mobile Number
                    </label>

                    <input
                        type="text"
                        name="mobile"
                        value="${employee.mobile}"
                        placeholder="Enter mobile number"
                        required>

                </div>



                <div class="form-group">

                    <label>
                        Department
                    </label>

                    <select
                        name="deptId"
                        required>

                        <option value="">
                            Select Department
                        </option>


                        <c:forEach
                            var="department"
                            items="${departments}">


                            <option
                                value="${department.id}"

                                <c:if test="${department.id == employee.deptId}">
                                    selected
                                </c:if>>

                                ${department.deptName}

                            </option>


                        </c:forEach>


                    </select>

                </div>


            </div>



            <!-- MANAGER + JOINING DATE -->

            <div class="form-row">


                <div class="form-group">

                    <label>
                        Manager ID
                    </label>

                    <input
                        type="number"
                        name="managerId"
                        value="${employee.managerId}"
                        placeholder="Enter manager ID">

                </div>



                <div class="form-group">

                    <label>
                        Joining Date
                    </label>

                    <input
                        type="date"
                        name="joiningDate"
                        value="${employee.joiningDate}"
                        required>

                </div>


            </div>



            <!-- SALARY -->

            <div class="form-group">

                <label>
                    Basic Salary
                </label>

                <input
                    type="number"
                    name="basicSalary"
                    value="${employee.basicSalary}"
                    placeholder="Enter basic salary"
                    min="0"
                    step="0.01"
                    required>

            </div>



            <!-- BUTTONS -->

            <div class="buttons">


                <a
                    href="${pageContext.request.contextPath}/employees"
                    class="btn cancel-btn">

                    Cancel

                </a>


                <button
                    type="submit"
                    class="btn update-btn">

                    Update Employee

                </button>


            </div>


        </form>


    </div>


</div>


</body>

</html>