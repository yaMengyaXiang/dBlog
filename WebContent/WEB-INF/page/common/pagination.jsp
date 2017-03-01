<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div style="text-align: center;">
	<ul class="pagination">

		<li
			<c:if test="${pageBlogs.currentPage - 1 == 0}">class="disabled"</c:if>>
			<a
			url="${pageContext.request.contextPath}/index.html?pageNo=${pageBlogs.currentPage-1}"
			href="javascript:void(0);"
			onclick="preAndNextLink(this, ${pageBlogs.currentPage-1})">&lt;&lt;</a>
		</li>

		<c:forEach items="${pageNums}" var="pageNum">

			<li
				<c:if test="${pageNum == pageBlogs.currentPage}">class="active"</c:if>>
				<a
				href="${pageContext.request.contextPath}/index.html?pageNo=${pageNum}">${pageNum}</a>
			</li>

		</c:forEach>

		<li
			<c:if test="${pageBlogs.currentPage + 1 > pageBlogs.totalPageNum}">class="disabled"</c:if>>
			<a
			url="${pageContext.request.contextPath}/index.html?pageNo=${pageBlogs.currentPage+1}"
			href="javascript:void(0);"
			onclick="preAndNextLink(this, ${pageBlogs.currentPage+1})">&gt;&gt;</a>
		</li>
		
	</ul>
</div>