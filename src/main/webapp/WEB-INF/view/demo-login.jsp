
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
	<title>Custome Login Page</title>
	
	<style>
		.failed{
			color: red;
		}
	</style>
</head>
<body>

	<h3>Spring Securiy Demo  Login Page</h3>
	
	<form:form action="${pageContext.request.contextPath}/authenticateUser" method="POST">
		
		<!-- check for login error -->
		<c:if test="${param.error != null}" >
			<i class="failed">Invalid username/password</i>
		 </c:if>
		
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