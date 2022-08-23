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



@WebServlet("/occasion")

public class occasion extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
	public occasion() 
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

					String occasion_type = request.getParameter("occasion");
					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnection("database path","databse","password");
					Statement stmt = con.createStatement();
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					ResultSet rs3 = null;
					String query3;

					String query = "insert into Event(occasion) values ('"+occasion_type+"')";
					stmt.executeUpdate(query);

					String query1 = "select cid from Customer where cmail='"+mail+"'";
					rs1 = stmt.executeQuery(query1);

					String query2 = "select eid from Event where occasion = '"+occasion_type+"'";
					rs2 = stmt.executeQuery(query2);

					while(rs1.next() && rs2.next())
					{
						query3 = "insert into customer_event(cid,eid) values ('"+rs1.getInt("cid")+"','"+rs2.getInt("eid")+"')";
						stmt.executeUpdate(query3);
					}	

					String query4 = "select eid from Event where occasion = '"+occasion_type+"'";
					rs3 = stmt.executeQuery(query4);
					while(rs3.next())
					{
						session.setAttribute("id",rs3.getInt("eid"));
					}

				
                request.setAttribute("message", "You have Selected '"+occasion_type+"' Occasion");
            }
			catch (Exception ex)
            {
                request.setAttribute("message", "File upload failed due to : " + ex);
            }
        request.getRequestDispatcher("/eventDetail.jsp").forward(request, response);
	}
}
