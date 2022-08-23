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



@WebServlet("/eventDetail")

public class eventDetail extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
	public eventDetail() 
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
					String occasion_type = request.getParameter("occasion");
					String From_Time = request.getParameter("E_Time1");
					String To_Time = request.getParameter("E_Time2");
					String Date = request.getParameter("E_Date");
					String People = request.getParameter("E_People");

					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
					Statement stmt = con.createStatement();
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					ResultSet rs3 = null;
					String query3;

					String query = "insert into Event(occasion,fromtime,totime,date,approx_people,approval) values ('"+occasion_type+"','"+From_Time+"','"+To_Time+"','"+Date+"','"+People+"','Not Approved')";
					stmt.executeUpdate(query);

					String query1 = "select cid from Customer where cmail='"+mail+"'";
					rs1 = stmt.executeQuery(query1);

					String query2 = "select eid from Event where occasion = '"+occasion_type+"' and fromtime='"+From_Time+"' and totime='"+To_Time+"' and date='"+Date+"' and approx_people='"+People+"'";
					rs2 = stmt.executeQuery(query2);

					while(rs1.next() && rs2.next())
					{
						query3 = "insert into customer_event(cid,eid) values ('"+rs1.getInt("cid")+"','"+rs2.getInt("eid")+"')";
						stmt.executeUpdate(query3);
					}

					String query4 = "select eid from Event where occasion = '"+occasion_type+"' and fromtime='"+From_Time+"' and totime='"+To_Time+"' and date='"+Date+"' and approx_people='"+People+"'";
					rs3 = stmt.executeQuery(query2);

					while(rs3.next())
					{
						session.setAttribute("id",rs3.getInt("eid"));
					}			
					

                request.setAttribute("message", "Successfull");
            }
			catch (Exception ex)
            {
                request.setAttribute("message", "File upload failed due to "+request.getAttribute("id")+" : " + ex);
            }
        request.getRequestDispatcher("/service.jsp").forward(request, response);
	}
}