<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>dBlog首页</title>

<jsp:include page="/WEB-INF/page/common/static.jsp"></jsp:include>

	<script type="text/javascript">
	
		function preAndNextLink(linkObj, pageNo) {
			var $linkObj = $(linkObj);
			var url = $linkObj.attr("url");
			
			if ($linkObj.parent().hasClass("disabled")) {
				return;				
			}
			var param = {
					"pageNo": pageNo
			};
			
			var checkUrl = "${pageContext.request.contextPath}/blog/checkPageNum.action";
			$.post(checkUrl, param, function(data) {
				if (data == "true") {
					window.location.href = url;
				}
			});
			
		}
	
	</script>

</head>
<body>
    <div class="container">
	<jsp:include page="/WEB-INF/page/common/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/page/common/navbar.jsp"></jsp:include>
   	<div class="row" style="border: 0px solid #ccc; border-radius: 2px;">
        <div class="col-md-9" style="border: 0px solid #ccc; border-radius: 2px;">
            <div class="data-list" style="border: 1px solid #ccc; border-radius: 2px; padding: 10px;">
                <div class="data-list-title">
                    <span class="glyphicon glyphicon-list"></span>
					最新博客
                </div>
                <c:forEach items="${pageBlogs.results}" var="blog">
                <div class="oneRow">
                    <p class="list_p_title" style="font-size: 17px;">
                    	<a href="${pageContext.request.contextPath}/blog/detail.action?blogId=${blog.blogId}" target="_blank">${blog.title }</a>
                    </p>
                    <p class="list_p" style="font-size: 13px;margin-top: 10px;">
                    ${blog.blogger.username} 发表于 
                    <fmt:formatDate value="${blog.publishDate}" type="both"/>
                    </p>
                </div>
                </c:forEach>
            </div>
            
            <jsp:include page="/WEB-INF/page/common/pagination.jsp"></jsp:include>
            
        </div>
        
	    <div class="col-md-3" style="border: 0px solid #ccc; border-radius: 2px;">
	    	<jsp:include page="/WEB-INF/page/common/right.jsp"></jsp:include>
		</div>    	
    
    <jsp:include page="/WEB-INF/page/common/copyright.jsp"></jsp:include>
    </div> <!-- /container -->
    
</body>
</html>