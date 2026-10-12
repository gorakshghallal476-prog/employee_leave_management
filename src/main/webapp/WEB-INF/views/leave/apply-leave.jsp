<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Apply Leave</title>

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
    max-width: 720px;
    margin: auto;
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

    padding: 27px;

    border-radius: 10px;

    border: 1px solid #292d2a;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02),
        0 18px 40px rgba(0,0,0,0.22);
}


/* =====================================================
   HEADER
===================================================== */

h2 {

    margin-bottom: 24px;

    color: #eeeeee;

    font-size: 20px;

    font-weight: 650;

    padding-bottom: 15px;

    border-bottom: 1px solid #292d2a;
}


/* =====================================================
   FORM
===================================================== */

.form-group {

    margin-bottom: 16px;
}

label {

    display: block;

    margin-bottom: 7px;

    font-weight: 600;

    color: #929792;

    font-size: 9px;

    text-transform: uppercase;

    letter-spacing: 0.5px;
}


/* =====================================================
   INPUTS
===================================================== */

input,
select,
textarea {

    width: 100%;

    padding: 11px 12px;

    border: 1px solid #303530;

    border-radius: 7px;

    font-size: 10px;

    outline: none;

    background: #0e110f;

    color: #eeeeee;

    transition: 0.2s;
}

input::placeholder,
textarea::placeholder {

    color: #555b57;
}

input:focus,
select:focus,
textarea:focus {

    border-color: #68725f;

    background: #111512;

    box-shadow:
        0 0 0 3px rgba(183,255,69,0.04);
}


/* SELECT */

select {

    cursor: pointer;

    appearance: auto;
}

select option {

    background: #111412;

    color: #eeeeee;
}


/* DATE INPUT */

input[type="date"] {

    color-scheme: dark;
}


/* NUMBER INPUT */

input[type="number"] {

    color: #eeeeee;
}


/* TEXTAREA */

textarea {

    resize: vertical;

    min-height: 105px;

    line-height: 1.5;
}


/* =====================================================
   BUTTON
===================================================== */

.btn {

    width: 100%;

    padding: 11px;

    border: none;

    border-radius: 7px;

    background: #b7ff45;

    color: #10140d;

    font-size: 10px;

    font-weight: 700;

    cursor: pointer;

    margin-top: 4px;

    box-shadow:
        0 6px 18px rgba(183,255,69,0.08);

    transition: 0.2s;
}

.btn:hover {

    background: #c5ff67;

    transform: translateY(-1px);
}


/* =====================================================
   BACK BUTTON
===================================================== */

.back {

    display: inline-flex;

    align-items: center;

    margin-top: 16px;

    text-decoration: none;

    color: #777d78;

    font-size: 9px;

    transition: 0.2s;
}

.back:hover {

    color: #b7ff45;

}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 600px) {

    body {
        padding: 18px 12px;
    }

    .card {
        padding: 20px;
    }

    h2 {
        font-size: 18px;
    }

}

</style>

</head>


<body>


<div class="container">


    <div class="card">


        <h2>
            Apply for Leave
        </h2>


        <form
            action="${pageContext.request.contextPath}/leave/apply"
            method="post">


            <!-- Employee ID -->

            <div class="form-group">

                <label>
                    Employee ID
                </label>

                <input
                    type="number"
                    name="employeeId"
                    placeholder="Enter Employee ID"
                    required>

            </div>



            <!-- Leave Type -->

            <div class="form-group">

                <label>
                    Leave Type
                </label>

                <select
                    name="leaveTypeId"
                    required>

                    <option value="">
                        Select Leave Type
                    </option>

                    <c:forEach
                        var="leaveType"
                        items="${leaveTypes}">

                        <option
                            value="${leaveType.id}">

                            ${leaveType.typeName}

                        </option>

                    </c:forEach>

                </select>

            </div>



            <!-- Start Date -->

            <div class="form-group">

                <label>
                    Start Date
                </label>

                <input
                    type="date"
                    name="startDate"
                    required>

            </div>



            <!-- End Date -->

            <div class="form-group">

                <label>
                    End Date
                </label>

                <input
                    type="date"
                    name="endDate"
                    required>

            </div>



            <!-- Total Days -->

            <div class="form-group">

                <label>
                    Total Days
                </label>

                <input
                    type="number"
                    name="totalDays"
                    min="1"
                    placeholder="Enter total leave days"
                    required>

            </div>



            <!-- Reason -->

            <div class="form-group">

                <label>
                    Reason
                </label>

                <textarea
                    name="reason"
                    placeholder="Enter reason for leave"
                    required></textarea>

            </div>



            <button
                type="submit"
                class="btn">

                Apply Leave

            </button>


        </form>


        <a
            href="${pageContext.request.contextPath}/employees"
            class="back">

            ← Back to Employees

        </a>


    </div>


</div>


</body>

</html>