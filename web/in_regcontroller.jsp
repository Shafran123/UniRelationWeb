<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String appr = "0";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/deaass",
            "root", "");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into industry(username, password, appr) values ('" + user + "','" + pwd + "','" + appr + "')");
    if (i > 0) {
        int idd=0;
           ResultSet rs=st.executeQuery("select * from industry");
           if(rs.last()){
               idd=rs.getInt("id");
           }
           out.println("Your Login Industry Id : " +idd+ "<a href='in_log.jsp'> Go to Login</a>");
       
       
    } 
%>
