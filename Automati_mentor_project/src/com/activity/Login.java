package com.activity;

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

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	 public static  int hitCount;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
       
        // 
    }
    public void init() { 
        
     } 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
          
        HttpSession session=request.getSession();  
        session.invalidate();  
        
        out.println("<script type=\"text/javascript\">");  
		out.println("alert('You are successfully logged out!');");  
		out.println("</script>");
        request.getRequestDispatcher("LoginPage.jsp").include(request, response);         
        out.close(); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		HttpSession session=request.getSession(true);
		PrintWriter pw=response.getWriter();
		System.out.println("Login Servlet");
		String username=request.getParameter("txt_Uname");
		String Password=request.getParameter("txt_Password");
		System.out.println("Email-ID=>"+request.getParameter("txt_Uname"));
		System.out.println("Password=>"+request.getParameter("txt_Password"));
		String rdo1=request.getParameter("rdo1");
		
		{
			Connection con;
			try
			{
				con = Dbconn.conn();
				
				if(rdo1.equals("UserInfo"))
				{
				Statement ostRegister=con.createStatement();
				ResultSet orsLogin;
					orsLogin=ostRegister.executeQuery("select * from candidateregistration where Uemail='" +username+ "' and Upassword='"+Password+"'");
					if(orsLogin.next())
					{
						session.setAttribute("name", orsLogin.getString(2));
						session.setAttribute("emailid",username);
						pw.println("<script> alert('Login Succefully');</script>");
						RequestDispatcher rd = request.getRequestDispatcher("/OwnerHome.jsp");
						rd.include(request, response); 
										
					}
					else
					{
						pw.println("<script> alert(' Wrong UserName and Password');</script>");
						RequestDispatcher rd = request.getRequestDispatcher("/LoginPage.jsp");
								rd.include(request, response);
						
					}
				}
				if(rdo1.equals("MentorInfo"))
				{
				Statement ostRegister=con.createStatement();
				ResultSet orsLogin;
					orsLogin=ostRegister.executeQuery("select * from mentorregistration where Uemail='" +username+ "' and Upassword='"+Password+"'");
					if(orsLogin.next())
					{
						session.setAttribute("mname", orsLogin.getString(2));
						session.setAttribute("memailid",username);
						
						RequestDispatcher rd = request.getRequestDispatcher("/MentorHome.jsp");
						rd.include(request, response); 
										
					}
					else
					{
						pw.println("<script> alert(' Wrong Mentor Email and Password');</script>");
						RequestDispatcher rd = request.getRequestDispatcher("/LoginPage.jsp");
								rd.include(request, response);
						
					}
				}
				else if(rdo1.equals("AdminInfo"))
				{
					if(username.equals("admin@gmail.com")&&Password.equals("admin"))
					{
						session.setAttribute("nameadmin","admin");
						RequestDispatcher rd = request.getRequestDispatcher("/AdminHome.jsp");
						rd.include(request, response); 
										
					}
					else
					{
						pw.println("<script> alert(' Wrong Admin Name and Password');</script>");
						RequestDispatcher rd = request.getRequestDispatcher("/LoginPage.jsp");
								rd.include(request, response);
						
					}
					
				}
				
			}
			catch(Exception e)
			{
				pw.println("<script> alert(' Unexpected Error');</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/LoginPage.jsp");
				rd.include(request, response);
				e.printStackTrace();
			}
		
		}

	}

}
