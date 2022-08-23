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



@WebServlet("/selectCater")

public class selectCater extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
	public selectCater() 
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

					String name = request.getParameter("iname");

					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
					Statement stmt = con.createStatement();
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					ResultSet rs3 = null;
					String query3;
					String query5;

					String query1 = "insert into Menu(eid) values ('"+session.getAttribute("id")+"')";
					stmt.executeUpdate(query1);

					String query2 = "select * from Menu where eid = '"+session.getAttribute("id")+"'";
					rs2 = stmt.executeQuery(query2);
					while(rs2.next())
					{
						query3 = "insert into Menu_Item(Meid) values ('"+rs2.getInt("Meid")+"')";
						stmt.executeUpdate(query3);
					}
						String query4 = "select iid from Item where iname = '"+name+"'";
						rs1 = stmt.executeQuery(query4);
						while(rs1.next() && rs2.next())
						{
							query5 = "update Menu_Item set Iid ='"+rs1.getInt("iid")+"' where Meid='"+rs2.getInt("Meid")+"'";
							stmt.executeUpdate(query5);
						}
					
				
					session.setAttribute("id",session.getAttribute("id"));

                request.setAttribute("message", "Successfull");
            }
			catch (Exception ex)
            {
                request.setAttribute("message", "File upload failed due to : " + ex);
            }
        request.getRequestDispatcher("/selectCater.jsp").forward(request, response);
	}
}