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
 <%@page import="com.mymvngitcrud.service.UserService"%>
<%@page import="com.mymvngitcrud.domain.User"%>
 <%@page import="java.util.*"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
	Long id=Long.parseLong(request.getParameter("id"));
    User user=new UserService().getSingleUser(id);

%>

<body>
<p>Welcome  <%=session.getAttribute("fname") %></p>
<p><a href="viewUser.jsp">VIEW</a></p>
<p><a href="deleteUser.jsp">REMOVE</a></p>
<p><a href="updateUser_1.jsp">EDIT</a></p>
<p><a href="logOut.jsp">LOGOUT</a></p>
<center>
<br><br><br>

<form name="signup" method="post" action="UserServlet">
<input type="hidden" name="USER_ACTION" value="UPDATE">

<input type="hidden" name="ID" value="<%=user.getId()%>">
<p>FIRST NAME :<input type="text" name="FNAME" value=<%=user.getFNAME()%>></p>
<p>LAST NAME :<input type="text" name="LNAME" value=<%=user.getFNAME()%>></p>
<p>AGE :<input type="text" name="AGE" value=<%=user.getAGE()%>></p>
<%
	if(user.getGENDER().equals("M"))
	{
		%>
			<p>GENDER : <input type="radio" name="GENDER" value="M" checked>Male <input type="radio" name="GENDER" value="F">FEMALE</p>
		<%
	}
	else
	{
		%>
			<p>GENDER : <input type="radio" name="GENDER" value="M" >Male <input type="radio" name="GENDER" value="F" checked>FEMALE</p>
		<%
	}
%>


<p>ADDRESS :<textarea name="ADDRESS" ><%=user.getADDRESS()%></textarea></p>
<p>MOBILE :<input type="text" name="MOBILE" value=<%=user.getMOBILE()%>></p>
<p>USERNAME :<input type="text" name="USERNAME" value=<%=user.getUSERNAME()%>></p>
<p>PASSWORD :<input type="password" name="PASSWORD" value=<%=user.getPASSWORD()%>></p>
<p><input type="submit" value="UPDATE"></p>
</form>
</center>
</body>
</html>
<%		
	}

%>