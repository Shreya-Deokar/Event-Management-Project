<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String name = request.getParameter("V_name");
String Approx_Capacity = request.getParameter("V_capacity");
String address = request.getParameter("V_addr");
String state = request.getParameter("V_state");
String district = request.getParameter("V_dist");
String city = request.getParameter("V_city");
String area = request.getParameter("V_area");
String preff = request.getParameter("V_preff");
String rate = request.getParameter("V_rate");
String phone = request.getParameter("V_phone");
String email = request.getParameter("V_email");

Connection con = null;
PreparedStatement ps = null;
try
{
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb","postgres","mcasc05");
		String sql="Update Venue set vname='"+name+"', vcapacity='"+Approx_Capacity+"', vaddress='"+address+"',vstate='"+state+"',vdistrict='"+district+"',vcity='"+city+"',varea='"+area+"',vphone='"+phone+"',vemail='"+email+"' where vname = '"+name+"' ";
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