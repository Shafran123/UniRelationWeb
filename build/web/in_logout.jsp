

<%
session.setAttribute("in_id", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
