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



@WebServlet("/AddDecoration")

public class AddDecoration extends HttpServlet 
{
	private final String UPLOAD_DIRECTORY = "C:/xampp/tomcat/webapps/Java_Project/Images";
    private static final long serialVersionUID = 1L;
	public AddDecoration() 
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
				String dname = null;
				String dtype = null;
				String drate = null;
				String dphoto = null;
				String query7;
				
                List < FileItem > multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item: multiparts)
                {
					
					if(item.isFormField())
					{
						inputName = (String)item.getFieldName();
						if(inputName.equalsIgnoreCase("D_Name"))
						{ 
							dname = (String)item.getString(); 
						}

						if(inputName.equalsIgnoreCase("D_Type"))
						{ 
							dtype = (String)item.getString(); 
						}

						if(inputName.equalsIgnoreCase("D_Rate"))
						{ 
							drate = (String)item.getString(); 
						}
						
					}
					else
					{
						dphoto = new File(item.getName()).getName();
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + dphoto));
					}
					
					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
					Statement stmt = con.createStatement();
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					
					String query = "insert into Decoration(DNAME,DTYPE,DRATE) values('"+dname+"','"+dtype+"','"+drate+"')";
					stmt.executeUpdate(query);

					String query1 = "insert into Decoration_Image(DImage) values ('"+dphoto+"')";
					stmt.executeUpdate(query1);

					String query2 = "delete from Decoration where DRate='null'";
					stmt.executeUpdate(query2);

					String query3 = "delete from Decoration_Image where DImage='null'";
					stmt.executeUpdate(query3);

					String query4 = "delete from Decoration where DId not in(select min(DId) from Decoration group by DNAME,DTYPE,DRATE)";
					stmt.executeUpdate(query4);

					String query5 = "select DId from Decoration where DNAME='"+dname+"' and DTYPE = '"+dtype+"' and DRATE = '"+drate+"'";
					rs1 = stmt.executeQuery(query5);

					String query6 = "select DIid from Decoration_Image where DImage='"+dphoto+"'";
					rs2 = stmt.executeQuery(query6);

					while(rs1.next() && rs2.next())
					{
						query7 = "insert into Decoration_DImage(DId,DIid) values ('"+rs1.getInt("DId")+"','"+rs2.getInt("DIid")+"')";
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
        request.getRequestDispatcher("/decoration.jsp").forward(request, response);
    }
}