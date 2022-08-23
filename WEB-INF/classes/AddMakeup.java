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



@WebServlet("/AddMakeup")

public class AddMakeup extends HttpServlet 
{
	private final String UPLOAD_DIRECTORY = "C:/xampp/tomcat/webapps/Java_Project/Images";
    private static final long serialVersionUID = 1L;
	public AddMakeup() 
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
				
				String mname = null;
				String mphone = null;
				String mrate = null;
				String mphoto = null;
			
				String query7;
				
                List < FileItem > multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item: multiparts)
                {
					
					if(item.isFormField())
					{
						inputName = (String)item.getFieldName();
						if(inputName.equalsIgnoreCase("M_name"))
						{ 
							mname = (String)item.getString(); 
						}
						
						if(inputName.equalsIgnoreCase("M_Mobile"))
						{ 
							mphone = (String)item.getString(); 
						}
						
						if(inputName.equalsIgnoreCase("M_Rate"))
						{ 
							mrate = (String)item.getString(); 
						}
						
						
					}
					else
					{
						mphoto = new File(item.getName()).getName();
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + mphoto));
					}
					
					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnection("database path","databse","password");
					Statement stmt = con.createStatement();
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					
					String query = "insert into MakeupArtist(MNAME,MPHONE,MRATE) values('"+mname+"','"+mphone+"','"+mrate+"')";
					stmt.executeUpdate(query);

					String query1 = "insert into Makeup_Image(MImage) values ('"+mphoto+"')";
					stmt.executeUpdate(query1);

					String query2 = "delete from MakeupArtist where MRATE='null'";
					stmt.executeUpdate(query2);

					String query3 = "delete from Makeup_Image where MImage='null'";
					stmt.executeUpdate(query3);

					String query4 = "delete from MakeupArtist where MId not in(select min(MId) from MakeupArtist group by MNAME,MPHONE,MRATE)";
					stmt.executeUpdate(query4);

					String query5 = "select MId from MakeupArtist where MNAME='"+mname+"'";
					rs1 = stmt.executeQuery(query5);

					String query6 = "select MIid from Makeup_Image where MImage='"+mphoto+"'";
					rs2 = stmt.executeQuery(query6);

					while(rs1.next() && rs2.next())
					{
						query7 = "insert into Makeup_MImage(MId,MIid) values ('"+rs1.getInt("MId")+"','"+rs2.getInt("MIid")+"')";
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
        request.getRequestDispatcher("/Makeup_Artist.jsp").forward(request, response);
    }
}
