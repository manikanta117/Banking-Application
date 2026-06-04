<%@ page import="java.sql.*" %>

<%
    // Only logged-in users
    Integer userId = (Integer) session.getAttribute("UserID");

    if (userId == null) {
        response.sendRedirect("Index.jsp");
        return;
    }

    // Read form data
    String cardName = request.getParameter("CardName");
    String cardNumber = request.getParameter("CardNumber");
    String cardHolder = request.getParameter("CardHolderName");
    String cvv = request.getParameter("CVV");
    String expiry = request.getParameter("ExpiryDate");
    double balance = Double.parseDouble(request.getParameter("Balance"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");

        // Check if record already exists
        PreparedStatement check = con.prepareStatement(
            "SELECT * FROM CardDetails WHERE UserID=?"
        );
        check.setInt(1, userId);
        ResultSet rs = check.executeQuery();

        if (rs.next()) {
            // UPDATE existing card
            PreparedStatement ps = con.prepareStatement(
                "UPDATE CardDetails SET CardName=?, CardNumber=?, CardHolderName=?, CVV=?, ExpiryDate=?, Balance=? WHERE UserID=?"
            );
            ps.setString(1, cardName);
            ps.setString(2, cardNumber);
            ps.setString(3, cardHolder);
            ps.setString(4, cvv);
            ps.setString(5, expiry);
            ps.setDouble(6, balance);
            ps.setInt(7, userId);
            ps.executeUpdate();
            ps.close();

        } else {
            // INSERT new card
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO CardDetails (UserID, CardName, CardNumber, CardHolderName, CVV, ExpiryDate, Balance) VALUES (?, ?, ?, ?, ?, ?, ?)"
            );
            ps.setInt(1, userId);
            ps.setString(2, cardName);
            ps.setString(3, cardNumber);
            ps.setString(4, cardHolder);
            ps.setString(5, cvv);
            ps.setString(6, expiry);
            ps.setDouble(7, balance);
            ps.executeUpdate();
            ps.close();
        }

        rs.close();
        check.close();
        con.close();

        // Redirect back to dashboard
        response.sendRedirect("AccountManagement.jsp");

    } catch (Exception e) {
        out.print("<h3 style='color:red;text-align:center;'>Error: " + e.getMessage() + "</h3>");
    }
%>
