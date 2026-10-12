<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Salary Slip</title>

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


/* =====================================================
   BODY
===================================================== */

body {

    background: #0b0d0c;

    color: #eeeeee;

    min-height: 100vh;

    padding: 30px 20px;
}


/* =====================================================
   CONTAINER
===================================================== */

.container {

    width: 900px;

    max-width: 95%;

    margin: 0 auto;
}


/* =====================================================
   HEADER
===================================================== */

.header {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    color: #eeeeee;

    padding: 21px 22px;

    border-radius: 9px 9px 0 0;

    border: 1px solid #292d2a;

    border-bottom: none;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02),
        0 15px 35px rgba(0,0,0,0.18);
}

.header h1 {

    font-size: 20px;

    margin-bottom: 7px;

    font-weight: 650;
}

.header p {

    color: #666c67;

    font-size: 9px;
}


/* =====================================================
   SALARY CARD
===================================================== */

.salary-card {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    padding: 25px;

    border-radius: 0 0 9px 9px;

    border: 1px solid #292d2a;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02),
        0 15px 35px rgba(0,0,0,0.18);
}


/* =====================================================
   EMPLOYEE INFORMATION
===================================================== */

.employee-info {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 10px;

    margin-bottom: 24px;
}

.info-box {

    background: #101311;

    border: 1px solid #292e2b;

    padding: 13px;

    border-radius: 6px;
}

.info-box label {

    display: block;

    font-size: 8px;

    color: #666c67;

    margin-bottom: 6px;

    text-transform: uppercase;

    letter-spacing: 0.5px;
}

.info-box span {

    font-weight: 600;

    color: #dddddd;

    font-size: 10px;
}


/* =====================================================
   SALARY DETAILS HEADING
===================================================== */

.salary-card h3 {

    color: #eeeeee;

    font-size: 13px;

    font-weight: 600;

    margin-bottom: 10px;
}


/* =====================================================
   SALARY TABLE
===================================================== */

.salary-table {

    width: 100%;

    border-collapse: collapse;

    margin-top: 10px;
}

.salary-table th,
.salary-table td {

    padding: 12px 13px;

    border: 1px solid #292e2b;

    text-align: left;
}

.salary-table th {

    background: #121513;

    color: #666c67;

    font-size: 8px;

    text-transform: uppercase;

    letter-spacing: 0.5px;
}

.salary-table td {

    color: #a2a7a3;

    font-size: 9px;
}

.salary-table tbody tr:hover {

    background: #181b19;
}

.salary-table td:last-child,
.salary-table th:last-child {

    text-align: right;
}


/* =====================================================
   NET SALARY
===================================================== */

.net-salary {

    margin-top: 18px;

    padding: 16px 18px;

    background: #101311;

    border: 1px solid #303630;

    border-radius: 7px;

    display: flex;

    justify-content: space-between;

    align-items: center;
}

.net-salary span:first-child {

    font-size: 11px;

    font-weight: 700;

    color: #dddddd;
}

.net-amount {

    font-size: 18px;

    font-weight: 700;

    color: #b7ff45;
}


/* =====================================================
   ACTIONS
===================================================== */

.actions {

    margin-top: 20px;

    display: flex;

    gap: 10px;
}

.btn {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    padding: 9px 14px;

    border-radius: 6px;

    text-decoration: none;

    font-size: 9px;

    font-weight: 700;

    border: none;

    cursor: pointer;

    transition: 0.2s;
}


/* PRIMARY BUTTON */

.btn-primary {

    background: #b7ff45;

    color: #10140d;

    box-shadow:
        0 5px 15px rgba(183,255,69,0.07);
}

.btn-primary:hover {

    background: #c5ff67;

    transform: translateY(-1px);
}


/* SECONDARY BUTTON */

.btn-secondary {

    background: #252a27;

    color: #b8bdb9;

    border: 1px solid #343a36;
}

.btn-secondary:hover {

    background: #303631;

    color: #eeeeee;

    transform: translateY(-1px);
}


/* =====================================================
   EMPTY STATE
===================================================== */

.empty {

    text-align: center;

    padding: 50px 20px;

    color: #666c67;
}

.empty h2 {

    color: #dddddd;

    margin-bottom: 10px;

    font-size: 16px;
}

.empty p {

    font-size: 9px;

    margin-bottom: 5px;
}


/* =====================================================
   PRINT
===================================================== */

