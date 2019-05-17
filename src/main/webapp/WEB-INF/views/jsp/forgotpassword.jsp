<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${siteLook.title} Login</title>
 
<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>
 
<jsp:include page='navbar.jsp'></jsp:include>
 

<div class="container">
	<div class="well">
	<h1>Forgot Your Password?</h1>
	<jsp:include page='printMessage.jsp'></jsp:include>
	<form:form id="fm1" modelAttribute="usernameForm" method="post" action="forgotpassword">
	<div class="row">
		<div class="${siteLook.labelCols}">
			<p> Username: </p>
		</div>
		<div class="${siteLook.formCols}">
			<p> <form:input type="text" name="username" path="username" class="form-control" value="" /> </p>
		</div>
	</div>
	<div class="row">
		<div class="${siteLook.labelCols}">
		</div>
		<div class="${siteLook.formCols}">
		<p> 
			<button class="btn btn-info btn-lg" type="submit" class="form-control" value="Submit" >Reset Password</button> 
		</p>
		</div>
	</div>
    </form:form>
	</div>

	<jsp:include page='menu.jsp'></jsp:include>
	<jsp:include page='footer.jsp'></jsp:include>
</div>
 
<jsp:include page='javascript_includes.jsp'></jsp:include>
</body>
</html>