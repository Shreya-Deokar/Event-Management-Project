<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String name = request.getParameter("M_Name");
String phone = request.getParameter("M_Mobile");
String rate = request.getParameter("M_Rate");


Connection con = null;
PreparedStatement ps = null;
try
{
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb","postgres","mcasc05");
		String sql="Update MakeupArtist set mname='"+name+"', mphone='"+phone+"',mrate='"+rate+"' where mname = '"+name+"' ";
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