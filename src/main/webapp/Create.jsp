<%@ page import="java.sql.*" %>
<%
try {
    String Name = request.getParameter("UserName");
    String Password = request.getParameter("Password");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
    PreparedStatement ps = con.prepareStatement("INSERT INTO Details (UserName, Password) VALUES (?, ?)");
    ps.setString(1, Name);
    ps.setString(2, Password);

    int i = ps.executeUpdate();

    if (i > 0) {
        response.sendRedirect("ComformedRegistration.jsp"); 
    } else {
        out.print("Please try again");
    }

    ps.close();
    con.close();
} catch (Exception ex) {
    out.print(ex);
}
%>
