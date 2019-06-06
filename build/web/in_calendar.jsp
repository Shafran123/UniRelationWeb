

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
						
						<li class="nav-item active">
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
						<li class="nav-item">
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
						<h4 class="page-title">Industry Calendar</h4>
                        
                        
						
						
						
			<div class="row row-card-no-pd">
							
                            <div class="card">
									<div class="card-header">
										<div class="card-title">Industry Calendar</div>
									</div>
									<div class="card-body">
										
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>Date</th>
														<th>Industry</th>
														<th>Event</th>
														<th>Description</th>
														<th>Discussion</th>
                                                                                                                <th>Add Note</th>
														
													</tr>
												</thead>
												<tbody>
                                                                                                    
                                                                                                    <%
                                                                                                        int ac = 1000;
                                                                                                        while(ac>=0){
                                                                                                        String sql = "SELECT * FROM `incal` WHERE `id` ='"+ac+"'";
            
                                                                                                                ResultSet search = DB.search(sql);
                                                                                                                if (search.next()) {

                                                                                                                    String id = search.getString("id");
                                                                                                                    String date = search.getString("date");
                                                                                                                    String industry = search.getString("industry");
                                                                                                                    String event = search.getString("event");
                                                                                                                    String des = search.getString("des");
                                                                                                                    String dis = search.getString("dis");
                                                                                                                    


                                                                                                                     
                                                                                                                     out.println("<tr><td> " + date + "</td>");
                                                                                                                     out.println("<td> " + industry + "</td>");
                                                                                                                     out.println("<td> " + event + "</td>");
                                                                                                                     out.println("<td> " + des + "</td>");
                                                                                                                     out.println("<td> " + dis + "</td>");
                                                                                                                     out.println("<td><form method='post' action='in_addcaldis.jsp'> <textarea class='form-control' name='comi' id='comment' required></textarea><input type='hidden' name='user' value='"+session.getAttribute("in_name")+"'><br><input type='hidden' name='oldcom' value='" +dis+ "'><input type='hidden' name='idid' value='" +id+ "'><input type='submit' value='Add'></form></td></tr>");
                                                                                                                         
                                                                                                                     
                                                                                                                    

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
                        <div class="row">
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<div class="card-title">Add New Event</div>
									</div>
									<div class="card-body">
                                        <form method="post" action="in_addevent.jsp">
										<div class="form-group">
                                                                                    <label for="date">Event Date</label>
											<input type="hidden" name="industry" value="<%=session.getAttribute("in_name")%>">
											<input type="date" class="form-control" id="date" name="date" required>
											
										</div>
										<div class="form-group">
											
                                                                                    <input type="text" name="event" class="form-control" id="event" placeholder="Event" required>
										</div>
										
											
											
											<div class="form-group">
												<label for="comment">Description</label>
                                                                                                <textarea class="form-control" name="des" id="comment" rows="5" required>

												</textarea>
											</div>
											
										
										<div class="card-action">
                                                                                    <input type="submit" class="btn btn-success" value="Add">
											
										</div>
                                        </form>
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
