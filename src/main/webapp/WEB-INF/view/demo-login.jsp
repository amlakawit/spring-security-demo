<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring Securiy Demo Custom Login Page</title>
</head>
<body>
	<form:form action="${pageContext.request.contextPath}/authenticateUser" method="POST">
		<p>
		User name:<input type="text" name="username"/>
		</p>
		
		<p>
		Password <input type="password"  name="password"/>
		</p>
		
		<p>
		<input type="submit" value = "Login" />
		</p>
	
	</form:form>

</body>
</html>