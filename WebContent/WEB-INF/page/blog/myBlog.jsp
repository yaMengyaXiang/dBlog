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
				<th nowrap="nowrap">
					<input type="checkbox" id="selectAll" >
				</th>
				<th nowrap="nowrap">编号</th>
				<th nowrap="nowrap">标题</th>
				<th nowrap="nowrap">概要</th>
				<th nowrap="nowrap">类别</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pageBlogs.results}" var="blog" varStatus="vs">
				<tr>
					<td>
						<input type="checkbox" name="blogId" value="${blog.blogId}">
					</td>
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
					<td title="${blog.blogType.typeName }" typeId="${blog.blogType.typeId}">${blog.blogType.typeName }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div style="text-align: center;">
	<ul class="pagination" maxPageNum="${pageBlogs.totalPageNum}">

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

<div style="text-align: center;">
	<a href="javascript:void(0);" onclick="addBlogBtnClick()" class="btn btn-primary" style=" margin: 0 20px;">撰写博客</a>
	
	<a href="javascript:void(0);" onclick="editBlogBtnClick()" class="btn btn-primary" style=" margin: 0 20px;">更新博客</a>
	
	<a href="javascript:void(0);" onclick="deleteBlogBtnClick()" class="btn btn-primary" style=" margin: 0 20px;">删除博客</a>
</div>

 
 	<script type="text/javascript">
	
 	function addBlogBtnClick() {
		$("#aToWriteBlog").trigger("click");
 	}
	
	function editBlogBtnClick() {
		if (checkedLength() == 0) {
			alert("请选择一行！！！");
			return;
		} else if (checkedLength() > 1) {
			alert("请只选择一行！！！");
			return;
		}
		
		var $checkedObj = $(":checkbox[name='blogId']:checked");
		var blogId = $checkedObj.val();
		
		var typeIdTd = $checkedObj.parent().siblings("td[typeId]");
		var typeId = typeIdTd.attr("typeId");
		var url = "${pageContext.request.contextPath}/blog/toEditBlog.action";
		
		var param = {
				"typeId": typeId, 
				"blogId": blogId
		};
		
		$.post(url, param, function(data) {
			$("#mainContentDiv").html(data);
		});
		
	}
	
	var blogIdsToDelete;
	
	function deleteBlogBtnClick() {
		if (checkedLength() == 0) {
			alert("请至少选择一行！！！");
			return;
		}
		
		var $checkedObjs = $(":checkbox[name='blogId']:checked");
		blogIdsToDelete = new Array($checkedObjs.length);
		var j = 0;
		$checkedObjs.each(function() {
			var blogId = $(this).val();
			blogIdsToDelete[j++] = blogId;
		});
		
		// ajax删除
		
	}
	
	// 处于选中的checkbox的数量
	function checkedLength() {
		var blogIds = $(":checkbox[name='blogId']:checked");
		return blogIds.length;
	}
	
	// 判断是否一个都没选中
	function checkForChecked() {
		return checkedLength() != 0;
	}
	
	// 全选checkbox
	$("#selectAll").unbind("click");
	$("#selectAll").bind("click", function() {
		// jquery 1.6之后，checkbox的状态在加载完成页面时已经初始化，并且不会改变状态，
		// 所以下面的方法会一直返回undefined
		// var flag = $("#selectAll").attr('checked');
		// 解决方法是用prop()
		
		$(":checkbox[name='blogId']").prop("checked", $(this).prop("checked"));
		
	});
	
	// 监听点击事件
	$(":checkbox[name='blogId']").unbind("click");
	$(":checkbox[name='blogId']").bind("click", function() {
		var checkedLen = checkedLength(); 
		var allCheckboxLength = $(":checkbox[name='blogId']").length;
		$("#selectAll").prop("checked", checkedLen == allCheckboxLength);
		
	});
	
 	
 	
		function preAndNextPage(linkObj, pageNo) {
			var $linkObj = $(linkObj);
			var url = $linkObj.attr("url");
			
			if ($linkObj.parent().hasClass("disabled")) {
				return;				
			}
			var maxPageNum = $(".pagination:first").attr("maxPageNum");
			
			if (parseInt(pageNo) > parseInt(maxPageNum)) {
				return;
			}
			
			// ajax请求
			$.post(url, null, function(data) {
				if ("null" == data) {
					window.location.href = "${pageContext.request.contextPath}/admin/login.html";
				} else {
					$("#mainContentDiv").html(data);
				}
			});
			
		}
	
	</script>
 