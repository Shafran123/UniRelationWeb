

<%@ page import ="java.sql.*" %>
<%
    String ind = request.getParameter("industry");    
    String evn = request.getParameter("event");
    String date = request.getParameter("date");
    String des = request.getParameter("des");
    String uniid = request.getParameter("uniid");
    String dis = "";
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/deaass",
            "root", "");
    Statement st = con.createStatement();
    
    int i = st.executeUpdate("insert into inuncal(university, event, des, date, dis, uniid) values ('" + ind + "','" + evn + "','" + des + "','" + date + "','" + dis + "','" + uniid + "')");
    if (i > 0) {
        
        response.sendRedirect("my_calendar.jsp");
       
    } 
%>
