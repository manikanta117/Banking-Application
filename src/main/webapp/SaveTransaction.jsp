<%@ page import="java.sql.*" %>
<%
try {
    int userId = Integer.parseInt(request.getParameter("UserID"));
    String item = request.getParameter("Item");
    String goal = request.getParameter("Goal");
    String accountName = request.getParameter("AccountName");
    String dateOfPayment = request.getParameter("DateOfPayment");
    String paymentType = request.getParameter("PaymentType");
    double amount = Double.parseDouble(request.getParameter("Amount"));

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO Transactions (UserID, Item, Goal, AccountName, DateOfPayment, PaymentType, Amount) VALUES (?, ?, ?, ?, ?, ?, ?)"
    );
    ps.setInt(1, userId);
    ps.setString(2, item);
    ps.setString(3, goal);
    ps.setString(4, accountName);
    ps.setString(5, dateOfPayment);
    ps.setString(6, paymentType);
    ps.setDouble(7, amount);

    int i = ps.executeUpdate();

    if (i > 0) {
        response.sendRedirect("Transactions.jsp");
    } else {
        out.println("<h3 style='color:red;text-align:center;'>Failed to save transaction. Try again.</h3>");
    }

    ps.close();
    con.close();
} catch (Exception e) {
    out.print("<h3 style='color:red;text-align:center;'>Error: " + e.getMessage() + "</h3>");
}
%>
