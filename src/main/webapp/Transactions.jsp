<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    
    Integer userId = (Integer) session.getAttribute("UserID");
    String userName = (String) session.getAttribute("UserName");

    if (userId == null) {
        response.sendRedirect("Index.jsp");
        return;
    }

 
    ResultSet rs = null;
    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");

        ps = con.prepareStatement("SELECT * FROM Transactions WHERE UserID=? ORDER BY DateOfPayment DESC");
        ps.setInt(1, userId);
        rs = ps.executeQuery();

    } catch (Exception e) {
        out.print("<h3 style='color:red;text-align:center;'>Error: " + e.getMessage() + "</h3>");
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transactions</title>
<style>
body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    background-color: #f7f7f7;
}

/* Sidebar layout reuse (optional if included separately) */
.container {
    display: flex;
    height: 100vh;
}

/* Main content */
.main-content {
    flex: 1;
    background-color: #fff;
    margin: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    padding: 30px;
}

h2 {
    text-align: center;
    margin-bottom: 30px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 30px;
}

th, td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
    text-align: left;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
}

.add-btn {
    display: inline-block;
    background-color: #5A47F0;
    color: white;
    border: none;
    border-radius: 25px;
    padding: 10px 25px;
    font-size: 16px;
    cursor: pointer;
    float: right;
    transition: 0.3s ease;
}

.add-btn:hover {
    background-color: #4532d1;
}
</style>
</head>
<body>

<div class="container">
    <!-- Optional Sidebar -->
    <div class="sidebar">
        <ul style="list-style:none; padding:0;">
            <li><a href="AccountManagement.jsp">Dashboard</a></li>
            <li><a href="Balances.jsp">Balances</a></li>
            <li><a href="Transactions.jsp" style="font-weight:bold;">Transactions</a></li>
            <li><a href="Bills.jsp">Bills</a></li>
            <li><a href="Expenses.jsp">Expenses</a></li>
            <li><a href="Goals.jsp">Goals</a></li>
        </ul>
    </div>

    <!-- Main Transactions Section -->
    <div class="main-content">
        <h2>Transaction Table</h2>

        <table>
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Goal</th>
                    <th>Account Name</th>
                    <th>Date of Payment</th>
                    <th>Payment Type</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
                <!-- Later we'll populate this with database data -->
            </tbody>
        </table>

        <button class="add-btn" onclick="window.location.href='AddTransaction.jsp'">Add Transaction</button>
    </div>
</div>

</body>
</html>
