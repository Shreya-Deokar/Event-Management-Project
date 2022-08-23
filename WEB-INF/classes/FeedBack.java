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



@WebServlet("/FeedBack")

public class FeedBack extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
	public FeedBack() 
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
					HttpSession session = request.getSession(true);
					String mail = (String)session.getAttribute("mail");

					String name = request.getParameter("firstname");
					String email = request.getParameter("mailid");
					String feedback = request.getParameter("subject");

					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnection("database path","databse","password");
					Statement stmt = con.createStatement();
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					ResultSet rs3 = null;
					String query3;

					String query1 = "select cid from Customer where cmail='"+mail+"'";
					rs1 = stmt.executeQuery(query1);
					while(rs1.next())
					{
						query3 = "insert into FEEDBACK(CID,NAME,MAIL,FEEDBACK) values ('"+rs1.getInt("cid")+"','"+name+"','"+email+"','"+feedback+"')";
						stmt.executeUpdate(query3);
					}

				
                request.setAttribute("message", "Thank You For Your FEEDBACK");
            }
			catch (Exception ex)
            {
                request.setAttribute("message", "File upload failed due to : " + ex);
            }
        request.getRequestDispatcher("/customer_page.jsp").forward(request, response);
	}
}
