<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
	<style>
		.accessDenied{
			color: red;
		}
	</style>
<title>Access Denied </title>
</head>
<body>

	<br><br>
	<p>
		<i class="accessDenied">ACCESS DENIED - User is not authorized  to access the requested resource!</i>
	</p>
	
		<br><br>
	<a href="${pageContext.request.contextPath}/">Home Page</a>
	
	<br> <br>
	<form:form  action="${pageContext.request.contextPath}/logout"  method="POST">
		<input type="submit" value="Logout"/>
	</form:form>


</body>
</html>