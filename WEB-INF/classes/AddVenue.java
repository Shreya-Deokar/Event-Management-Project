import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.List;

import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



@WebServlet("/AddVenue")

public class AddVenue extends HttpServlet 
{
	private final String UPLOAD_DIRECTORY = "C:/xampp/tomcat/webapps/Java_Project/Images";
    private static final long serialVersionUID = 1L;
	public AddVenue() 
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
				String inputName1 = null;
				String vname = null;
				String vcapacity = null;
				String vaddress = null;
				String vstate = null;
				String vdistrict = null;
				String vcity = null;
				String varea = null;
				String vpreffernce = null;
				String vrate = null;
				String vphone = null;
				String vmail = null;
				String vphoto = null;
				
                List < FileItem > multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item: multiparts)
                {
					
					if(item.isFormField())
					{
						inputName = (String)item.getFieldName();
						if(inputName.equalsIgnoreCase("V_name"))
						{ 
							vname = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_capacity"))
						{ 
							vcapacity = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_addr"))
						{ 
							vaddress = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_state"))
						{ 
							vstate = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_dist"))
						{ 
							vdistrict = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_city"))
						{ 
							vcity = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_area"))
						{ 
							varea = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_preff"))
						{ 
							vpreffernce = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_rate"))
						{ 
							vrate = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_phone"))
						{ 
							vphone = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_email"))
						{ 
							vmail = (String)item.getString(); 
						}
					}
					else
					{
						vphoto = new File(item.getName()).getName();
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + vphoto));
					}
					
					
					String query = "insert into Venue(VNAME,VCAPACITY,VADDRESS,VSTATE,VDISTRICT,VCITY,VAREA,VPREFERABLE_FOR,VRATE,VPHONE,VEMAIL,VIMAGES) values('"+vname+"','"+vcapacity+"','"+vaddress+"','"+vstate+"','"+vdistrict+"','"+vcity+"','"+varea+"','"+vpreffernce+"','"+vrate+"','"+vphone+"','"+vmail+"','"+vphoto+"')";
					String query1 = "delete from Venue where VIMAGES = 'null'";
					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnection("database path","databse","password");
					Statement stmt = con.createStatement();
					stmt.executeUpdate(query);
					stmt.executeUpdate(query1);
					
                }
				
                out.println("<script type = 'text/javascript'>");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/javascript/functions.js");
				out.println("</script>");
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
        request.getRequestDispatcher("/venue.jsp").forward(request, response);
    }
}
