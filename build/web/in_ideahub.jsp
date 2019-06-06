

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controller.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            if ((session.getAttribute("in_id") == null) || (session.getAttribute("in_pass") == "")) {
                response.sendRedirect("in_log.jsp");
            } 
            
        %>        
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uni-Industry</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="assets/css/ready.css">
	<link rel="stylesheet" href="assets/css/demo.css">
    </head>
    <body>
        <div class="wrapper">
		<div class="main-header">
			<div class="logo-header">
				<a href="in_calendar.jsp" class="logo">
					Uni-Industry
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<button class="topbar-toggler more"><i class="la la-ellipsis-v"></i></button>
			</div>
			
			</div>
			<div class="sidebar">
				<div class="scrollbar-inner sidebar-wrapper">
					<div class="user">
						<div class="photo">
							<img src="assets/img/profile.jpg">
						</div>
						<div class="info">
							<a class="" data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									<%=session.getAttribute("in_name")%>  
									<span class="user-level">Industry</span>
									
								</span>
							</a>
							

							
						</div>
					</div>
					<ul class="nav">
						
						<li class="nav-item">
							<a href="in_calendar.jsp">
								<i class="la la-table"></i>
								<p>Industry Calendar</p>
								
							</a>
						</li>
						<li class="nav-item">
							<a href="in_uncalendar.jsp">
								<i class="la la-keyboard-o"></i>
								<p>University Calendar</p>
								
							</a>
						</li>
						<li class="nav-item active">
							<a href="in_ideahub.jsp">
								<i class="la la-th"></i>
								<p>Student Area</p>
								
							</a>
						</li>
						
						
						<li class="nav-item update-pro">
							<a href="in_logout.jsp" >
								<i class="la la-hand-pointer-o"></i>
								Logout
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">Student Area</h4>
                        
                        
						
						
						
			<div class="row row-card-no-pd">
							
                            <div class="card">
									<div class="card-header">
										<div class="card-title">Browse Feeds</div>
									</div>
									<div class="card-body">
										
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>User</th>
														<th>Idea</th>
														<th>Comments</th>
														<th>Add Comment</th>
                                                                                                                <th>Add Image</th>
														
														
													</tr>
												</thead>
												<tbody>
                                                                                                    
                                                                                                    <%
                                                                                                        int ac = 1000;
                                                                                                        while(ac>=0){
                                                                                                        String sql = "SELECT * FROM `ideahub` WHERE `id` ='"+ac+"'";
            
                                                                                                                ResultSet search = DB.search(sql);
                                                                                                                if (search.next()) {
                                                                                                                    
                                                                                                                    String idid = search.getString("id");
                                                                                                                    String user = search.getString("user");
                                                                                                                    String idea = search.getString("idea");
                                                                                                                    String comments = search.getString("comments");
                                                                                                                    
                                                                                                                    


                                                                                                                     out.println("<tr><td> " + user + "</td>");
                                                                                                                     out.println("<td> " + idea + "</td>");
                                                                                                                     out.println("<td> " + comments + "</td>");
                                                                                                                     if(request.getParameter("vari")==null){
                                                                                                                     out.println("<td><form method='post' action='in_adcom.jsp'> <textarea class='form-control' name='comi' id='comment' required></textarea><input type='hidden' name='user' value='"+session.getAttribute("in_name")+"'><br><input type='hidden' name='oldcom' value='" +comments+ "'><input type='hidden' name='idid' value='" +idid+ "'><input type='submit' value='Add'></form></td>");   
                                                                                                                     }
                                                                                                                     else{
                                                                                                                     out.println("<td><form method='post' action='in_adcom.jsp'> <textarea class='form-control' name='comi' id='comment' required><img src=\"http://localhost/dea/"+request.getParameter("vari")+"\" style=\"width:150x;height:150px;\"></textarea><input type='hidden' name='user' value='"+session.getAttribute("in_name")+"'><br><input type='hidden' name='oldcom' value='" +comments+ "'><input type='hidden' name='idid' value='" +idid+ "'><input type='submit' value='Add'></form></td>");   
                                                                                                                     }
                                                                                                                     
                                                                                                                     out.println("<td><form method='post' enctype='multipart/form-data' action='in_imgup.jsp'> <input type='file' name='file' required><input type='submit' value='Import Image'></form></td></tr>");
                                                                                                                         
                                                                                                                     
                                                                                                                    

                                                                                                                }
                                                                                                                ac--;
                                                                                                        }
                                                                                                        
                                                                                                        %>
                                                                                        
                                                                                                </tbody>
                                                                                        </table>
													
										</div>
									</div>
								</div>
							
							
						</div>
                        
						
					</div>
				</div>
                
				<footer class="footer">
					<div class="container-fluid">
						
						<div class="copyright ml-auto">
							2019, NSBM <i class="la la-heart heart text-danger"></i> SOFT225SL
						</div>				
					</div>
				</footer>
			</div>
		</div>
	</div>
	
	
</body>
<script src="assets/js/core/jquery.3.2.1.min.js"></script>
<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="assets/js/core/popper.min.js"></script>
<script src="assets/js/core/bootstrap.min.js"></script>
<script src="assets/js/plugin/chartist/chartist.min.js"></script>
<script src="assets/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="assets/js/plugin/chart-circle/circles.min.js"></script>
<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="assets/js/ready.min.js"></script>
<script src="assets/js/demo.js"></script>
</html>
