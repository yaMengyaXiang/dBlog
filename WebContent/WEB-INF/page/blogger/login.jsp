<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>dBlog登录</title>

<link href="${pageContext.request.contextPath}/static/css/dBlog.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon"
	href="${pageContext.request.contextPath}/static/image/favicon.ico">
<script
	src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>

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
<body style="background-color: #c0c0c0;">

	<div style="width: 32%; margin: 0 auto; margin-top: 200px; ">
		<div style="border-top-left-radius: 20px; border-top-right-radius: 20px; background-color: #f85252; height: 50px;">
			<label style="font-size: 24px; padding-left: 24px; padding-top: 7px; color: white;">
			<span style="font-size: 20px;" class="glyphicon glyphicon-lock"></span>
			登录
			</label>
		</div>
		<div class="">
			<label id="error" style="color: red; font-size: 17px; display: none;text-align:center; margin-top: 10px">11111111${errorMsg}</label>
		</div>
		<form method="post"
			action="${pageContext.request.contextPath}/blogger/login.action">
			<div  style="padding: 24px; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; background-color: #ffffff;">
				<label style="font-size: 17px;">用户名</label>
				<div style="margin: 15px auto; width: 100%;">
					<input type="text" name="username" placeholder="Username"
					 style="width: 100%; height: 24px; border-radius: 4px; border: 1px solid grey;" /> 
				</div>
				
				<label style="font-size: 17px;">密码</label>
				<div style="margin: 15px auto;width: 100%;">
					<input type="password" name="password" placeholder="Password" 
						 style="width: 100%; height: 24px; border-radius: 4px; border: 1px solid grey;" />
				</div>
				<div style="text-align: center;">
					<button class="btn btn-primary" type="submit">登 录</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>