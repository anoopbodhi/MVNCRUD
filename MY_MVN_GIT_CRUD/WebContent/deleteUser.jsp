<%@ include file="block_browserback.jsp"%>

<%
//session.setMaxInactiveInterval(1*60);

String fname=(String)session.getAttribute("fname");
	if(fname==null)
	{
		response.sendRedirect("index.jsp?_session=expired");
	}
	else
	{
%>
<%@page import="com.mymvngitcrud.service.UserService"%>
<%@page import="com.mymvngitcrud.domain.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.util.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="javascript">
function val()
{
	
	var admin="anoop";
	
		if((document.deleteuser.fname.value)!=admin)
		{
		alert("SORRY !!! Accedd Denied You cant delete");
		}
		else
		{
			document.deleteuser.submit();
		}
}


</script>


</head>
<body>
<%
	ArrayList list_user=new UserService().getUsers();
%>
<p>Welcome  <%=session.getAttribute("fname") %></p>

<p><a href="viewUser.jsp">VIEW</a></p>
<p><a href="deleteUser.jsp">REMOVE</a></p>
<p><a href="updateUser_1.jsp">EDIT</a></p>
<p><a href="logOut.jsp">LOGOUT</a></p>

<form name="deleteuser" action="UserServlet" method="post">
<input type="hidden" name="USER_ACTION" value="DELETE">
<table border="1" align="center">
<tr>
<th>ID</th><th>FNAME</th><th>LNAME</th><th>AGE</th><th>GENDER</th><th>ADDRESS</th><th>MOBILE</th><th>USERNAME</th><th>PASSWORD</th>
<th>REMOVE</th>
</tr>

<%
	for(int i=0;i<list_user.size();i++)
	{
		User user=(User)list_user.get(i);
%>
		<tr>
		<td><%=user.getId() %></td>
		<td><%=user.getFNAME() %></td>
		<td><%=user.getLNAME() %></td>
		<td><%=user.getAGE() %></td>
		<td><%=user.getGENDER() %></td>
		<td><%=user.getADDRESS()%></td>
		<td><%=user.getMOBILE() %></td>
		<td><%=user.getUSERNAME() %></td>
		<td><%=user.getPASSWORD() %></td>
		
	
		<td><input type="checkbox" name="check" value="<%=user.getId() %>"></td>
		
		</tr>
<%		
	}

%>

</table>

<input type="hidden" name="fname" value="<%=session.getAttribute("fname")%>">
<p align="center"><input type="button" value="REMOVE" onclick="val()"></p>
</form>


</body>
</html>
<%		
	}

%>