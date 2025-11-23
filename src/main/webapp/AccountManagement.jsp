<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<%

	
   
    Integer userId = (Integer) session.getAttribute("UserID");
    String userName = (String) session.getAttribute("UserName");

    if (userId == null) {
        // If not logged in, redirect to login page
        response.sendRedirect("Index.jsp");
        return;
    }

    // Variables to hold user account data
    String cardName = "Not Added Yet";
    String cardNumber = "-";
    String cardHolder = "-";
    double balance = 0.00;

    try {
       
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");

       
        PreparedStatement ps = con.prepareStatement(
            "SELECT CardName, CardNumber, CardHolderName, Balance FROM CardDetails WHERE UserID=?"
        );
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            cardName = rs.getString("CardName");
            cardNumber = rs.getString("CardNumber");
            cardHolder = rs.getString("CardHolderName");
            balance = rs.getDouble("Balance");
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.print("<h3 style='color:red;text-align:center;'>Error: " + e.getMessage() + "</h3>");
    }
%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Management</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    body {
        display: flex;
        height: 100vh;
        background-color: #f7f7f7;
    }

    /* Sidebar */
    .sidebar {
        width: 240px;
        background-color: #fff;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        padding: 20px 0;
    }

    .sidebar .logo {
        text-align: center;
        font-weight: bold;
        font-size: 20px;
        color: #5A47F0;
        margin-bottom: 30px;
    }

    .sidebar ul {
        list-style: none;
    }

    .sidebar ul li {
        padding: 15px 30px;
        cursor: pointer;
        display: flex;
        align-items: center;
        transition: all 0.3s ease;
        color: #333;
        font-weight: 500;
    }

    .sidebar ul li:hover,
    .sidebar ul li.active {
        background-color: #5A47F0;
        color: white;
        border-radius: 10px 0 0 10px;
    }

    .sidebar ul li i {
        margin-right: 10px;
        font-size: 18px;
    }

    .profile {
        background-color: #5A47F0;
        color: white;
        text-align: center;
        padding: 15px;
        border-radius: 10px;
        margin: 0 10px;
    }

    /* Main Content */
    .main {
        flex: 1;
        display: flex;
        flex-direction: column;
    }

    /* Top bar */
    .topbar {
        background-color: #fff;
        padding: 15px 25px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .topbar .greeting {
        font-size: 18px;
        color: #333;
    }

    .topbar .search {
        display: flex;
        align-items: center;
        background-color: #f1f1f1;
        border-radius: 20px;
        padding: 5px 10px;
    }

    .topbar .search input {
        border: none;
        outline: none;
        background: none;
        padding: 5px;
        font-size: 14px;
    }

    .topbar .search i {
        color: gray;
    }

    /* Content area */
    .content {
        padding: 30px;
    }

    .content .card {
        background-color: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        text-align: center;
    }

    .add-btn {
        background-color: #5A47F0;
        color: white;
        border: none;
        border-radius: 25px;
        padding: 10px 25px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s ease;
    }

    .add-btn:hover {
        background-color: #4532d1;
    }
</style>
<!-- Icons from Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <div>
            <div class="logo">ClarityUI</div>
                <ul>
    <li class="active"><i class="fa fa-home"></i> Dashboard</li>
    <li><a href="Balances.jsp" style="text-decoration:none; color:inherit;"><i class="fa fa-wallet"></i> Balances</a></li>
    <li><a href="Transactions.jsp" style="text-decoration:none; color:inherit;"><i class="fa fa-exchange-alt"></i> Transactions</a></li>
    <li><a href="Bills.jsp" style="text-decoration:none; color:inherit;"><i class="fa fa-file-invoice"></i> Bills</a></li>
    <li><a href="Expenses.jsp" style="text-decoration:none; color:inherit;"><i class="fa fa-chart-pie"></i> Expenses</a></li>
    <li><a href="Goals.jsp" style="text-decoration:none; color:inherit;"><i class="fa fa-bullseye"></i> Goals</a></li>
</ul>

        </div>
        <div class="profile">
    <i class="fa fa-user-circle"></i> <%= session.getAttribute("UserName") %>
    <br><br>
    <a href="Logout.jsp" style="color:white; text-decoration:none;">
        <button style="background-color:#fff; color:#5A47F0; border:none; padding:8px 16px; border-radius:20px; cursor:pointer;">
            Logout
        </button>
    </a>
</div>

    </div>

    <!-- Main Area -->
    <div class="main">
        <!-- Top Bar -->
        <div class="topbar">
            <div class="greeting">
                Hi, <b>User</b><br>
                <small>October 25, 2025</small>
            </div>
            <div class="search">
                <i class="fa fa-bell" style="margin-right:10px;"></i>
                <input type="text" placeholder="Search here or ask me something...">
            </div>
        </div>

        <!-- Content -->
            <div class="content">
            
            <div class="card">
    <h2>Welcome, <%= userName %> 👋</h2>
    <p>Here’s your current account information:</p>

    <table style="margin:auto; border-collapse:collapse; margin-top:20px;">
        <tr>
            <td style="padding:10px;"><b>Card Name:</b></td>
            <td style="padding:10px;"><%= cardName %></td>
        </tr>
        <tr>
            <td style="padding:10px;"><b>Card Number:</b></td>
            <td style="padding:10px;"><%= cardNumber %></td>
        </tr>
        <tr>
            <td style="padding:10px;"><b>Card Holder:</b></td>
            <td style="padding:10px;"><%= cardHolder %></td>
        </tr>
        <tr>
            <td style="padding:10px;"><b>Balance:</b></td>
            <td style="padding:10px; color:#5A47F0; font-weight:bold;">₹ <%= String.format("%.2f", balance) %></td>
        </tr>
    </table>

    <br>
    <a href="AddAccount.jsp">
        <button class="add-btn">Add / Update Account</button>
    </a>
</div>
        </div>
       
    </div>

</body>
</html>
