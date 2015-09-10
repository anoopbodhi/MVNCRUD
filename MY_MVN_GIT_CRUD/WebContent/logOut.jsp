<%@ include file="block_browserback.jsp"%>
<%
	
Cookie ck=new Cookie("username", "");
ck.setMaxAge(0);

Cookie ck1=new Cookie("password","");
ck1.setMaxAge(0);

response.addCookie(ck);
response.addCookie(ck1);


	session.setAttribute("fname",null);
	 
	
	response.sendRedirect("index.jsp");

%>
