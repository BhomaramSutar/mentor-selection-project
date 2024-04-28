package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public class Dbconn {
	public static ArrayList<String> listskill1 = new ArrayList<String>();
	public static ArrayList<String> listskill2 = new ArrayList<String>();

	public Dbconn() throws SQLException {
		super();
	}

	public static ArrayList<String> StringTokenizer1(String data) {
		if (data.contains(",")) {

			String d[] = data.split(",");
			for (int i = 0; i < d.length; i++) {
				listskill1.add(d[i]);

			}

		} else {

			listskill1.add(data);
		}
		return listskill1;

	}


	public static Connection conn() throws SQLException, ClassNotFoundException {
		Connection con;

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/mentordb",
				"root", "admin");
		return (con);
	}

	public static void main(String args[])
	{
		try {
			ArrayList<String>list1=Dbconn.StringTokenizer1("java");
			for(int j=0;j<list1.size();j++)
			{
				String skilldatalist=list1.get(j);
				System.out.println(skilldatalist);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
}
