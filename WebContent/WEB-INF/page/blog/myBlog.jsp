<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<div class="data-list">
	<div class="data-list-title">
		<span class="glyphicon glyphicon-list"></span>
		我的博客
	</div>      
	<table class="table table-hover">
		<thead>
			<tr>
				<th nowrap="nowrap">编号</th>
				<th nowrap="nowrap">标题</th>
				<th nowrap="nowrap">概要</th>
				<th nowrap="nowrap">类别</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pageBlogs.results}" var="blog" varStatus="vs">
				<tr>
					<td>${vs.count }</td>
					<td title="${blog.title}">
						<a href="${pageContext.request.contextPath}/blog/detail.action?blogId=${blog.blogId}" 
							target="_blank">
							${fn:substring(blog.title, 0, 20)}
							<c:set var="titleLen" value="${fn:length(blog.title)}"></c:set>
							<c:if test="${titleLen > 20 }">
								...
							</c:if>
							</a>
					</td>
					<td title="${blog.summary }">
						${fn:substring(blog.summary, 0, 25)}
						<c:set var="sumLen" value="${fn:length(blog.summary)}"></c:set>
						<c:if test="${sumLen > 25 }">
							...
						</c:if>
					</td>
					<td title="${blog.blogType.typeName }">${blog.blogType.typeName }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div style="text-align: center;">
	<ul class="pagination">

		<li
			<c:if test="${pageBlogs.currentPage - 1 == 0}">class="disabled"</c:if>>
			<a
			url="${pageContext.request.contextPath}/blog/toMyBlog.action?pageNo=${pageBlogs.currentPage-1}"
			href="javascript:void(0);"
			onclick="preAndNextPage(this, ${pageBlogs.currentPage-1})">&lt;&lt;</a>
		</li>

		<c:forEach items="${pageNums}" var="pageNum">

			<li
				<c:if test="${pageNum == pageBlogs.currentPage}">class="active"</c:if>>
				<a
				url="${pageContext.request.contextPath}/blog/toMyBlog.action?pageNo=${pageNum}"
				href="javascript:void(0);"
				onclick="preAndNextPage(this, ${pageNum})">${pageNum}</a>
			</li>

		</c:forEach>

		<li
			<c:if test="${pageBlogs.currentPage + 1 > pageBlogs.totalPageNum}">class="disabled"</c:if>>
			<a
			url="${pageContext.request.contextPath}/blog/toMyBlog.action?pageNo=${pageBlogs.currentPage+1}"
			href="javascript:void(0);"
			onclick="preAndNextPage(this, ${pageBlogs.currentPage+1})">&gt;&gt;</a>
		</li>
		
	</ul>
</div>
 
 	<script type="text/javascript">
	
		function preAndNextPage(linkObj, pageNo) {
			var $linkObj = $(linkObj);
			var url = $linkObj.attr("url");
			
			if ($linkObj.parent().hasClass("disabled")) {
				return;				
			}
			var param = {
					"pageNo": pageNo
			};
			
			var checkUrl = "${pageContext.request.contextPath}/blog/checkMyBlogPageNum.action";
			$.post(checkUrl, param, function(flag) {
				if (flag == "null") {
					window.location.href = "${pageContext.request.contextPath}/admin/login.html";
				} else if (flag == "true") {
					// ajax请求
					$.post(url, null, function(data) {
						if ("null" == data) {
							window.location.href = "${pageContext.request.contextPath}/admin/login.html";
						} else {
							$("#mainContentDiv").html(data);
						}
					});
				} 
			});
			
		}
	
	</script>
 