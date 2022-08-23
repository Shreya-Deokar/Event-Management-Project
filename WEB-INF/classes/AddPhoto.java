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



@WebServlet("/AddPhoto")

public class AddPhoto extends HttpServlet 
{
	private final String UPLOAD_DIRECTORY = "C:/xampp/tomcat/webapps/Java_Project/Images";
    private static final long serialVersionUID = 1L;
	public AddPhoto() 
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
        if (ServletFileUpload.isMultipartContent(request))
        {
            try
            {
				
				String inputName = null;
				
				String pname = null;
				String ppreff = null;
				String prate = null;
				String pphone = null;
				String pphoto = null;
				
			
				String query7;
				
                List < FileItem > multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item: multiparts)
                {
					
					if(item.isFormField())
					{
						inputName = (String)item.getFieldName();
						if(inputName.equalsIgnoreCase("P_name"))
						{ 
							pname = (String)item.getString(); 
						}
						
						if(inputName.equalsIgnoreCase("P_preff"))
						{ 
							ppreff = (String)item.getString(); 
						}

						if(inputName.equalsIgnoreCase("P_Rate"))
						{ 
							prate = (String)item.getString(); 
						}
						
						if(inputName.equalsIgnoreCase("P_Mobile"))
						{ 
							pphone = (String)item.getString(); 
						}
						
						
					}
					else
					{
						pphoto = new File(item.getName()).getName();
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + pphoto));
					}
					
					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
					Statement stmt = con.createStatement();
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					
					String query = "insert into Photographer(PNAME,PPREFF,PRATE,PPHONE) values('"+pname+"','"+ppreff+"','"+prate+"','"+pphone+"')";
					stmt.executeUpdate(query);

					String query1 = "insert into Photo_Image(PImage) values ('"+pphoto+"')";
					stmt.executeUpdate(query1);

					String query2 = "delete from Photographer where PPHONE='null'";
					stmt.executeUpdate(query2);

					String query3 = "delete from Photo_Image where PImage='null'";
					stmt.executeUpdate(query3);

					String query4 = "delete from Photographer where PId not in(select min(PId) from Photographer group by PNAME,PPREFF,PRATE,PPHONE)";
					stmt.executeUpdate(query4);

					String query5 = "select PId from Photographer where PNAME='"+pname+"' and PPREFF = '"+ppreff+"'";
					rs1 = stmt.executeQuery(query5);

					String query6 = "select PIid from Photo_Image where PImage='"+pphoto+"'";
					rs2 = stmt.executeQuery(query6);

					while(rs1.next() && rs2.next())
					{
						query7 = "insert into Photo_PImage(PId,PIid) values ('"+rs1.getInt("PId")+"','"+rs2.getInt("PIid")+"')";
						stmt.executeUpdate(query7);
					}
                }

				request.setAttribute("message", "Your Data Inserted Successfully");
            }
			catch (Exception ex)
            {
                request.setAttribute("message", "File upload failed due to : " + ex);
            }
        } 
		else
        {
            request.setAttribute("message", "Sorry this servlet only handles file upload request.");
        }
        request.getRequestDispatcher("/photographer.jsp").forward(request, response);
    }
}