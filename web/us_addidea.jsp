
<%@ page import ="java.sql.*" %>
<%
    String ind = request.getParameter("user");    
    String idea = request.getParameter("idea");
    
    String dis = "";
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/deaass",
            "root", "");
    Statement st = con.createStatement();
    
    int i = st.executeUpdate("insert into ideahub(idea, user, comments) values ('" + idea + "','" + ind + "','" + dis + "')");
    if (i > 0) {
        
        response.sendRedirect("us_ideahub.jsp");
       
    } 
%>
