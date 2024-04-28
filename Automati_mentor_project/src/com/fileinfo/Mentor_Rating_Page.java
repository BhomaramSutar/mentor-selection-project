package com.fileinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Dbconn;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Mentor_Rating_Page
 */
@WebServlet("/Mentor_Rating_Page")
public class Mentor_Rating_Page extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mentor_Rating_Page() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rating = request.getParameter("star");
		int r = Integer.parseInt(rating);
		if (r == 5) {
			rating = "1";
		} else if (r == 4) {
			rating = "2";

		} else if (r == 3) {
			rating = "3";
		} else if (r == 2) {
			rating = "4";
		} else if (r == 1) {
			rating = "5";
		}
		System.out.println(rating);
		HttpSession session = request.getSession(true);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		String User_ID, email;

		User_ID = request.getParameter("txt_search");
		System.out.println("Mentor_ID" + User_ID);
		email = (String) session.getAttribute("memailid");
		System.out.println("User Email" + email);

		try {

			int i = 0;
			Connection con;
			con = Dbconn.conn();

			Statement ostRegister = con.createStatement();
			Statement ss = con.createStatement();
			ResultSet orsLogin;
			orsLogin = ostRegister
					.executeQuery("select * from tblmentorrating where User_ID='"
							+ email + "' and Email_ID='"+User_ID+"' ");
			if (orsLogin.next()) {
				ss.executeUpdate("update tblmentorrating set Rating_values='"+rating+"' where User_ID='"+email+"' and Email_ID='"+User_ID+"'");
			} else {
				String sql = "insert into tblmentorrating(User_ID,Email_ID,Rating_values) values(?,?,?)";
				PreparedStatement p = (PreparedStatement) con
						.prepareStatement(sql);
				p.setString(1, email);
				p.setString(2, User_ID);
				p.setString(3, rating);

				i = p.executeUpdate();

				if (i != 0) {
					System.out.println("OK ");
				}
			}
			pw.println("<script> alert(' Rating Save Successfuly');</script>");
			RequestDispatcher rd = request
					.getRequestDispatcher("/Mentor_Rating_page.jsp");
			rd.include(request, response);
		} catch (Exception exc) {
			System.out.println(exc);
		}
	}

}
