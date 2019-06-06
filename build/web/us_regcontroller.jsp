<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String unid = request.getParameter("unid");
    String appr = "0";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/deaass",
            "root", "");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into users(username, password, apr, uniid) values ('" + user + "','" + pwd + "','" + appr + "','" + unid + "')");
    if (i > 0) {
        int idd=0;
           ResultSet rs=st.executeQuery("select * from users");
           if(rs.last()){
               idd=rs.getInt("id");
           }
           out.println("Your Login User Id : " +idd+ "<a href='us_log.jsp'> Go to Login</a>");
       
       
    } 
%>
