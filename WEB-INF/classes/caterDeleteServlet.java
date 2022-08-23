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



@WebServlet("/caterDeleteServlet")

public class caterDeleteServlet extends HttpServlet 
{
	//private final String UPLOAD_DIRECTORY = "C:/xampp/tomcat/webapps/Java_Project/Images";
    private static final long serialVersionUID = 1L;
	public caterDeleteServlet() 
	{
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
        doPost(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			try
			{
					String name = request.getParameter("cname");
					String id = request.getParameter("id");

					String query = "delete from Item where iname = '"+name+"' and iid = '"+id+"'";
					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
					Statement stmt = con.createStatement();
					stmt.executeUpdate(query);
				
                request.setAttribute("message", "Deleted successfully.");
            }
			catch (Exception ex)
            {
                request.setAttribute("message", "File upload failed due to : " + ex);
            }
        request.getRequestDispatcher("/catering.jsp").forward(request, response);
	}
}