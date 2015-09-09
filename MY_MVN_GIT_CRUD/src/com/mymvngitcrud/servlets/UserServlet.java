package com.mymvngitcrud.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mymvngitcrud.domain.User;
import com.mymvngitcrud.rep.UserRepository;
import com.mymvngitcrud.service.UserService;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
		
		HttpSession session=request.getSession();
		
		String USER_ACTION=request.getParameter("USER_ACTION");
		if(USER_ACTION.equals("SIGNUP"))
		{
			User user=new User();
			user.setFNAME(request.getParameter("FNAME"));
			user.setLNAME(request.getParameter("LNAME"));
			user.setAGE(request.getParameter("AGE"));
			user.setGENDER(request.getParameter("GENDER"));
			user.setADDRESS(request.getParameter("ADDRESS"));
			user.setMOBILE(request.getParameter("MOBILE"));
			user.setUSERNAME(request.getParameter("USERNAME"));
			user.setPASSWORD(request.getParameter("PASSWORD"));
			
			user=new UserRepository().save(user);
			if(user!=null)
			{
				//System.out.println("Success");
				
				session.setAttribute("fname",user.getFNAME());
				response.sendRedirect("Home.jsp");
			
			}
			else
			{
				response.sendRedirect("signUp.jsp?k=0");
			}
		}
		else if(USER_ACTION.equals("LOGIN"))
		{
			System.out.println("LOGIN!!!");
			
			User user=new User();
			user.setUSERNAME(request.getParameter("USERNAME"));
			user.setPASSWORD(request.getParameter("PASSWORD"));
			
			String remember_me=request.getParameter("remember_me");
			
			//System.out.println("remember_me="+remember_me);
			
			
			
			user=new UserRepository().loginCheck(user);
			
			if(user!=null)
			{
				session.setAttribute("fname",user.getFNAME());
				
				//----------Adding cookies to response----------------
				
				if(remember_me!=null)
				{
					Cookie ck=new Cookie("username", user.getUSERNAME());
					ck.setMaxAge(24*60*60);
					
					Cookie ck1=new Cookie("password", user.getPASSWORD());
					ck1.setMaxAge(24*60*60);
					
					response.addCookie(ck);
					response.addCookie(ck1);
					
					System.out.println("cookies added ***************************************");
				}	
			   //---------------------------------------------------
				
				response.sendRedirect("Home.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp?k=0");
			}
			
			
			
			
		}
		
		else if(USER_ACTION.equals("DELETE"))
		{
			String id[]=request.getParameterValues("check");
			
			
			int flag=new UserService().deleteUser(id);
			if(flag==1)
			{
				response.sendRedirect("deleteUser.jsp");
			}
			else
			{
				response.sendRedirect("deleteUser.jsp");
			}
		}
		
		else if(USER_ACTION.equals("UPDATE"))
		{
			User user=new User();
			user.setId(Long.parseLong(request.getParameter("ID")));
			user.setFNAME(request.getParameter("FNAME"));
			user.setLNAME(request.getParameter("LNAME"));
			user.setAGE(request.getParameter("AGE"));
			user.setGENDER(request.getParameter("GENDER"));
			user.setADDRESS(request.getParameter("ADDRESS"));
			user.setMOBILE(request.getParameter("MOBILE"));
			user.setUSERNAME(request.getParameter("USERNAME"));
			user.setPASSWORD(request.getParameter("PASSWORD"));
			
			user=new UserRepository().profileUpdate(user);
			
			if(user!=null)
			{
				response.sendRedirect("viewUser.jsp");
			}
			else
			{
				response.sendRedirect("updateUser_2.jsp");
			}
			
		}
	}

}
