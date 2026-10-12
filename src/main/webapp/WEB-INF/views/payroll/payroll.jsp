<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Payroll Management</title>

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

    max-width: 1200px;

    margin: auto;
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

    padding: 21px 22px;

    border-radius: 9px;

    margin-bottom: 18px;

    border: 1px solid #292d2a;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02),
        0 15px 35px rgba(0,0,0,0.18);
}

h2 {

    color: #eeeeee;

    margin-bottom: 7px;

    font-size: 20px;

    font-weight: 650;
}

.subtitle {

    color: #666c67;

    font-size: 9px;

    margin-bottom: 17px;
}


/* =====================================================
   ADD BUTTON
===================================================== */

.add-btn {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    padding: 9px 14px;

    background: #b7ff45;

    color: #10140d;

    text-decoration: none;

    border-radius: 6px;

    font-size: 9px;

    font-weight: 700;

    transition: 0.2s;

    box-shadow:
        0 5px 15px rgba(183,255,69,0.07);
}

.add-btn:hover {

    background: #c5ff67;

    transform: translateY(-1px);
}


/* =====================================================
   TABLE CARD
===================================================== */

.card {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    padding: 0;

    border-radius: 9px;

    border: 1px solid #292d2a;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02),
        0 15px 35px rgba(0,0,0,0.18);

    overflow-x: auto;
}


/* =====================================================
   TABLE
===================================================== */

table {

    width: 100%;

    border-collapse: collapse;

    min-width: 950px;
}


/* =====================================================
   TABLE HEADER
===================================================== */

th {

    background: #121513;

    color: #666c67;

    padding: 13px 14px;

    text-align: left;

    font-size: 8px;

    font-weight: 600;

    text-transform: uppercase;

    letter-spacing: 0.6px;

    border-bottom: 1px solid #292d2a;
}


/* =====================================================
   TABLE DATA
===================================================== */

td {

    padding: 13px 14px;

    color: #999e9a;

    font-size: 9px;

    border-bottom: 1px solid #252925;
}

tbody tr {

    transition: 0.2s;
}

tbody tr:hover {

    background: #181b19;
}


/* =====================================================
   IMPORTANT VALUES
===================================================== */

td:first-child {

    color: #dddddd;

    font-weight: 600;
}

.salary {

    color: #b7ff45 !important;

    font-weight: 700;
}


/* =====================================================
   SALARY SLIP BUTTON
===================================================== */

.view-btn {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    padding: 8px 11px;

    background: #252a27;

    color: #b7ff45;

    border: 1px solid #394039;

    text-decoration: none;

    border-radius: 6px;

    font-size: 8px;

    font-weight: 700;

    white-space: nowrap;

    transition: 0.2s;
}

.view-btn:hover {

    background: #303631;

    border-color: #4a514b;

    transform: translateY(-1px);
}


/* =====================================================
   EMPTY
===================================================== */

.empty {

    text-align: center;

    padding: 35px;

    color: #666c67;

    font-size: 10px;
}


/* =====================================================
   BACK BUTTON
===================================================== */

.back-btn {

    display: inline-flex;

    align-items: center;

    margin-top: 18px;

    padding: 9px 14px;

    background: #252a27;

    color: #b8bdb9;

    border: 1px solid #343a36;

    text-decoration: none;

    border-radius: 6px;

    font-size: 9px;

    font-weight: 700;

    transition: 0.2s;
}

.back-btn:hover {

    background: #303631;

    color: #eeeeee;

    transform: translateY(-1px);
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 900px) {

    body {

        padding: 15px 10px;
    }

    .header {

        padding: 18px;
    }

    .card {

        overflow-x: auto;
    }

    table {

        min-width: 950px;
    }
}

</style>

</head>


<body>


<div class="container">


    <!-- Header -->

    <div class="header">

        <h2>
            Payroll Management
        </h2>

        <p class="subtitle">
            Employee Salary and Payroll Records
        </p>

        <a
            href="${pageContext.request.contextPath}/payroll/add"
            class="add-btn">

            + Add Payroll

        </a>

    </div>



    <!-- Payroll Table -->

    <div class="card">


        <table>


            <thead>

                <tr>

                    <th>
                        ID
                    </th>

                    <th>
                        Employee ID
                    </th>

                    <th>
                        Pay Month
                    </th>

                    <th>
                        Basic Pay
                    </th>

                    <th>
                        LOP Days
                    </th>

                    <th>
                        Deductions
                    </th>

                    <th>
                        Net Salary
                    </th>

                    <th>
                        Payment Date
                    </th>

                    <th>
                        Action
                    </th>

                </tr>

            </thead>



            <tbody>


                <c:choose>


                    <c:when test="${not empty payrolls}">


                        <c:forEach
                            var="payroll"
                            items="${payrolls}">


                            <tr>


                                <td>
                                    ${payroll.id}
                                </td>


                                <td>
                                    ${payroll.employeeId}
                                </td>


                                <td>
                                    ${payroll.payMonth}
                                </td>


                                <td>
                                    ₹${payroll.basicPay}
                                </td>


                                <td>
                                    ${payroll.lopDays}
                                </td>


                                <td>
                                    ₹${payroll.deductions}
                                </td>


                                <td class="salary">
                                    ₹${payroll.netSalary}
                                </td>


                                <td>
                                    ${payroll.paymentDate}
                                </td>


                                <td>

                                    <a
                                        href="${pageContext.request.contextPath}/payroll/salary-slip?id=${payroll.id}"
                                        class="view-btn">

                                        Salary Slip

                                    </a>

                                </td>


                            </tr>


                        </c:forEach>


                    </c:when>



                    <c:otherwise>


                        <tr>

                            <td
                                colspan="9"
                                class="empty">

                                No payroll records found.

                            </td>

                        </tr>


                    </c:otherwise>


                </c:choose>


            </tbody>


        </table>


    </div>



    <!-- Back Button -->

    <a
        href="${pageContext.request.contextPath}/employees"
        class="back-btn">

        ← Back to Employees

    </a>


</div>


</body>

</html>