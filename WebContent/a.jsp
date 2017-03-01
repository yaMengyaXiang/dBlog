<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>dBlog</title>

<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>

	<script type="text/javascript">
	
		$(function() {
			// 触发一次click事件
			$("#aToIndex").trigger("click");
		});
		
		function toIndex() {
			var url = $("#aToIndex").attr("url");
			window.location.href = url;
		}
	
	</script>

</head>

<body>
	<a id="aToIndex" href="#" url="${pageContext.request.contextPath}/index.html" onclick="toIndex()"></a>
</body>

</html>