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



@WebServlet("/AddCater")

public class AddCater extends HttpServlet 
{
	private final String UPLOAD_DIRECTORY = "C:/xampp/tomcat/webapps/Java_Project/Images";
    private static final long serialVersionUID = 1L;
	public AddCater() 
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
				
				String iname = null;
				String itype = null;
				String iprice = null;
				String iphoto = null;
			
				String query7;
				
                List < FileItem > multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item: multiparts)
                {
					
					if(item.isFormField())
					{
						inputName = (String)item.getFieldName();
						if(inputName.equalsIgnoreCase("I_name"))
						{ 
							iname = (String)item.getString(); 
						}
						
						if(inputName.equalsIgnoreCase("I_type"))
						{ 
							itype = (String)item.getString(); 
						}
						
						if(inputName.equalsIgnoreCase("I_price"))
						{ 
							iprice = (String)item.getString(); 
						}
						
					}
					else
					{
						iphoto = new File(item.getName()).getName();
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + iphoto));
					}
					
					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnectio("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
					Statement stmt = con.createStatement();
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					
					String query = "insert into Item(INAME,ITYPE,IPRICE) values('"+iname+"','"+itype+"','"+iprice+"')";
					stmt.executeUpdate(query);

					String query1 = "insert into Item_Image(IImage) values ('"+iphoto+"')";
					stmt.executeUpdate(query1);

					String query2 = "delete from Item where IPRICE='null'";
					stmt.executeUpdate(query2);

					String query3 = "delete from Item_Image where IImage='null'";
					stmt.executeUpdate(query3);

					String query4 = "delete from Item where IId not in(select min(IId) from Item group by INAME,ITYPE,IPRICE)";
					stmt.executeUpdate(query4);

					String query5 = "select IId from Item where INAME='"+iname+"' and ITYPE = '"+itype+"' and IPRICE = '"+iprice+"'";
					rs1 = stmt.executeQuery(query5);

					String query6 = "select IIid from Item_Image where IImage='"+iphoto+"'";
					rs2 = stmt.executeQuery(query6);

					while(rs1.next() && rs2.next())
					{
						query7 = "insert into Item_IImage(IId,IIid) values ('"+rs1.getInt("IId")+"','"+rs2.getInt("IIid")+"')";
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
        request.getRequestDispatcher("/catering.jsp").forward(request, response);
    }
}