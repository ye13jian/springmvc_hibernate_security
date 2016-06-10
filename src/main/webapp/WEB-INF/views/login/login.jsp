<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="">
	<title>Login</title>
</head>
<body>
	 <div>${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}</div>  
  
    <form:form action="j_spring_security_check" modelAttribute="acctUser" method="post">  
        <form:errors path="*" cssStyle="color:red;" />  
        	<br />  
	      	  用户：<form:input path="nickName" />  
	        <br />  
	       	 密码：<form:password path="nickPassword" />  
        	<br />  
        <form:button>登录</form:button>  
    </form:form>  
</body>
</html>
