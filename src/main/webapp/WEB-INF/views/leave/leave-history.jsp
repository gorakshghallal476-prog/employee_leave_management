<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Leave History</title>

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

    max-width: 1100px;

    margin: auto;
}


/* =====================================================
   HEADER
===================================================== */

.header {

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
   APPLY BUTTON
===================================================== */

.apply-btn {

    background: #b7ff45;

    color: #10140d;

    text-decoration: none;

    padding: 10px 15px;

    border-radius: 6px;

    font-size: 9px;

    font-weight: 700;

    box-shadow:
        0 5px 15px rgba(183,255,69,0.08);

    transition: 0.2s;
}

.apply-btn:hover {

    background: #c5ff67;

    transform: translateY(-1px);
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

    border-radius: 9px;

    padding: 18px;

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

    text-align: left;

    border-bottom: 1px solid #252925;
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

    padding: 5px 9px;

    border-radius: 5px;

    font-size: 8px;

    font-weight: 700;

    border: 1px solid transparent;
}


/* PENDING */

.pending {

    background: rgba(245,200,66,0.09);

    color: #f5c842;

    border-color: rgba(245,200,66,0.18);
}


/* APPROVED */

.approved {

    background: rgba(74,222,128,0.08);

    color: #4ade80;

    border-color: rgba(74,222,128,0.16);
}


/* REJECTED */

.rejected {

    background: rgba(255,92,92,0.08);

    color: #ff7070;

    border-color: rgba(255,92,92,0.16);
}


/* =====================================================
   CANCEL BUTTON
===================================================== */

.cancel-btn {

    background: rgba(255,92,92,0.07);

    color: #ff7070;

    border: 1px solid rgba(255,92,92,0.14);

    text-decoration: none;

    padding: 6px 10px;

    border-radius: 5px;

    font-size: 8px;

    font-weight: 600;

    transition: 0.2s;
}

.cancel-btn:hover {

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

@media (max-width: 650px) {

    body {

        padding: 18px 12px;
    }

    .header {

        display: block;

        padding: 17px;
    }

    .apply-btn {

        display: inline-flex;

        margin-top: 12px;

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


    <div class="header">


        <h2>
            Leave History
        </h2>


        <a
            href="${pageContext.request.contextPath}/leave/apply"
            class="apply-btn">

            + Apply Leave

        </a>


    </div>



    <div class="card">


        <table>


            <thead>

                <tr>

                    <th>
                        ID
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
                        Applied Date
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


                                    <c:choose>


                                        <c:when
                                            test="${leave.status == 'Pending'}">

                                            <span class="status pending">

                                                Pending

                                            </span>

                                        </c:when>


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

                                            <span class="status">

                                                ${leave.status}

                                            </span>

                                        </c:otherwise>


                                    </c:choose>


                                </td>


                                <td>
                                    ${leave.appliedDate}
                                </td>


                                <td>


                                    <c:if test="${leave.status == 'Pending'}">


                                        <a
                                            href="${pageContext.request.contextPath}/leave/cancel?id=${leave.id}&employeeId=${employeeId}"
                                            class="cancel-btn"
                                            onclick="return confirm('Are you sure you want to cancel this leave?');">

                                            Cancel

                                        </a>


                                    </c:if>


                                </td>


                            </tr>


                        </c:forEach>


                    </c:when>



                    <c:otherwise>


                        <tr>

                            <td
                                colspan="9"
                                class="empty">

                                No leave records found.

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