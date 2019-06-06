
<%@ page import ="java.sql.*" %>
<%
    String id = request.getParameter("id");
    int k = 1;
    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/deaass",
            "root", "");
    Statement st = con.createStatement();
    
    int i = st.executeUpdate("UPDATE `users` SET `apr` = '"+k+"' where `id` = '"+id+"'");
    if (i > 0) {
        
        response.sendRedirect("admin.jsp");
       
    } 
%>
