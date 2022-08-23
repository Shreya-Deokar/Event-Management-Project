<!DOCTYPE HTML>

<html>

<body>

<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

response.setHeader("Pragma", "no-cache"); 

response.setDateHeader("Expires", 0); 

if(session.getAttribute("mail")==null)
	response.sendRedirect("index.jsp");

%>
<%
response.sendRedirect("index.jsp");
%>
</body>

</html>