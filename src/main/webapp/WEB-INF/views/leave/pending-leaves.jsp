<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Pending Leave Requests</title>

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

.page-header {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 18px;

    padding: 18px 20px;

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    border: 1px solid #292d2a;

    border-radius: 9px;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02),
        0 15px 35px rgba(0,0,0,0.18);
}

h2 {

    color: #eeeeee;

    font-size: 20px;

    font-weight: 650;
}


/* =====================================================
   BACK BUTTON
===================================================== */

.back-btn {

    background: #171a18;

    color: #929792;

    padding: 10px 15px;

    border: 1px solid #303530;

    border-radius: 6px;

    text-decoration: none;

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
   CARD
===================================================== */

.card {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    padding: 18px;

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

th,
td {

    padding: 13px 12px;

    border-bottom: 1px solid #252925;

    text-align: left;
}

th {

    background: #121513;

    color: #666c67;

    font-size: 8px;

    text-transform: uppercase;

    letter-spacing: 0.6px;

    white-space: nowrap;
}

td {

    color: #999e9a;

    font-size: 9px;

    white-space: nowrap;
}

tbody tr {

    transition: 0.2s;
}

tbody tr:hover {

    background: #181b19;
}


/* =====================================================
   STATUS
===================================================== */

.status {

    display: inline-flex;

    align-items: center;

    background: rgba(245,200,66,0.09);

    color: #f5c842;

    border: 1px solid rgba(245,200,66,0.18);

    padding: 5px 9px;

    border-radius: 5px;

    font-size: 8px;

    font-weight: 700;
}


/* =====================================================
   ACTIONS
===================================================== */

.actions {

    display: flex;

    gap: 7px;
}


/* APPROVE */

.approve {

    background: rgba(74,222,128,0.08);

    color: #4ade80;

    border: 1px solid rgba(74,222,128,0.16);

    padding: 7px 11px;

    border-radius: 5px;

    text-decoration: none;

    font-size: 8px;

    font-weight: 600;

    transition: 0.2s;
}

.approve:hover {

    background: rgba(74,222,128,0.16);
}


/* REJECT */

.reject {

    background: rgba(255,92,92,0.07);

    color: #ff7070;

    border: 1px solid rgba(255,92,92,0.15);

    padding: 7px 11px;

    border-radius: 5px;

    text-decoration: none;

    font-size: 8px;

    font-weight: 600;

    transition: 0.2s;
}

.reject:hover {

    background: rgba(255,92,92,0.15);
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
   RESPONSIVE
===================================================== */

@media (max-width: 700px) {

    body {
        padding: 15px 10px;
    }

    .page-header {

        flex-direction: column;

        align-items: flex-start;

        gap: 13px;
    }

    .back-btn {

        display: inline-flex;

        align-items: center;

        justify-content: center;
    }

    .card {
        padding: 12px;
    }

}

</style>

</head>


<body>


<div class="container">


    <!-- ================= HEADER ================= -->

    <div class="page-header">


        <h2>
            Pending Leave Requests
        </h2>


        <a
            href="${pageContext.request.contextPath}/admin"
            class="back-btn">

            ← Back to Dashboard

        </a>


    </div>



    <!-- ================= LEAVE TABLE ================= -->

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
                        Reason
                    </th>

                    <th>
                        Status
                    </th>

                    <th>
                        Action
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
                                    ${leave.reason}
                                </td>


                                <td>

                                    <span class="status">

                                        ${leave.status}

                                    </span>

                                </td>


                                <td>


                                    <div class="actions">


                                        <a
                                            href="${pageContext.request.contextPath}/leave/approve?id=${leave.id}"
                                            class="approve"
                                            onclick="return confirm('Approve this leave request?');">

                                            Approve

                                        </a>


                                        <a
                                            href="${pageContext.request.contextPath}/leave/reject?id=${leave.id}"
                                            class="reject"
                                            onclick="return confirm('Reject this leave request?');">

                                            Reject

                                        </a>


                                    </div>


                                </td>


                            </tr>


                        </c:forEach>


                    </c:when>



                    <c:otherwise>


                        <tr>

                            <td
                                colspan="9"
                                class="empty">

                                No pending leave requests
                                found.

                            </td>

                        </tr>


                    </c:otherwise>


                </c:choose>


            </tbody>


        </table>


    </div>


</div>


</body>

</html>