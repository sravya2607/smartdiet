<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Food Tracking</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #6dd5ed, #2193b0);
            color: #333;
        }

        h3 {
            text-align: center;
            margin-top: 20px;
            font-size: 32px;
            color: #fff;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
        }

        /* Table Styling */
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: center;
            font-size: 16px;
        }

        th {
            background: #4caf50;
            color: #fff;
        }

        td {
            background: #fff;
            color: #555;
        }

        tr:nth-child(even) td {
            background: #f4f4f4;
        }

        tr:hover td {
            background: #e3f2fd;
        }

        td button {
            padding: 8px 15px;
            background: #e53935;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        td button:hover {
            background: #d32f2f;
            transform: translateY(-2px);
        }

        /* Button Container */
        .button-container {
            text-align: center;
            margin: 20px auto;
        }

        .button-container button {
            padding: 12px 20px;
            margin: 0 10px;
            background: linear-gradient(to right, #43cea2, #185a9d);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .button-container button:hover {
            background: linear-gradient(to right, #6dd5ed, #2193b0);
            transform: translateY(-2px);
        }

        /* Search Bar Styling */
        .search-container {
            display: flex;
            justify-content: center;
            margin: 20px auto;
        }

        .search-container input {
            width: 400px;
            padding: 12px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }

        .search-container input:focus {
            outline: none;
            box-shadow: 0 6px 15px rgba(33, 147, 176, 0.5);
        }

        /* Media Query for Responsiveness */
        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }

            .button-container button {
                padding: 10px 15px;
            }

            .search-container input {
                width: 90%;
            }

            th, td {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <h3>View Food Tracking</h3>

    <!-- Filter and Search Options -->
    <div class="button-container">
        <button onclick="sortTable()">Sort by Date</button>
        <button onclick="exportToCSV()">Export to CSV</button>
        <button onclick="goToHomePage()">Go to Home Page</button>
    </div>

    <!-- Search Bar -->
    <div class="search-container">
        <input type="text" id="searchInput" onkeyup="searchTable()" placeholder="Search by User ID or Date...">
    </div>

    <!-- Food Tracking Table -->
    <table id="foodTrackingTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>User ID</th>
                <th>Breakfast</th>
                <th>Lunch</th>
                <th>Snacks</th>
                <th>Dinner</th>
                <th>Water Intake (ml)</th>
                <th>Created At</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="tracking" items="${trackinglist}">
                <tr>
                    <td>${tracking.id}</td>
                    <td>${tracking.userId}</td>
                    <td>${tracking.breakfast}</td>
                    <td>${tracking.lunch}</td>
                    <td>${tracking.snacks}</td>
                    <td>${tracking.dinner}</td>
                    <td>${tracking.waterIntake}</td>
                    <td>${tracking.createdAt}</td>
                    <td>
                        <button onclick="deleteTracking(${tracking.id})">Delete</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
