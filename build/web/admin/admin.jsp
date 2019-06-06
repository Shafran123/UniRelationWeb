

<%@page import="java.sql.ResultSet"%>
<%@page import="controller.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            if ((session.getAttribute("admin_name") == null) || (session.getAttribute("admin_pass") == "")) {
                response.sendRedirect("index.jsp");
            } 
            
        %> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UNICV - Admin Panel</title>
    </head>
    <body>
        <h1>Admin Panel</h1>
        <hr><br><hr><br>
        <h2>Industries</h2>
        <hr>
        <table>
            <thead>
                <tr>
                    <th>Industry Name</th>
                    <th>Approval</th>
                    
                </tr>
            </thead>
            <tbody>
                
                    <%  int ac = 1000;
                        int dc = 0;
                        while(ac<=2000){
                        String sql = "SELECT * FROM `industry` WHERE `id` ='"+ac+"' AND `appr` ='"+dc+"' ";
                        ResultSet search = DB.search(sql);
                        if (search.next()) {
                                                                               
                            String uname = search.getString("username");
                            String id = search.getString("id");
                            
                            out.println("<tr><td> " + uname + "</td>");
                            
                            
                            out.println("<td><form method='post' action='admin_appr.jsp'> <input type='hidden' name='id' value='" +id+ "'><input type='submit' value='Approve'></form></td></tr>");   
                            }
                            ac++;
                        }
                                                                                                        
                            %>
                    
                
            </tbody>
        </table>
        <br><hr><br>
        <h2>Universities</h2>
        <hr>
        <table>
            <thead>
                <tr>
                    <th>University Name</th>
                    <th>Approval</th>
                    
                </tr>
            </thead>
            <tbody>
                
                    <%  int au = 1000;
                        int du = 0;
                        while(au<=2000){
                        String sql = "SELECT * FROM `university` WHERE `id` ='"+au+"' AND `appr` ='"+du+"' ";
                        ResultSet search = DB.search(sql);
                        if (search.next()) {
                                                                               
                            String uiname = search.getString("username");
                            String iid = search.getString("id");
                            
                            out.println("<tr><td> " + uiname + "</td>");
                            
                            
                            out.println("<td><form method='post' action='admin_unappr.jsp'> <input type='hidden' name='id' value='" +iid+ "'><input type='submit' value='Approve'></form></td></tr>");   
                            }
                            au++;
                        }
                                                                                                        
                            %>
                    
                
            </tbody>
        </table>
        <br><hr><br>
        <h2>Users</h2>
        <hr>
        <table>
            <thead>
                <tr>
                    <th>User Name</th>
                    <th>Approval</th>
                    
                </tr>
            </thead>
            <tbody>
                
                    <%  int xu = 1000;
                        int yu = 0;
                        while(xu<=2000){
                        String sql = "SELECT * FROM `users` WHERE `id` ='"+xu+"' AND `apr` ='"+yu+"' ";
                        ResultSet search = DB.search(sql);
                        if (search.next()) {
                                                                               
                            String uiiname = search.getString("username");
                            String iiid = search.getString("id");
                            
                            out.println("<tr><td> " + uiiname + "</td>");
                            
                            
                            out.println("<td><form method='post' action='admin_usappr.jsp'> <input type='hidden' name='id' value='" +iiid+ "'><input type='submit' value='Approve'></form></td></tr>");   
                            }
                            xu++;
                        }
                                                                                                        
                            %>
                    
                
            </tbody>
        </table>
    </body>
</html>
