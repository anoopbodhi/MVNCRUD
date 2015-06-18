<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form name="signup" method="post" action="UserServlet">
<input type="hidden" name="USER_ACTION" value="SIGNUP">
<p>FIRST NAME :<input type="text" name="FNAME"></p>
<p>LAST NAME :<input type="text" name="LNAME"></p>
<p>AGE :<input type="text" name="AGE"></p>
<p>GENDER : <input type="radio" name="GENDER" value="M">Male <input type="radio" name="GENDER" value="F">FEMALE</p>
<p>ADDRESS :<textarea name="ADDRESS" ></textarea></p>
<p>MOBILE :<input type="text" name="MOBILE"></p>
<p>USERNAME :<input type="text" name="USERNAME"></p>
<p>PASSWORD :<input type="password" name="PASSWORD"></p>
<p><input type="submit" value="SIGN UP"></p>
</form>
</body>
</html>