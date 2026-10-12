<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Add Payroll</title>

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

    max-width: 750px;

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
   FORM CARD
===================================================== */

.card {

    background:
        linear-gradient(
            145deg,
            #151817,
            #111412
        );

    padding: 25px;

    border-radius: 9px;

    border: 1px solid #292d2a;

    box-shadow:
        0 8px 25px rgba(255,255,255,0.02),
        0 15px 35px rgba(0,0,0,0.18);
}


/* =====================================================
   FORM GROUP
===================================================== */

.form-group {

    margin-bottom: 17px;
}


/* =====================================================
   LABEL
===================================================== */

label {

    display: block;

    margin-bottom: 7px;

    font-weight: 600;

    color: #b8bdb9;

    font-size: 9px;

    letter-spacing: 0.2px;
}


/* =====================================================
   INPUT
===================================================== */

input {

    width: 100%;

    padding: 11px 12px;

    background: #101311;

    color: #eeeeee;

    border: 1px solid #303530;

    border-radius: 6px;

    font-size: 10px;

    outline: none;

    transition: 0.2s;
}

input::placeholder {

    color: #555b57;
}

input:focus {

    border-color: #b7ff45;

    box-shadow:
        0 0 0 2px rgba(183,255,69,0.06);
}


/* =====================================================
   DATE INPUT
===================================================== */

input[type="date"] {

    color-scheme: dark;
}


/* =====================================================
   TWO COLUMN ROW
===================================================== */

.row {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 14px;
}


/* =====================================================
   BUTTON ROW
===================================================== */

.button-row {

    display: flex;

    gap: 10px;

    margin-top: 22px;
}


/* =====================================================
   BUTTON
===================================================== */

.btn {

    padding: 10px 15px;

    border: none;

    border-radius: 6px;

    text-decoration: none;

    cursor: pointer;

    font-size: 9px;

    font-weight: 700;

    transition: 0.2s;
}


/* =====================================================
   SAVE BUTTON
===================================================== */

.save-btn {

    background: #b7ff45;

    color: #10140d;

    box-shadow:
        0 5px 15px rgba(183,255,69,0.07);
}

.save-btn:hover {

    background: #c5ff67;

    transform: translateY(-1px);
}


/* =====================================================
   BACK BUTTON
===================================================== */

.back-btn {

    background: #252a27;

    color: #b8bdb9;

    border: 1px solid #343a36;
}

.back-btn:hover {

    background: #303631;

    color: #eeeeee;

    transform: translateY(-1px);
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 600px) {

    body {

        padding: 15px 10px;
    }

    .card {

        padding: 20px;
    }

    .row {

        grid-template-columns: 1fr;
    }

    .button-row {

        flex-direction: column;
    }

    .btn {

        text-align: center;

        width: 100%;
    }

}

</style>

</head>


<body>


<div class="container">


    <!-- Header -->

    <div class="header">

        <h2>
            Add Payroll
        </h2>

        <p>
            Enter employee salary and payroll details.
        </p>

    </div>



    <!-- Form -->

    <div class="card">


        <form
            action="${pageContext.request.contextPath}/payroll/add"
            method="post">


            <!-- Employee ID -->

            <div class="form-group">

                <label for="employeeId">
                    Employee ID
                </label>

                <input
                    type="number"
                    id="employeeId"
                    name="employeeId"
                    min="1"
                    required>

            </div>



            <!-- Pay Month -->

            <div class="form-group">

                <label for="payMonth">
                    Pay Month
                </label>

                <input
                    type="text"
                    id="payMonth"
                    name="payMonth"
                    placeholder="e.g. September 2026"
                    required>

            </div>



            <!-- Basic Pay + LOP -->

            <div class="row">


                <div class="form-group">

                    <label for="basicPay">
                        Basic Pay
                    </label>

                    <input
                        type="number"
                        id="basicPay"
                        name="basicPay"
                        step="0.01"
                        min="0"
                        required>

                </div>



                <div class="form-group">

                    <label for="lopDays">
                        LOP Days
                    </label>

                    <input
                        type="number"
                        id="lopDays"
                        name="lopDays"
                        min="0"
                        required>

                </div>


            </div>



            <!-- Deductions + Net Salary -->

            <div class="row">


                <div class="form-group">

                    <label for="deductions">
                        Deductions
                    </label>

                    <input
                        type="number"
                        id="deductions"
                        name="deductions"
                        step="0.01"
                        min="0"
                        value="0"
                        required>

                </div>



                <div class="form-group">

                    <label for="netSalary">
                        Net Salary
                    </label>

                    <input
                        type="number"
                        id="netSalary"
                        name="netSalary"
                        step="0.01"
                        min="0"
                        required>

                </div>


            </div>



            <!-- Payment Date -->

            <div class="form-group">

                <label for="paymentDate">
                    Payment Date
                </label>

                <input
                    type="date"
                    id="paymentDate"
                    name="paymentDate"
                    required>

            </div>



            <!-- Buttons -->

            <div class="button-row">

                <button
                    type="submit"
                    class="btn save-btn">

                    Add Payroll

                </button>


                <a
                    href="${pageContext.request.contextPath}/payroll"
                    class="btn back-btn">

                    Back to Payroll

                </a>

            </div>


        </form>


    </div>


</div>


</body>

</html>