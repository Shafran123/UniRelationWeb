

<%@ page import ="java.sql.*" %>
<%
    String ind = request.getParameter("industry");    
    String evn = request.getParameter("event");
    String date = request.getParameter("date");
    String des = request.getParameter("des");
    String dis = "";
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/deaass",
            "root", "");
    Statement st = con.createStatement();
    
    int i = st.executeUpdate("insert into incal(industry, event, des, date, dis) values ('" + ind + "','" + evn + "','" + des + "','" + date + "','" + dis + "')");
    if (i > 0) {
        
        response.sendRedirect("in_calendar.jsp");
       
    } 
%>
