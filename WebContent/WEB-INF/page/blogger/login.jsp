<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>dBlog登录</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/static/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/static/css/reset.css">
<link
	href="${pageContext.request.contextPath}/static/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
	
	<link rel="icon" href="${pageContext.request.contextPath}/static/image/favicon.ico">
	<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>
	
	<script type="text/javascript">
	
		$(function() {
			$("#username").keydown(function() {
				$("#error").text("");
			});
			
			$("#password").keydown(function() {
				$("#error").text("");
			});
			
			
		});
		
	
	</script>
	
</head>
<body>

	<form class='login-form' method="post" action="${pageContext.request.contextPath}/blogger/login.action">
		<div style="height: 3em; text-align: center;">
			<label id="error" style="color: red; font-size: 17px;">${errorMsg}</label>
		</div>
		<div class="flex-row">
			<label class="lf--label" for="username"> 
			<i style="font-size: 18px;" class="fa fa-user-o"></i>
			</label> 
			<input id="username" name="username" class='lf--input' placeholder='Username' type='text'>
		</div>
		<div class="flex-row">
			<label class="lf--label" for="password"> 
			<i style="font-size: 18px;" class="fa fa-lock"></i>
			</label> 
			<input id="password" name="password" class='lf--input' placeholder='Password' type='password'>
		</div>
		<input class='lf--submit' type='submit' value='LOGIN'>
	</form>


</body>
</html>