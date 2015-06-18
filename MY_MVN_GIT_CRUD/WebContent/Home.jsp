<%
	
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
	String fname=(String)session.getAttribute("fname");

	if(fname==null)
	{
		response.sendRedirect("index.jsp");
	}
	else
	{
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>Welcome  <%=session.getAttribute("fname") %></p>

<p><a href="viewUser.jsp">VIEW</a></p>
<p><a href="deleteUser.jsp">REMOVE</a></p>
<p><a href="updateUser_1.jsp">EDIT</a></p>
<p><a href="logOut.jsp">LOGOUT</a></p>
</body>
</html>
<%
}
%>