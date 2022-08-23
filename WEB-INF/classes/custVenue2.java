import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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



@WebServlet("/custVenue2")

public class custVenue2 extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
	public custVenue2() 
	{
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
        doPost(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			HttpSession session = request.getSession(true);
			String mail = (String)session.getAttribute("mail");

			try
			{
					String name = request.getParameter("custName");
					String caddr = request.getParameter("custAddr");

					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnection("database path","databse","password");
					Statement stmt = con.createStatement();
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					ResultSet rs3 = null;
					String query3;

					String query = "select * from Customer where cmail = '"+mail+"'";
					rs1 = stmt.executeQuery(query);
					while(rs1.next())
					{
						String query1 = "insert into Cust_Venue(cvname,cvaddr,cid,eid) values ('"+name+"','"+caddr+"','"+rs1.getString("cid")+"','"+session.getAttribute("id")+"')";
						stmt.executeUpdate(query1);
					}
							
					
				request.setAttribute("id",session.getAttribute("id"));
                request.setAttribute("message", "Successfull");
            }
			catch (Exception ex)
            {
                request.setAttribute("message", "File upload failed due to "+request.getAttribute("id")+" : " + ex);
            }
        request.getRequestDispatcher("/chooseServices.jsp").forward(request, response);
	}
}
