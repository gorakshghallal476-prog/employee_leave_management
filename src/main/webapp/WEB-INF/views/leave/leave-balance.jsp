<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Leave Balance</title>

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
    min-height: 100vh;
}


/* =====================================================
   CONTAINER
===================================================== */

.container {

    max-width: 1000px;

    margin: 35px auto;

    padding: 0 20px;
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

    padding: 22px;

    border-radius: 9px;

    margin-bottom: 18px;

    border: 1px solid #292d2a;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02),
        0 15px 35px rgba(0,0,0,0.18);
}

.header h2 {

    color: #eeeeee;

    margin-bottom: 7px;

    font-size: 20px;

    font-weight: 650;
}

.subtitle {

    color: #666c67;

    font-size: 9px;
}


/* =====================================================
   MAIN CARD
===================================================== */

.card {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    padding: 20px;

    border-radius: 9px;

    border: 1px solid #292d2a;

    overflow-x: auto;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02),
        0 15px 35px rgba(0,0,0,0.18);
}


/* =====================================================
   COUNT BOX
===================================================== */

.count-box {

    margin-bottom: 17px;

    padding: 12px 14px;

    background: #101311;

    border: 1px solid #292d2a;

    border-radius: 7px;

    color: #707671;

    font-size: 9px;
}

.count-box strong {

    color: #b7ff45;

    font-size: 10px;
}


/* =====================================================
   TABLE
===================================================== */

table {

    width: 100%;

    border-collapse: collapse;

    min-width: 500px;
}

th,
td {

    padding: 13px 14px;

    text-align: left;

    border-bottom: 1px solid #252925;
}

th {

    background: #121513;

    color: #666c67;

    font-size: 8px;

    text-transform: uppercase;

    letter-spacing: 0.6px;
}

td {

    font-size: 10px;

    color: #999e9a;
}

tbody tr {

    transition: 0.2s;
}

tbody tr:hover {

    background: #181b19;
}


/* =====================================================
   BALANCE
===================================================== */

.balance {

    font-weight: 700;

    color: #b7ff45;

    background: #1a2117;

    border: 1px solid #303a2c;

    border-radius: 5px;

    display: inline-block;

    padding: 5px 9px;
}


/* =====================================================
   EMPTY
===================================================== */

.empty {

    text-align: center;

    padding: 45px 20px;

    color: #666c67;
}

.empty h3 {

    color: #dddddd;

    margin-bottom: 9px;

    font-size: 14px;
}

.empty p {

    font-size: 9px;

    line-height: 1.6;
}


/* =====================================================
   BACK BUTTON
===================================================== */

.back-btn {

    display: inline-flex;

    align-items: center;

    margin-top: 17px;

    padding: 10px 15px;

    background: #171a18;

    color: #929792;

    border: 1px solid #303530;

    text-decoration: none;

    border-radius: 6px;

    font-size: 9px;

    font-weight: 600;

    transition: 0.2s;
}

.back-btn:hover {

    background: #222622;

    color: #b7ff45;

    border-color: #3a403b;
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 600px) {

    .container {

        margin: 20px auto;

        padding: 0 12px;
    }

    .header {

        padding: 18px;
    }

    .card {

        padding: 15px;
    }

    .header h2 {

        font-size: 18px;
    }

    th,
    td {

        padding: 11px;
    }

}

</style>

</head>


<body>


<div class="container">


    <div class="header">

        <h2>
            Leave Balance
        </h2>

        <p class="subtitle">
            Employee ID: ${employeeId}
        </p>

    </div>



    <div class="card">


        <c:choose>


            <c:when test="${not empty leaveBalances}">


                <div class="count-box">

                    Total Leave Balance Records:
                    <strong>${leaveBalances.size()}</strong>

                </div>



                <table>


                    <thead>

                        <tr>

                            <th>
                                Balance ID
                            </th>

                            <th>
                                Leave Type ID
                            </th>

                            <th>
                                Available Days
                            </th>

                        </tr>

                    </thead>



                    <tbody>


                        <c:forEach
                            var="balance"
                            items="${leaveBalances}">


                            <tr>


                                <td>
                                    ${balance.id}
                                </td>


                                <td>
                                    ${balance.leaveTypeId}
                                </td>


                                <td class="balance">

                                    ${balance.availableDays} Days

                                </td>


                            </tr>


                        </c:forEach>


                    </tbody>


                </table>


            </c:when>



            <c:otherwise>


                <div class="empty">

                    <h3>
                        No Leave Balance Found
                    </h3>

                    <p>
                        No leave balance records are available for Employee ID
                        ${employeeId}.
                    </p>

                </div>


            </c:otherwise>


        </c:choose>


    </div>



    <a
        href="${pageContext.request.contextPath}/employees"
        class="back-btn">

        ← Back to Employees

    </a>


</div>


</body>

</html>