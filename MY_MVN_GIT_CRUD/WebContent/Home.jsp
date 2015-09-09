<%@ include file="block_browserback.jsp"%>
<%
	String fname=(String)session.getAttribute("fname");

	if(fname==null)
	{
		response.sendRedirect("index.jsp?_session=expired");
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