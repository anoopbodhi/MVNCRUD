<%
	
Cookie ck=new Cookie("username", "");
ck.setMaxAge(0);

Cookie ck1=new Cookie("password","");
ck1.setMaxAge(0);

response.addCookie(ck);
response.addCookie(ck1);


	session.setAttribute("fname",null);
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	
	response.sendRedirect("index.jsp");

%>
