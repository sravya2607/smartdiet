<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Food Tracking | Nutrition Tracker</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        :root {
            --primary-color: #4CAF50;
            --secondary-color: #2E7D32;
            --accent-color: #8BC34A;
            --danger-color: #FF5733;
            --warning-color: #FFC107;
            --info-color: #2196F3;
            --light-gray: #f5f5f5;
            --medium-gray: #e0e0e0;
            --dark-gray: #757575;
            --text-color: #333;
            --white: #ffffff;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: var(--light-gray);
            color: var(--text-color);
            line-height: 1.6;
        }

        /* Main Content */
        .main-content {
            margin-left: 270px;
            padding: 2rem;
            transition: margin-left 0.3s ease;
        }

        /* Card Container */
        .card {
            background-color: var(--white);
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            margin: 0 auto;
            max-width: 1200px;
            animation: slideIn 0.5s ease-in-out;
        }

        .card:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card h3 {
            font-size: 1.8rem;
            color: var(--secondary-color);
            text-align: center;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .card h3 i {
            color: var(--primary-color);
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.9rem;
        }

        th, td {
            padding: 1rem;
            text-align: center;
            border: 1px solid var(--medium-gray);
        }

        th {
            background-color: var(--primary-color);
            color: var(--white);
            font-weight: 500;
        }

        td {
            background-color: var(--white);
            color: var(--text-color);
        }

        tr:nth-child(even) td {
            background-color: var(--light-gray);
        }

        tr:hover td {
            background-color: rgba(76, 175, 80, 0.1);
        }

        /* Button Styles */
        .btn {
            display: inline-block;
            padding: 0.6rem 1.2rem;
            border-radius: 8px;
            font-size: 0.9rem;
            font-weight: 500;
            cursor: pointer;
            text-align: center;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }

        .btn-danger {
            background-color: var(--danger-color);
            color: var(--white);
        }

        .btn-danger:hover {
            background-color: #e04120;
            transform: translateY(-2px);
        }

        /* Button Container */
        .button-container {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
        }

        /* Search Bar Styling */
        .search-container {
            display: flex;
            justify-content: center;
            margin-bottom: 1.5rem;
        }

        .search-container input {
            width: 100%;
            max-width: 400px;
            padding: 0.8rem;
            border: 1px solid var(--medium-gray);
            border-radius: 8px;
            font-size: 1rem;
            background-color: var(--light-gray);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .search-container input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 8px rgba(76, 175, 80, 0.3);
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }
        }

        @media (max-width: 768px) {
            .card h3 {
                font-size: 1.5rem;
            }

            table {
                font-size: 0.85rem;
            }

            th, td {
                padding: 0.6rem;
            }

            .btn {
                padding: 0.5rem 1rem;
                font-size: 0.85rem;
            }

            .search-container input {
                max-width: 90%;
            }
        }
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp" %>

    <!-- Main Content -->
    <div class="main-content">
        <div class="card">
            <h3><i class="fas fa-eye"></i> View Food Tracking</h3>

            <!-- Filter and Search Options -->
            <div class="button-container">
                <button class="btn btn-primary" onclick="sortTable()"><i class="fas fa-sort"></i> Sort by Date</button>
                <button class="btn btn-primary" onclick="exportToCSV()"><i class="fas fa-file-csv"></i> Export to CSV</button>
                <button class="btn btn-primary" onclick="goToHomePage()"><i class="fas fa-home"></i> Go to Home Page</button>
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
                                <button class="btn btn-danger" onclick="deleteTracking(${tracking.id})"><i class="fas fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function searchTable() {
            const input = document.getElementById('searchInput').value.toLowerCase();
            const table = document.getElementById('foodTrackingTable');
            const rows = table.getElementsByTagName('tr');

            for (let i = 1; i < rows.length; i++) {
                const userId = rows[i].cells[1].textContent.toLowerCase();
                const date = rows[i].cells[7].textContent.toLowerCase();
                rows[i].style.display = (userId.includes(input) || date.includes(input)) ? '' : 'none';
            }
        }

        function sortTable() {
            const table = document.getElementById('foodTrackingTable');
            const rows = Array.from(table.rows).slice(1);
            rows.sort((a, b) => {
                const dateA = new Date(a.cells[7].textContent);
                const dateB = new Date(b.cells[7].textContent);
                return dateB - dateA; // Sort descending
            });
            rows.forEach(row => table.tBodies[0].appendChild(row));
        }

        function exportToCSV() {
            const table = document.getElementById('foodTrackingTable');
            const rows = Array.from(table.rows);
            const csv = rows.map(row => Array.from(row.cells).slice(0, -1).map(cell => `"${cell.textContent}"`).join(',')).join('\n');
            const blob = new Blob([csv], { type: 'text/csv' });
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = 'food_tracking.csv';
            a.click();
            window.URL.revokeObjectURL(url);
        }

        function deleteTracking(id) {
            if (confirm('Are you sure you want to delete this tracking entry?')) {
                window.location.href = `/deleteFoodTracking?id=${id}`;
            }
        }

        function goToHomePage() {
            window.location.href = 'userdashboard';
        }
    </script>
</body>
</html>