@media print {

    .actions {

        display: none;
    }

    body {

        background: white;

        color: black;

        padding: 0;
    }

    .container {

        width: 100%;

        max-width: 100%;

        margin: 0;
    }

    .header {

        background: white;

        color: black;

        border: 1px solid #ddd;
    }

    .header h1 {

        color: black;
    }

    .header p {

        color: #555;
    }

    .salary-card {

        background: white;

        color: black;

        border: 1px solid #ddd;

        box-shadow: none;
    }

    .info-box {

        background: white;

        border: 1px solid #ddd;
    }

    .info-box label {

        color: #666;
    }

    .info-box span {

        color: #111;
    }

    .salary-card h3 {

        color: #111;
    }

    .salary-table th {

        background: #f3f3f3;

        color: #333;
    }

    .salary-table td {

        color: #222;
    }

    .net-salary {

        background: #f5f5f5;

        border: 1px solid #ddd;
    }

    .net-salary span:first-child {

        color: #111;
    }

    .net-amount {

        color: #111;
    }
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 700px) {

    body {

        padding: 15px 10px;
    }

    .container {

        max-width: 100%;
    }

    .employee-info {

        grid-template-columns: 1fr;
    }

    .salary-card {

        padding: 18px;
    }

    .net-salary {

        flex-direction: column;

        align-items: flex-start;

        gap: 8px;
    }

    .actions {

        flex-direction: column;
    }

    .btn {

        width: 100%;

        text-align: center;
    }
}

</style>

</head>


<body>


<div class="container">


    <div class="header">

        <h1>
            Salary Slip
        </h1>

        <p>
            Employee Management & Leave Management System
        </p>

    </div>



    <div class="salary-card">


        <c:choose>


            <c:when test="${not empty payroll}">


                <div class="employee-info">


                    <div class="info-box">

                        <label>
                            Employee ID
                        </label>

                        <span>
                            ${payroll.employeeId}
                        </span>

                    </div>



                    <div class="info-box">

                        <label>
                            Pay Month
                        </label>

                        <span>
                            ${payroll.payMonth}
                        </span>

                    </div>



                    <div class="info-box">

                        <label>
                            Payment Date
                        </label>

                        <span>
                            ${payroll.paymentDate}
                        </span>

                    </div>



                    <div class="info-box">

                        <label>
                            Payroll ID
                        </label>

                        <span>
                            ${payroll.id}
                        </span>

                    </div>


                </div>



                <h3>
                    Salary Details
                </h3>



                <table class="salary-table">


                    <thead>

                        <tr>

                            <th>
                                Description
                            </th>

                            <th>
                                Amount
                            </th>

                        </tr>

                    </thead>



                    <tbody>


                        <tr>

                            <td>
                                Basic Pay
                            </td>

                            <td>
                                ₹ ${payroll.basicPay}
                            </td>

                        </tr>



                        <tr>

                            <td>
                                LOP Days
                            </td>

                            <td>
                                ${payroll.lopDays}
                            </td>

                        </tr>



                        <tr>

                            <td>
                                Deductions
                            </td>

                            <td>
                                ₹ ${payroll.deductions}
                            </td>

                        </tr>


                    </tbody>


                </table>



                <div class="net-salary">

                    <span>
                        Net Salary
                    </span>

                    <span class="net-amount">
                        ₹ ${payroll.netSalary}
                    </span>

                </div>



                <div class="actions">


                    <c:if test="${not empty employeeId}">

                        <a
                            href="${pageContext.request.contextPath}/payroll/history?employeeId=${employeeId}"
                            class="btn btn-secondary">

                            ← Salary History

                        </a>

                    </c:if>



                    <button
                        onclick="window.print()"
                        class="btn btn-primary">

                        Print Salary Slip

                    </button>


                </div>


            </c:when>



            <c:otherwise>


                <div class="empty">

                    <h2>
                        No Salary Slip Available
                    </h2>

                    <p>
                        No payroll record was found for this employee.
                    </p>


                    <br>


                    <c:if test="${not empty employeeId}">

                        <a
                            href="${pageContext.request.contextPath}/payroll/history?employeeId=${employeeId}"
                            class="btn btn-secondary">

                            ← Salary History

                        </a>

                    </c:if>


                </div>


            </c:otherwise>


        </c:choose>


    </div>


</div>


</body>

</html>