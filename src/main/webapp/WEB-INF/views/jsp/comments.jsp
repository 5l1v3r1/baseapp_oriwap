<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.securitymagick.domain.Permissions" %>
<%@ page import="com.securitymagick.web.cookie.CookieHandler" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>${siteLook.title} Comments Admin Panel</title>
 
<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>
 
<jsp:include page='navbar.jsp'></jsp:include>
 
  <div class="container">
	<h1>${title}</h1>
	<jsp:include page='printMessage.jsp'></jsp:include>
	<% 
		Boolean showAdmin = false;
		CookieHandler p = new CookieHandler("permissions");
		if (p.checkForCookie(request)) {
			Cookie c = p.getCookie();
			Permissions userPermissions = new Permissions(c.getValue());
			if (userPermissions.getAdmin()) {
				showAdmin = true;
			}
		}
		if (showAdmin) {
	%>
		
	<h1>Latest Comments</h1>	
	<c:forEach items="${comments}" var="c">
		</br>
		<div class="row">
			<div class="${siteLook.formCols}">
				${c.username} said ${c.comment}
			</div>
			<div class="${siteLook.labelCols}">
				<a href="comments?delete=${c.id}"> Delete </a>
			</div>
		</div>
    </c:forEach>
    <hr>
  <jsp:include page='menu.jsp'></jsp:include>
 <% } %>
 
  <jsp:include page='footer.jsp'></jsp:include>
</div>
 
<jsp:include page='javascript_includes.jsp'></jsp:include>
</body>
</html>