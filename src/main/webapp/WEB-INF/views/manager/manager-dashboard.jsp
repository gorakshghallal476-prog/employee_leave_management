<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Manager Dashboard</title>

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

    margin-bottom: 18px;

    padding: 21px 22px;

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

.header h2 {

    color: #eeeeee;

    margin-bottom: 7px;

    font-size: 20px;

    font-weight: 650;
}

.header p {

    color: #666c67;

    font-size: 9px;
}


/* =====================================================
   DASHBOARD CARDS
===================================================== */

.card-container {

    display: grid;

    grid-template-columns:
        repeat(auto-fit, minmax(260px, 1fr));

    gap: 12px;
}

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

    min-height: 165px;

    display: flex;

    flex-direction: column;

    justify-content: space-between;

    box-shadow:
        0 8px 22px rgba(255,255,255,0.02),
        0 12px 28px rgba(0,0,0,0.15);

    transition: 0.2s;
}

.card:hover {

    border-color: #383d39;

    transform: translateY(-2px);
}

.card h3 {

    margin-bottom: 8px;

    color: #eeeeee;

    font-size: 13px;

    font-weight: 600;
}

.card p {

    color: #666c67;

    margin-bottom: 18px;

    font-size: 9px;

    line-height: 1.6;
}


/* =====================================================
   BUTTON
===================================================== */

.btn {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    width: fit-content;

    padding: 9px 13px;

    background: #b7ff45;

    color: #10140d;

    text-decoration: none;

    border-radius: 6px;

    font-size: 9px;

    font-weight: 700;

    border: none;

    transition: 0.2s;

    box-shadow:
        0 5px 15px rgba(183,255,69,0.07);
}

.btn:hover {

    background: #c5ff67;

    transform: translateY(-1px);
}


/* =====================================================
   MANAGER LIST
===================================================== */

.manager-list {

    margin-top: 18px;

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    border: 1px solid #292d2a;

    border-radius: 9px;

    overflow: hidden;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02),
        0 15px 35px rgba(0,0,0,0.18);
}

.manager-list h3 {

    padding: 17px 18px;

    border-bottom: 1px solid #292d2a;

    color: #eeeeee;

    font-size: 13px;

    font-weight: 600;
}


/* =====================================================
   TABLE
===================================================== */

table {

    width: 100%;

    border-collapse: collapse;

    min-width: 700px;
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

    color: #999e9a;

    font-size: 9px;
}

tbody tr {

    transition: 0.2s;
}

tbody tr:hover {

    background: #181b19;
}


/* MANAGER NAME */

td:nth-child(2) {

    color: #dddddd;

    font-weight: 600;
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

    .header {

        padding: 18px;
    }

    .card-container {

        grid-template-columns: 1fr;
    }

    .card {

        min-height: 145px;
    }

    .manager-list {

        overflow-x: auto;
    }

}

</style>

</head>


<body>


<div class="container">


    <!-- Header -->

    <div class="header">

        <h2>
            Manager Dashboard
        </h2>

        <p>
            Manage teams and employee activities
        </p>

    </div>



    <!-- Dashboard Cards -->

    <div class="card-container">


        <!-- Team Members -->

        <div class="card">

            <div>

                <h3>
                    Team Members
                </h3>

                <p>
                    View employees assigned to a manager.
                </p>

            </div>


            <c:if test="${not empty managers}">

                <a
                    href="${pageContext.request.contextPath}/manager/team?managerId=${managers[0].id}"
                    class="btn">

                    View Team

                </a>

            </c:if>

        </div>



        <!-- Pending Leaves -->

        <div class="card">

            <div>

                <h3>
                    Pending Leaves
                </h3>

                <p>
                    Review employee leave requests.
                </p>

            </div>


            <a
                href="${pageContext.request.contextPath}/leave/pending"
                class="btn">

                View Pending Leaves

            </a>

        </div>



        <!-- Team Leave Calendar -->

        <div class="card">

            <div>

                <h3>
                    Team Leave Calendar
                </h3>

                <p>
                    View leave requests and leave dates of team members.
                </p>

            </div>


            <a
                href="${pageContext.request.contextPath}/manager/leave-calendar"
                class="btn">

                View Leave Calendar

            </a>

        </div>


    </div>



    <!-- Managers List -->

    <div class="manager-list">


        <h3>
            Managers
        </h3>


        <table>


            <thead>

                <tr>

                    <th>
                        ID
                    </th>

                    <th>
                        Name
                    </th>

                    <th>
                        Email
                    </th>

                    <th>
                        Mobile
                    </th>

                    <th>
                        Action
                    </th>

                </tr>

            </thead>



            <tbody>


                <c:choose>


                    <c:when test="${not empty managers}">


                        <c:forEach
                            var="manager"
                            items="${managers}">


                            <tr>


                                <td>
                                    ${manager.id}
                                </td>


                                <td>
                                    ${manager.name}
                                </td>


                                <td>
                                    ${manager.email}
                                </td>


                                <td>
                                    ${manager.mobile}
                                </td>


                                <td>

                                    <a
                                        href="${pageContext.request.contextPath}/manager/team?managerId=${manager.id}"
                                        class="btn">

                                        View Team

                                    </a>

                                </td>


                            </tr>


                        </c:forEach>


                    </c:when>



                    <c:otherwise>


                        <tr>

                            <td
                                colspan="5"
                                class="empty">

                                No managers found.

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