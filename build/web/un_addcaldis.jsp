

<%@ page import ="java.sql.*" %>
<%
    String id = request.getParameter("idid");    
    String comi = request.getParameter("comi");
    String user = request.getParameter("user");
    String oldcom = request.getParameter("oldcom");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/deaass",
            "root", "");
    Statement st = con.createStatement();
    
    int i = st.executeUpdate("UPDATE `incal` SET `dis` = '"+oldcom+"<br><b>"+user+" : </b>"+comi+"' where `id` = '"+id+"'");
    if (i > 0) {
        
        response.sendRedirect("un_incalendar.jsp");
       
    } 
%>
