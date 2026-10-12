<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Team Leave Calendar</title>

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

    max-width: 1100px;

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

    color: #eeeeee;

    padding: 21px 22px;

    border-radius: 9px;

    margin-bottom: 18px;

    border: 1px solid #292d2a;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02),
        0 15px 35px rgba(0,0,0,0.18);
}

.header h1 {

    margin-bottom: 7px;

    font-size: 20px;

    font-weight: 650;
}

.header p {

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

    padding: 0;

    border-radius: 9px;

    border: 1px solid #292d2a;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02),
        0 15px 35px rgba(0,0,0,0.18);

    overflow: hidden;
}


/* =====================================================
   TABLE WRAPPER
===================================================== */

table {

    width: 100%;

    border-collapse: collapse;

    min-width: 800px;
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
   IDs
===================================================== */

td:first-child {

    color: #dddddd;

    font-weight: 600;
}


/* =====================================================
   STATUS
===================================================== */

.status {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    padding: 5px 9px;

    border-radius: 5px;

    font-size: 8px;

    font-weight: 700;

    letter-spacing: 0.2px;
}


/* APPROVED */

.approved {

    background: rgba(74, 222, 128, 0.10);

    color: #4ade80;

    border: 1px solid rgba(74, 222, 128, 0.20);
}


/* PENDING */

.pending {

    background: rgba(245, 200, 66, 0.10);

    color: #f5c842;

    border: 1px solid rgba(245, 200, 66, 0.20);
}


/* REJECTED */

.rejected {

    background: rgba(255, 92, 92, 0.10);

    color: #ff5c5c;

    border: 1px solid rgba(255, 92, 92, 0.20);
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

    margin: 18px;

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

.back-btn:hover {

    background: #c5ff67;

    transform: translateY(-1px);
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 850px) {

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

        min-width: 800px;
    }
}

</style>

</head>


<body>


<div class="container">


    <!-- Header -->

    <div class="header">

        <h1>
            Team Leave Calendar
        </h1>

        <p>
            View leave requests submitted by team members.
        </p>

    </div>



    <!-- Leave Requests -->

    <div class="card">


        <table>


            <thead>

                <tr>

                    <th>
                        Leave ID
                    </th>

                    <th>
                        Employee ID
                    </th>

                    <th>
                        Leave Type ID
                    </th>

                    <th>
                        Start Date
                    </th>

                    <th>
                        End Date
                    </th>

                    <th>
                        Total Days
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
                            items="${leaveRequests}">


                            <tr>


                                <td>
                                    ${leave.id}
                                </td>


                                <td>
                                    ${leave.employeeId}
                                </td>


                                <td>
                                    ${leave.leaveTypeId}
                                </td>


                                <td>
                                    ${leave.startDate}
                                </td>


                                <td>
                                    ${leave.endDate}
                                </td>


                                <td>
                                    ${leave.totalDays}
                                </td>


                                <td>


                                    <c:choose>


                                        <c:when
                                            test="${leave.status == 'Approved'}">

                                            <span class="status approved">
                                                Approved
                                            </span>

                                        </c:when>


                                        <c:when
                                            test="${leave.status == 'Rejected'}">

                                            <span class="status rejected">
                                                Rejected
                                            </span>

                                        </c:when>


                                        <c:otherwise>

                                            <span class="status pending">
                                                Pending
                                            </span>

                                        </c:otherwise>


                                    </c:choose>


                                </td>


                            </tr>


                        </c:forEach>


                    </c:when>



                    <c:otherwise>


                        <tr>

                            <td
                                colspan="7"
                                class="empty">

                                No leave requests found.

                            </td>

                        </tr>


                    </c:otherwise>


                </c:choose>


            </tbody>


        </table>



        <!-- Back Button -->

        <a
            href="${pageContext.request.contextPath}/manager"
            class="back-btn">

            ← Back to Manager Dashboard

        </a>


    </div>


</div>


</body>

</html>