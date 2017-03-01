<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>dBlog后台</title>

<jsp:include page="/WEB-INF/page/common/static.jsp"></jsp:include>

</head>
<body>

	<div class="container">
		<jsp:include page="/WEB-INF/page/common/header.jsp"></jsp:include>
		<hr>

		<div class="row">
			
			<jsp:include page="/WEB-INF/page/admin/back_left.jsp"></jsp:include>

			<jsp:include page="/WEB-INF/page/admin/back_main.jsp"></jsp:include>
			
		</div>

		<jsp:include page="/WEB-INF/page/common/copyright.jsp"></jsp:include>
	</div>
	<!-- /container -->


</body>
</html>