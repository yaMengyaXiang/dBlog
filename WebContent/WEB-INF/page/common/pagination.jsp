<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	
	function preAndNextLink(linkObj, pageNo) {
		var $linkObj = $(linkObj);
		var url = $("#myPagination").attr("url");
		
		var queryString = $linkObj.attr("param");
		
		url = url + "?" + queryString;
		
		if ($linkObj.parent().hasClass("disabled")) {
			return;				
		}
		
		var ul = $("#myPagination>ul:first");
		var maxPageNum = $(ul).attr("maxPageNum");
		
		if (parseInt(pageNo) > parseInt(maxPageNum)) {
			return;
		}
		
		window.location.href = url;
		
	}
	
</script>

	<ul class="pagination" maxPageNum="${pageBlogs.totalPageNum}">

		<li
			<c:if test="${pageBlogs.currentPage - 1 == 0}">class="disabled"</c:if>>
			<a
			param="pageNo=${pageBlogs.currentPage-1}"
			href="javascript:void(0);"
			onclick="preAndNextLink(this, ${pageBlogs.currentPage-1})">&lt;&lt;</a>
		</li>

		<c:forEach items="${pageNums}" var="pageNum">

			<li
				<c:if test="${pageNum == pageBlogs.currentPage}">class="active"</c:if>>
				<a
				param="pageNo=${pageNum}"
				href="javascript:void(0);"
				onclick="preAndNextLink(this, ${pageNum})">${pageNum}</a>
			</li>

		</c:forEach>

		<li
			<c:if test="${pageBlogs.currentPage + 1 > pageBlogs.totalPageNum}">class="disabled"</c:if>>
			<a
			param="pageNo=${pageBlogs.currentPage+1}"
			href="javascript:void(0);"
			onclick="preAndNextLink(this, ${pageBlogs.currentPage+1})">&gt;&gt;</a>
		</li>
		
	</ul>
         