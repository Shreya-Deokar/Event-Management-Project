import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.io.*;
import java.sql.*;

public class CreateTables
{
	
	public static void main(String args[])throws Exception
	{
		Connection c = null;
		Statement stmt = null;
		try 
		{
			
			Class.forName("org.postgresql.Driver");
			c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres", "mcasc05");
			System.out.println("Opened database successfully");
			stmt = c.createStatement();
			/*String sql = "CREATE TABLE VENUE " +
						 "(VID SERIAL PRIMARY KEY," +
						 "VNAME VARCHAR(40),"+
						 "VCAPACITY VARCHAR(10),"+
						 "VADDRESS VARCHAR(80),"+
						 "VSTATE VARCHAR(30),"+
						 "VDISTRICT VARCHAR(30),"+
						 "VCITY VARCHAR(30),"+
						 "VAREA VARCHAR(40),"+
						 "VPREFERABLE_FOR VARCHAR(30),"+
						 "VRATE VARCHAR(20),"+
						 "VPHONE VARCHAR(10),"+
						 "VEMAIL VARCHAR(60))";
			stmt.executeUpdate(sql);

			String sql1 = "CREATE TABLE VENUE_IMAGE"+
						  "(VIID SERIAL PRIMARY KEY,"+
						  "VIMAGE VARCHAR(50))";
			stmt.executeUpdate(sql1);

			String sql2 = "CREATE TABLE VENUE_VIMAGE"+
						  "(VID INT NOT NULL REFERENCES VENUE(VID) ON DELETE CASCADE ON UPDATE CASCADE,"+
						  "VIID INT NOT NULL REFERENCES VENUE_IMAGE(VIID) ON DELETE CASCADE ON UPDATE CASCADE)";

			stmt.executeUpdate(sql2);

			String sql3 = "CREATE TABLE DECORATION " +
						 "(DID SERIAL PRIMARY KEY," +
						 "DNAME VARCHAR(40),"+
						  "DTYPE VARCHAR(40),"+
						  "DRATE VARCHAR(50))";

			stmt.executeUpdate(sql3);

			String sql4 = "CREATE TABLE DECORATION_IMAGE"+
						  "(DIID SERIAL PRIMARY KEY,"+
						  "DIMAGE VARCHAR(50))";

			stmt.executeUpdate(sql4);

			String sql5 = "CREATE TABLE DECORATION_DIMAGE"+
						  "(DID INT NOT NULL REFERENCES DECORATION(DID) ON DELETE CASCADE ON UPDATE CASCADE,"+
						  "DIID INT NOT NULL REFERENCES DECORATION_IMAGE(DIID) ON DELETE CASCADE ON UPDATE CASCADE)";
			stmt.executeUpdate(sql5);
			
			String sql6 = "CREATE TABLE ITEM"+
						  "(IID SERIAL PRIMARY KEY,"+
						  "INAME VARCHAR(50),"+
						  "ITYPE VARCHAR(30),"+
						  "IPRICE VARCHAR(20))";
						  
			stmt.executeUpdate(sql6);
			
			String sql7 = "CREATE TABLE ITEM_IMAGE"+
						  "(IIID SERIAL PRIMARY KEY,"+
						  "IIMAGE VARCHAR(50))";
						  
			stmt.executeUpdate(sql7);	


			String sql8 = "CREATE TABLE ITEM_IIMAGE"+
						  "(IID INT NOT NULL REFERENCES ITEM(IID) ON DELETE CASCADE ON UPDATE CASCADE,"+
						  "IIID INT NOT NULL REFERENCES ITEM_IMAGE(IIID) ON DELETE CASCADE ON UPDATE CASCADE)";
						  
			stmt.executeUpdate(sql8);
			
			String sql9 = "CREATE TABLE PHOTOGRAPHER"+
						  "(PID SERIAL PRIMARY KEY,"+
						  "PNAME VARCHAR(50),"+
						  "PPREFF VARCHAR(30),"+
						  "PRATE VARCHAR(30),"+
						  "PPHONE VARCHAR(10))";
						  
			stmt.executeUpdate(sql9);
			
			String sql10 = "CREATE TABLE PHOTO_IMAGE"+
						   "(PIID SERIAL PRIMARY KEY,"+
						   "PIMAGE VARCHAR(50))";
						   
			stmt.executeUpdate(sql10);
			
			String sql11 = "CREATE TABLE PHOTO_PIMAGE"+
						   "(PID INT NOT NULL REFERENCES PHOTOGRAPHER(PID) ON DELETE CASCADE ON UPDATE CASCADE,"+
						   "PIID INT NOT NULL REFERENCES PHOTO_IMAGE(PIID) ON DELETE CASCADE ON UPDATE CASCADE)";
	
			stmt.executeUpdate(sql11);
			
			String sql12 = "CREATE TABLE MAKEUPARTIST"+
						   "(MID SERIAL PRIMARY KEY,"+
						   "MNAME VARCHAR(50),"+
						   "MPHONE VARCHAR(50),"+
						   "MRATE VARCHAR(50))";
						   
			stmt.executeUpdate(sql12);
			
			String sql13 = "CREATE TABLE MAKEUP_IMAGE"+
						   "(MIID SERIAL PRIMARY KEY,"+
						   "MIMAGE VARCHAR(50))";
						   
			stmt.executeUpdate(sql13);
			
			String sql14 = "CREATE TABLE MAKEUP_MIMAGE"+
						   "(MID INT NOT NULL REFERENCES MAKEUPARTIST(MID) ON DELETE CASCADE ON UPDATE CASCADE,"+
						   "MIID INT NOT NULL REFERENCES MAKEUP_IMAGE(MIID) ON DELETE CASCADE ON UPDATE CASCADE)";
			
			stmt.executeUpdate(sql14);

			String sql15 = "CREATE TABLE CUSTOMER"+
						   "(CID SERIAL PRIMARY KEY,"+
						   "CNAME VARCHAR(80),"+
						   "CMAIL VARCHAR(100),"+
						   "CPHONE VARCHAR(10),"+
						   "CADDRESS VARCHAR(100),"+
						   "CPASSWORD VARCHAR(20))";

			stmt.executeUpdate(sql15);*/

			String sql16 = "CREATE TABLE EVENT"+
						   "(EID SERIAL PRIMARY KEY,"+
						   "OCCASION VARCHAR(30),"+
						   "FROMTIME VARCHAR(10),"+
						   "TOTIME VARCHAR(10),"+
						   "DATE VARCHAR(15),"+
						   "APPROX_PEOPLE VARCHAR(10),"+
						   "VENUE_NAME VARCHAR(50),"+
						   "DECORATION_NAME VARCHAR(50),"+
						   "PHOTOGRAPHER_NAME VARCHAR(30),"+
						   "MAKEUPARTIST_NAME VARCHAR(30),"+
						   "NO_OF_PERSON VARCHAR(20),"+
						   "APPROVAL VARCHAR(20))"+
						   "TOTALPRICE VARCHAR(20)";


			stmt.executeUpdate(sql16);

			String sql17 = "CREATE TABLE CUSTOMER_EVENT"+
						   "(CID INT NOT NULL REFERENCES CUSTOMER(CID) ON DELETE CASCADE ON UPDATE CASCADE,"+
						   "EID INT NOT NULL REFERENCES EVENT(EID) ON DELETE CASCADE ON UPDATE CASCADE)";

			stmt.executeUpdate(sql17);

			String sql18 = "CREATE TABLE MENU"+
						   "(MEID SERIAL PRIMARY KEY,"+
						   "EID INT NOT NULL REFERENCES EVENT(EID) ON DELETE CASCADE ON UPDATE CASCADE)";

			stmt.executeUpdate(sql18);

			String sql19 = "CREATE TABLE MENU_ITEM"+
						   "(MEID INT NOT NULL REFERENCES MENU(MEID) ON DELETE CASCADE ON UPDATE CASCADE,"+
						   "IID INT NOT NULL REFERENCES ITEM(IID) ON DELETE CASCADE ON UPDATE CASCADE,"+
						   "TOTAL_PRICE VARCHAR(20))";
						   
			stmt.executeUpdate(sql19);

			/*String sql20 = "CREATE TABLE FEEDBACK"+
						   "(FID SERIAL PRIMARY KEY,"+
						   "CID VARCHAR(20),"+
						   "NAME VARCHAR(50),"+
						   "MAIL VARCHAR(80),"+
						   "FEEDBACK VARCHAR(100))";

			stmt.executeUpdate(sql20);

			String sql21 = "CREATE TABLE CONTACTFORM"+
						   "(CFID SERIAL PRIMARY KEY,"+
						   "NAME VARCHAR(50),"+
						   "EMAIL VARCHAR(80),"+
						   "MESSAGE VARCHAR(100))";

			stmt.executeUpdate(sql21);*/

			String sql22 = "CREATE TABLE CUST_VENUE"+
						   "(CVID SERIAL PRIMARY KEY,"+
						   "CVNAME VARCHAR(50),"+
						   "CVADDR VARCHAR(100),"+
						   "CID INT NOT NULL REFERENCES CUSTOMER(CID) ON DELETE CASCADE ON UPDATE CASCADE,"+
						   "EID INT NOT NULL REFERENCES EVENT(EID) ON DELETE CASCADE ON UPDATE CASCADE)";

			stmt.executeUpdate(sql22);

		

			stmt.close();
			c.close();
		}catch (Exception e) 
		{
			System.err.println( e.getClass().getName()+": "+ e.getMessage() );
			System.exit(0);
			e.printStackTrace();
		}
		System.out.println("Table created successfully");
	}
}