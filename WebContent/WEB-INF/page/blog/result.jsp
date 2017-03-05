<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>dBlog--搜索结果</title>

<jsp:include page="/WEB-INF/page/common/static.jsp"></jsp:include>

	<script type="text/javascript">
	
		function searchPreAndNextLink(linkObj, pageNo) {
			var $linkObj = $(linkObj);
			var url = $linkObj.attr("url");
			
			if ($linkObj.parent().hasClass("disabled")) {
				return;				
			}
			var keyWord = $("input[name='keyWord']").val();
			
			var maxPageNum = $(".pagination:first").attr("maxPageNum");
			
			if (parseInt(pageNo) > parseInt(maxPageNum)) {
				return;
			}
			
			window.location.href = url + "&keyWord=" + encodeURI(keyWord);
			
		}
		
		function searchLink(linkObj, pageNo) {
			var $linkObj = $(linkObj);
			var url = $linkObj.attr("url");
			
			var keyWord = $("input[name='keyWord']").val();
			
			window.location.href = url + "&keyWord=" + encodeURI(keyWord);
			
		}
	
	</script>

</head>
<body>
    <div class="container">
	<jsp:include page="/WEB-INF/page/common/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/page/common/navbar.jsp"></jsp:include>
   	<div class="row" style="border: 0px solid #ccc; border-radius: 2px;">
        <div class="col-md-9" style="border: 0px solid #ccc; border-radius: 2px;">
            <div class="data_list" style="border: 1px solid #ccc; border-radius: 2px; padding: 10px;">
                <div style="border-bottom: 1px solid #e5e5e5; font-size: 16px; padding-bottom: 15px; padding-top: 5px; font-weight: bold;">
                    <span class="glyphicon glyphicon-list"></span>
					搜索结果
                </div>
                <c:forEach items="${pageBlogs.results}" var="blog">
                <div class="oneRow" style="width: 95%; height: 75px; margin: 20px auto; border-bottom: 1px solid #ccc;">
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
            <div style="text-align: center;">
            
                <ul class="pagination" maxPageNum="${pageBlogs.totalPageNum}">
                
                	<li <c:if test="${pageBlogs.currentPage - 1 == 0}">class="disabled"</c:if>>
                	<a 
                	url="${pageContext.request.contextPath}/blog/search.action?pageNo=${pageBlogs.currentPage-1}" 
                	href="javascript:void(0);" 
                	onclick="searchPreAndNextLink(this, ${pageBlogs.currentPage-1})">&lt;&lt;</a>
                	</li>
                	
                	<c:forEach items="${pageNums}" var="pageNum">
                	
                		<li <c:if test="${pageNum == pageBlogs.currentPage}">class="active"</c:if>>
                		<a 
                		href="javascript:void(0);" 
                		onclick="searchLink(this, ${pageNum})"
                		url="${pageContext.request.contextPath}/blog/search.action?pageNo=${pageNum}">${pageNum}</a>
                		</li>
                	
                	</c:forEach>
                	
                	<li <c:if test="${pageBlogs.currentPage + 1 > pageBlogs.totalPageNum}">class="disabled"</c:if>>
                	<a 
                	url="${pageContext.request.contextPath}/blog/search.action?pageNo=${pageBlogs.currentPage+1}"
                	href="javascript:void(0);" 
                	onclick="searchPreAndNextLink(this, ${pageBlogs.currentPage+1})">&gt;&gt;</a>
                	</li>
                	
                </ul>
            </div>
        </div>
        
	    <div class="col-md-3" style="border: 0px solid #ccc; border-radius: 2px;">
	    	<jsp:include page="/WEB-INF/page/common/right.jsp"></jsp:include>
		</div>    	
    
    <jsp:include page="/WEB-INF/page/common/copyright.jsp"></jsp:include>
    </div> <!-- /container -->
    
</body>
</html>