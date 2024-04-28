package com.activity;

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
import com.algo.Similarity;
import com.connection.Dbconn;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Registrtion
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registration() {
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
		// TODO Auto-generated method stub
		CosineSimilarity cs = new CosineSimilarity();
		HttpSession session = request.getSession(true);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		String username, address, email, number, password, skilldata;

		username = request.getParameter("txt_Uname");
		System.out.println("UserName" + username);
		address = request.getParameter("txt_Address");
		System.out.println("Address" + address);
		email = request.getParameter("txt_Email");
		System.out.println("EmailId" + email);
		number = request.getParameter("txt_Number");
		System.out.println("MobNo" + number);
		password = request.getParameter("txt_Password");
		System.out.println("Password" + password);
		skilldata = request.getParameter("skilldata");
		System.out.println("skilldata=>" + skilldata);
		String Role = request.getParameter("rdo1");
		String gender = request.getParameter("gender");
		skilldata = request.getParameter("skilldata");
		System.out.println(Role);

		try {
			if (Role.equals("UserInfo")) {

				int i = 0;
				Connection con;
				con = Dbconn.conn();
				Statement ostRegister = con.createStatement();
				ResultSet orsLogin;
				orsLogin = ostRegister
						.executeQuery("select * from candidateregistration where Uemail='"
								+ username
								+ "'");
				if (orsLogin.next()) {
					
					pw.println("<script> alert('Allready Register User');</script>");
					RequestDispatcher rd = request
							.getRequestDispatcher("/Registration.jsp");
					rd.include(request, response);

				} else {

					Statement ss1 = con.createStatement();
					ss1.executeUpdate("TRUNCATE table tblscore");

					String Mentor_ID = "0";
					String sql = "insert into candidateregistration(Uname,Uaddress,Umobno,Uemail,Upassword,UGender,skilldata,Mentor_ID) values(?,?,?,?,?,?,?,?)";
					PreparedStatement p = (PreparedStatement) con
							.prepareStatement(sql);
					p.setString(1, username);
					p.setString(2, address);
					p.setString(3, number);
					p.setString(4, email);
					p.setString(5, password);
					p.setString(6, gender);
					p.setString(7, skilldata);
					p.setString(8, Mentor_ID);
					i = p.executeUpdate();

					ArrayList<String> list1 = Dbconn
							.StringTokenizer1(skilldata);

					if (i != 0) {
						session.setAttribute("emailid", email);
						session.setAttribute("name", username);
						Statement st2 = con.createStatement();
						ResultSet srs = st2
								.executeQuery("select * from mentorregistration");
						while (srs.next()) {
							double score = 0.0;
							int total = 0;
							String Mentor_IDs = srs.getString(5);
							String dbskilldata = srs.getString(8);
							String[] dblist = dbskilldata.split(",");
							for (int j = 0; j < list1.size(); j++) {
								String skilldatalist = list1.get(j);
								for (String dbdata : dblist) {
									score = cs.GetSimilarity(dbdata,
											skilldatalist) + score;
									total++;
								}

							}
							double finalscore = score / total;
							System.out.println("F=>" + finalscore + "s=>"
									+ score + "t=>" + total);
							Statement stmt1 = con.createStatement();
							stmt1.executeUpdate("insert into tblscore(Mentor_ID,Score_Info,Search_Word,User_ID) values('"
									+ Mentor_IDs
									+ "','"
									+ finalscore
									+ "','"
									+ skilldata + "','" + email + "')");
							System.out.println("OK ");

						}
						pw.println("<script> alert(' Register Successfuly');</script>");
						RequestDispatcher rd = request
								.getRequestDispatcher("/Assign_Page.jsp");
						rd.include(request, response);
					} else {

						RequestDispatcher rd = request
								.getRequestDispatcher("/Registration.jsp");
						rd.include(request, response);
						// System.out.print(" Wrong ID and Password");

					}
				}
			} else if (Role.equals("MentorInfo")) {
				int i = 0;
				Connection con;
				con = Dbconn.conn();

				String sql = "insert into mentorregistration(Uname,Uaddress,Umobno,Uemail,Upassword,UGender,skilldata) values(?,?,?,?,?,?,?)";
				PreparedStatement p = (PreparedStatement) con
						.prepareStatement(sql);
				p.setString(1, username);
				p.setString(2, address);
				p.setString(3, number);
				p.setString(4, email);
				p.setString(5, password);
				p.setString(6, gender);
				p.setString(7, skilldata);
				i = p.executeUpdate();

				if (i != 0) {
					System.out.println("OK ");
					pw.println("<script> alert(' Register Successfuly');</script>");
					RequestDispatcher rd = request
							.getRequestDispatcher("/LoginPage.jsp");
					rd.include(request, response);
				} else {

					RequestDispatcher rd = request
							.getRequestDispatcher("/Registration.jsp");
					rd.include(request, response);
					// System.out.print(" Wrong ID and Password");

				}
			}
		} catch (Exception exc) {
			System.out.println(exc);
		}

	}

}
