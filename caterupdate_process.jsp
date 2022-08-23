<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String name = request.getParameter("I_name");
String type = request.getParameter("I_type");
String price = request.getParameter("I_price");


Connection con = null;
PreparedStatement ps = null;
try
{
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb","postgres","mcasc05");
		String sql="Update Item set iname='"+name+"',itype='"+type+"',iprice='"+price+"' where iname = '"+name+"' ";
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