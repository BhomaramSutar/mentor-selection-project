package com.fileinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.algo.CosineSimilarity;
import com.connection.Dbconn;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class rating_page
 */
@WebServlet("/rating_page")
public class rating_page extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public rating_page() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
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
		String Mentor_ID, email;

		Mentor_ID = request.getParameter("txt_search");
		System.out.println("Mentor_ID" + Mentor_ID);
		email = (String) session.getAttribute("emailid");
		System.out.println("User Email" + email);

		try {

			int i = 0;
			Connection con;
			con = Dbconn.conn();

			Statement ostRegister = con.createStatement();
			Statement ss = con.createStatement();
			ResultSet orsLogin;
			orsLogin = ostRegister
					.executeQuery("select * from tblrating where User_ID='"
							+ email + "' and Email_ID='"+Mentor_ID+"' ");
			if (orsLogin.next()) {
				ss.executeUpdate("update tblrating set Rating_values='"+rating+"' where User_ID='"+email+"' and Email_ID='"+Mentor_ID+"'");
			} else {
				String sql = "insert into tblrating(User_ID,Email_ID,Rating_values) values(?,?,?)";
				PreparedStatement p = (PreparedStatement) con
						.prepareStatement(sql);
				p.setString(1, email);
				p.setString(2, Mentor_ID);
				p.setString(3, rating);

				i = p.executeUpdate();

				if (i != 0) {
					System.out.println("OK ");
				}
			}
			pw.println("<script> alert(' Rating Save Successfuly');</script>");
			RequestDispatcher rd = request
					.getRequestDispatcher("/Rating_page.jsp");
			rd.include(request, response);
		} catch (Exception exc) {
			System.out.println(exc);
		}
	}

}
