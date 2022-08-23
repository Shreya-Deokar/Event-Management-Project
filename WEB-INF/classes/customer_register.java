import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.sql.*;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;



@WebServlet("/customer_register")

public class customer_register extends HttpServlet 
{
	private final String UPLOAD_DIRECTORY = "C:/xampp/tomcat/webapps/Java_Project/Images";
    private static final long serialVersionUID = 1L;
	public customer_register() 
	{
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
        doPost(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		try
		{
			String cname = request.getParameter("C_Name");
			String cmail = request.getParameter("C_Mail");
			String cphone = request.getParameter("C_Mobile");
			String caddress = request.getParameter("C_Addr");
			String cpassword = request.getParameter("C_Psw");
			String cbook = request.getParameter("C_Book");
			String cflower = request.getParameter("C_Flower");
			String cnumber = request.getParameter("C_Number");

					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
					Statement stmt = con.createStatement();
					
					String query = "insert into Customer(CNAME,CMAIL,CPHONE,CADDRESS,CPASSWORD,CBOOK,CFLOWER,CNUMBER) values('"+cname+"','"+cmail+"','"+cphone+"','"+caddress+"','"+cpassword+"','"+cbook+"','"+cflower+"','"+cnumber+"')";
					stmt.executeUpdate(query);

				request.setAttribute("message", "Registered Successfully Now You can Login with Registered Email and Password!!!!");
        }
		catch (Exception ex)
        {
                request.setAttribute("message", "File upload failed due to : " + ex);
        }
        request.getRequestDispatcher("/customer.jsp").forward(request, response);
    }
}