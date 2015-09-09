<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MVN_CRUD</title>
</head>
<body>
<form name="login" method="post" action="UserServlet">
<input type="hidden" name="USER_ACTION" value="LOGIN">
<p>USENAME :<input type="text" name="USERNAME"></p>
<p>PASSWORD :<input type="password" name="PASSWORD"></p>
<p><input type="submit" value="LOGIN"></p>
<p>New User ? <a href="signUp.jsp">Sign Up Here</a></p>
<p>Remember Me <input type="checkbox" name="remember_me" value="ok"></p>

</form>
<font color="red"> 
<%
	try{
		
		String _session=request.getParameter("_session");
		if(_session.equals("expired"))
		{
			out.println("Session Expired !!! Please Login Again !!!");
		}
		else
		{
			out.println("");
		}
		
	}catch(Exception e)
	{
		
	}

%>
</font>
</body>
</html>
