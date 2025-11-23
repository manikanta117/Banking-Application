<%@ page import="java.sql.*" %>
<%
try {
    String Name = request.getParameter("UserName");
    String Password = request.getParameter("Password");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");

  
    PreparedStatement ps = con.prepareStatement("SELECT UserID FROM Details WHERE UserName=? AND Password=?");
    ps.setString(1, Name);
    ps.setString(2, Password);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        
        session = request.getSession(true);  

       
        session.setAttribute("UserID", rs.getInt("UserID"));
        session.setAttribute("UserName", Name);

        response.sendRedirect("AccountManagement.jsp");
    }
    else {
    
        response.sendRedirect("redirect.jsp");
    }

    rs.close();
    ps.close();
    con.close();
} catch (Exception ex) {
    out.print("<h3 style='color:red; text-align:center;'>Error: " + ex.getMessage() + "</h3>");
}
%>
