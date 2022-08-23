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



@WebServlet("/selectPhotographer1")

public class selectPhotographer1 extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
	public selectPhotographer1() 
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

			try
			{

					String name = request.getParameter("pname");
					String id =request.getParameter("id");

					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnection("database path","databse","password");
					Statement stmt = con.createStatement();
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					ResultSet rs3 = null;
					String query3;

					String query1 = "select pid from photographer where pname = '"+name+"' and pid = '"+id+"'";
					rs1 = stmt.executeQuery(query1);
					while(rs1.next())
					{
					String query = "update Event set photographer_name='"+rs1.getInt("pid")+"' where eid='"+session.getAttribute("id")+"'";
					stmt.executeUpdate(query);
					}
				
					session.setAttribute("id",session.getAttribute("id"));

                request.setAttribute("message", "Successfull");
            }
			catch (Exception ex)
            {
                request.setAttribute("message", "File upload failed due to "+request.getAttribute("id")+" : " + ex);
            }
        request.getRequestDispatcher("/chooseServices.jsp").forward(request, response);
	}
}
