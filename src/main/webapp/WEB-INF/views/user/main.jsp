<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>

    welcome! <security:authentication property="name"/>
    <br/>
    	  后台获取用户名：${username }
	<div style="border: 1px; "><a target="_blank" href="j_spring_security_logout">注销</a></div>
	
	<br/>
	
	<security:authorize ifAnyGranted="ROLE_浏览用户">
	<div>
		<a target="_blank" href="user/showInfos.htmls">全部用户</a>
	</div>
	</security:authorize>
	
	
	<security:authorize ifAllGranted="ROLE_管理用户">
		<div>
			<a target="_blank" href="user/manage.htmls">管理用户</a>
		</div>
	</security:authorize>
	
	<div>
		<a target="_blank" href="user/save.htmls">添加用户</a>
	</div>
	<div>
		<a target="_blank" href="user/update.htmls">修改部用户</a>
	</div>
	<div>
		<a target="_blank" href="user/delete.htmls">删除用户</a>
	</div>
	
</body>
</html>