<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin </title>
</head>
<body>
	User: <security:authentication property="principal.username"/>  Role(s): <security:authentication property="principal.authorities"/>
	<hr>
	
	<h3>System Admin</h3>	
	
	<br><br>
	<a href="${pageContext.request.contextPath}/">Home Page</a>
	
	<br> <br>
	<form:form  action="${pageContext.request.contextPath}/logout"  method="POST">
		<input type="submit" value="Logout"/>
	</form:form>

</body>
</html>