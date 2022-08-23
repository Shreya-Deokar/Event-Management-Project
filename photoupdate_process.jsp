<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String name = request.getParameter("P_Name");
String preff = request.getParameter("P_preff");
String rate = request.getParameter("P_Rate");
String phone = request.getParameter("P_Mobile");


Connection con = null;
PreparedStatement ps = null;
try
{
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb","postgres","mcasc05");
		String sql="Update Photographer set pname='"+name+"',ppreff='"+preff+"',prate='"+rate+"',pphone='"+phone+"' where pname = '"+name+"' ";
		ps = con.prepareStatement(sql);

			int i = ps.executeUpdate();
			if(i > 0)
			{
					out.print("Record Updated Successfully");
			}
			else
			{
				out.print("There is a problem in updating Record.");
			}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
%>