<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%>
<html>
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>UserInfo</title>
	<script type="text/javascript" src="resources/js/lib/jquery-1.8.3.min.js"></script>
</head>
<body>
	用户信息 昵称：${userInfo.nickName}，用户id：${userInfo.id}，用户电话：${userInfo.telephone}，注册时间：
	<fmt:formatDate value="${userInfo.registerTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
	角色：[
		<c:forEach items="${userInfo.acctRoles}" var="role">
			${role.name} 权限[
				<c:forEach items="${role.acctAuthorities}" var="authority">
					${authority.name}
				</c:forEach>
			]
		</c:forEach>
	]
	<br> ajax显示全部用户信息：
	<div id="show_all_user"></div>
</body>
<script type="text/javascript">
	$.ajax({
		type:"get",
		url:"user/showInfos.htmls",
		dataType:"json",
		success: function(data) {
			$(data).each(function(i,user){
				var p = "<p>昵称：" + user.nickName + " 电话：" + user.telephone + 
				" 注册时间：" + user.registerTime + " id：" + user.id + "</p>";
				$("#show_all_user").append(p);
			});
		},
		async:true
	});
</script>
</html>
