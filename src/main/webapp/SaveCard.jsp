<%@ page import="java.sql.*" %>
<%
try {
    // Retrieve form data
    int userId = Integer.parseInt(request.getParameter("UserID"));
    String cardName = request.getParameter("CardName");
    String cardNumber = request.getParameter("CardNumber");
    String cardHolderName = request.getParameter("CardHolderName");
    String cvv = request.getParameter("CVV");
    String expiryDate = request.getParameter("ExpiryDate") + "-01"; 
    Double balance = Double.parseDouble(request.getParameter("Balance"));
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");

 
    PreparedStatement ps = con.prepareStatement(
    		"INSERT INTO CardDetails (UserID, CardName, CardNumber, CardHolderName, CVV, ExpiryDate, Balance) VALUES (?, ?, ?, ?, ?, ?, ?)"
    	    );
    

    ps.setInt(1, userId);
    ps.setString(2, cardName);
    ps.setString(3, cardNumber);
    ps.setString(4, cardHolderName);
    ps.setString(5, cvv);
    ps.setString(6, expiryDate);
    ps.setDouble(7, balance);
    int i = ps.executeUpdate();

    if (i > 0) {
     
        response.sendRedirect("AccountManagement.jsp");
    } else {
        out.println("<h3 style='color:red;text-align:center;'>Failed to add card. Please try again.</h3>");
    }

    ps.close();
    con.close();
} catch (Exception e) {
    out.print("<h3 style='color:red;text-align:center;'>Error: " + e.getMessage() + "</h3>");
}
%>
