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
import com.mail.SendMail;

/**
 * Servlet implementation class Shedule_Meeting
 */
@WebServlet("/Shedule_Meeting")
public class Shedule_Meeting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Shedule_Meeting() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		PrintWriter pw = response.getWriter();
		System.out.println("Login Servlet");
		String mentoremail =(String)session.getAttribute("memailid");
		String urldata = request.getParameter("txt_search");
		

		{
			Connection con;
			try {
				con = Dbconn.conn();

				Statement ostRegister = con.createStatement();
				ResultSet rs;
				rs = ostRegister
						.executeQuery("select * from candidateregistration where Mentor_ID='"
								+ mentoremail
								+ "'");
				while(rs.next()) {
					SendMail.SendMeeting(rs.getString("Uemail"),urldata);

					

				}
				RequestDispatcher rd = request
						.getRequestDispatcher("/MentorHome.jsp");
				rd.include(request, response);
			} catch (Exception e) {
				pw.println("<script> alert(' Unexpected Error');</script>");
				RequestDispatcher rd = request
						.getRequestDispatcher("/MentorHome.jsp");
				rd.include(request, response);
				e.printStackTrace();
			}

		}
	}

}
