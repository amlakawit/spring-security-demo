<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring Security Demo</title>
</head>
<body>
	User: <security:authentication property="principal.username"/>  Role(s): <security:authentication property="principal.authorities"/>
	<hr>
	<h3>Spring Security Demo</h3>	
	<form:form  action="${pageContext.request.contextPath}/logout"  method="POST">
		<input type="submit" value="Logout"/>
	</form:form>
</body>
</html>