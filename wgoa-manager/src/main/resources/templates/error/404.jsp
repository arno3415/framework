<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="resources/url" var="url" />
<fmt:message key="project_url" var="project_url" bundle="${url}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="3; url='${project_url }${pageContext.request.contextPath }/'">
<title>404</title>
<style type="text/css">
	.main {
		text-align: center; 
	    background-color: #fff;
	    margin: auto;
	    position: absolute;
	    top: 50%;
	    left: 0;
	    right: 0;
	    bottom: 0;
	}
</style>
</head>
<body>
	<div class="main">
		<div>
			<div>
				404 not found
			</div>
			<a href="${project_url }${pageContext.request.contextPath }/">回到主页</a>
		</div>
	</div>
</body>
</html>