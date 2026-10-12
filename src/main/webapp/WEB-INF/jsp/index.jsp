
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Electricity Bill Calculator</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #e0f2fe, #f0fdf4);
            font-family: Arial, sans-serif;
            min-height: 100vh;
        }

        .calculator {
            max-width: 520px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 8px 30px #00000015;
        }

        .amount {
            color: #198754;
            font-size: 32px;
            font-weight: bold;
        }

        .heading {
            color: #166534;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="calculator">

        <h2 class="text-center heading mb-2">
            ⚡ Electricity Bill Calculator
        </h2>

        <p class="text-center text-secondary mb-4">
            Calculate your electricity charges easily
        </p>

        <form action="${pageContext.request.contextPath}/calculate"
              method="post">

            <label for="units" class="form-label fw-bold">
                Electricity consumption (units)
            </label>

            <input type="number"
                   id="units"
                   name="units"
                   class="form-control mb-3"
                   min="0"
                   step="1"
                   required
                   value="<c:out value='${units}'/>"
                   placeholder="Enter units consumed">

            <button type="submit" class="btn btn-success w-100">
                Calculate Bill
            </button>
        </form>

        <h5 class="mt-4 mb-3">Tariff Rates</h5>

        <ul class="list-group">
            <li class="list-group-item">
                First 50 units — ₹3.50/unit
            </li>
            <li class="list-group-item">
                Next 100 units — ₹4.00/unit
            </li>
            <li class="list-group-item">
                Next 100 units — ₹5.20/unit
            </li>
            <li class="list-group-item">
                Above 250 units — ₹6.50/unit
            </li>
        </ul>

        <c:if test="${not empty error}">
            <div class="alert alert-danger mt-3">
                <c:out value="${error}"/>
            </div>
        </c:if>

        <c:if test="${not empty bill}">
            <div class="alert alert-success text-center mt-4">
                <p>Units consumed: <c:out value="${units}"/></p>
                <p class="mb-1">Total Electricity Bill</p>
                <div class="amount">₹<c:out value="${bill}"/></div>
            </div>
        </c:if>

        <p class="text-center text-secondary mt-4 mb-0">
            Electricity Bill Management System
        </p>

    </div>
</div>
</body>
</html>
