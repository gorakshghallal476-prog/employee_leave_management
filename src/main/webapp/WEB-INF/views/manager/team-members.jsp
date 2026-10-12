<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Team Members</title>

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

    padding: 21px 22px;

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

    overflow-x: auto;
}


/* =====================================================
   TABLE
===================================================== */

table {

    width: 100%;

    border-collapse: collapse;

    min-width: 850px;
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
   EMPLOYEE NAME
===================================================== */

td:nth-child(2) {

    color: #dddddd;

    font-weight: 600;
}


/* =====================================================
   PROFILE BUTTON
===================================================== */

.profile-btn {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    padding: 8px 12px;

    background: #b7ff45;

    color: #10140d;

    text-decoration: none;

    border-radius: 6px;

    font-size: 8px;

    font-weight: 700;

    transition: 0.2s;

    white-space: nowrap;

    box-shadow:
        0 5px 15px rgba(183,255,69,0.07);
}

.profile-btn:hover {

    background: #c5ff67;

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

        min-width: 850px;
    }
}

</style>

</head>


<body>


<div class="container">


    <div class="header">

        <h2>
            Team Members
        </h2>

        <p>
            Manager ID: ${managerId}
        </p>

    </div>



    <div class="card">


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
                        Department ID
                    </th>

                    <th>
                        Joining Date
                    </th>

                    <th>
                        Action
                    </th>

                </tr>

            </thead>



            <tbody>


                <c:choose>


                    <c:when test="${not empty teamMembers}">


                        <c:forEach
                            var="employee"
                            items="${teamMembers}">


                            <tr>


                                <td>
                                    ${employee.id}
                                </td>


                                <td>
                                    ${employee.name}
                                </td>


                                <td>
                                    ${employee.email}
                                </td>


                                <td>
                                    ${employee.mobile}
                                </td>


                                <td>
                                    ${employee.deptId}
                                </td>


                                <td>
                                    ${employee.joiningDate}
                                </td>


                                <td>

                                    <a
                                        href="${pageContext.request.contextPath}/employees/profile?id=${employee.id}"
                                        class="profile-btn">

                                        View Profile

                                    </a>

                                </td>


                            </tr>


                        </c:forEach>


                    </c:when>



                    <c:otherwise>


                        <tr>

                            <td
                                colspan="7"
                                class="empty">

                                No team members found.

                            </td>

                        </tr>


                    </c:otherwise>


                </c:choose>


            </tbody>


        </table>


    </div>



    <a
        href="${pageContext.request.contextPath}/manager"
        class="back-btn">

        ← Back to Manager Dashboard

    </a>


</div>


</body>

</html>