<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<div class="data-list">
	<div class="data-list-title">
		<span class="glyphicon glyphicon-list"></span>
		查看类别
	</div>      
	<table class="table table-hover">
		<thead>
			<tr>
				<th nowrap="nowrap">
					<input type="checkbox" id="selectAll" >
				</th>
				<th nowrap="nowrap">编号</th>
				<th nowrap="nowrap">类别</th>
				<th nowrap="nowrap">描述</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pageBlogTypes.results}" var="blogType" varStatus="vs">
				<tr>
					<td>
						<input type="checkbox" name="typeId" value="${blogType.typeId}">
					</td>
					<td>${vs.count }</td>
					<td title="${blogType.typeName}">
						${blogType.typeName}
					</td>
					<td title="${blogType.description }">
						${fn:substring(blogType.description, 0, 36)}
						<c:set var="descLen" value="${fn:length(blogType.description)}"></c:set>
						<c:if test="${descLen > 36 }">
							...
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>	


<div style="text-align: center;">
	<ul class="pagination">

		<li
			<c:if test="${pageBlogTypes.currentPage - 1 == 0}">class="disabled"</c:if>>
			<a
			url="${pageContext.request.contextPath}//blogType/showAllTypes.action?pageNo=${pageBlogTypes.currentPage-1}"
			href="javascript:void(0);"
			onclick="preAndNextPage(this, ${pageBlogTypes.currentPage-1})">&lt;&lt;</a>
		</li>

		<c:forEach items="${pageNums}" var="pageNum">

			<li
				<c:if test="${pageNum == pageBlogTypes.currentPage}">class="active"</c:if>>
				<a
				url="${pageContext.request.contextPath}//blogType/showAllTypes.action?pageNo=${pageNum}"
				href="javascript:void(0);"
				onclick="preAndNextPage(this, ${pageNum})">${pageNum}</a>
			</li>

		</c:forEach>

		<li
			<c:if test="${pageBlogTypes.currentPage + 1 > pageBlogTypes.totalPageNum}">class="disabled"</c:if>>
			<a
			url="${pageContext.request.contextPath}//blogType/showAllTypes.action?pageNo=${pageBlogTypes.currentPage+1}"
			href="javascript:void(0);"
			onclick="preAndNextPage(this, ${pageBlogTypes.currentPage+1})">&gt;&gt;</a>
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
		// ajax请求
		$.post(url, null, function(data) {
			$("#mainContentDiv").html(data);
		});
		
	}

	function addTypeBtnClick() {
		$("#addTypeBtn").trigger("click");
	}
	
	function editTypeBtnClick() {
		if (checkedLength() == 0) {
			alert("请选择一行！！！");
			return;
		} else if (checkedLength() > 1) {
			alert("请只选择一行！！！");
			return;
		}
		
		var $checkedObj = $(":checkbox[name='typeId']:checked");
		var typeId = $checkedObj.val();
		var typeName = $checkedObj.parent().siblings(":eq(1)").attr("title");
		var description = $checkedObj.parent().siblings(":eq(2)").attr("title");
		
		$("#editTypeName").attr("value", typeName);
		$("#editTypeDesc").attr("value", description);
		$("#editHiddenTypeId").attr("value", typeId);
		
		// 触发点击
		$("#editTypeBtn").trigger("click");
		
	}
	
	var typeIdsToDelete;
	
	function deleteTypeBtnClick() {
		if (checkedLength() == 0) {
			alert("请至少选择一行！！！");
			return;
		}
		
		var $checkedObjs = $(":checkbox[name='typeId']:checked");
		typeIdsToDelete = new Array($checkedObjs.length);
		var j = 0;
		$checkedObjs.each(function() {
			var typeId = $(this).val();
			typeIdsToDelete[j++] = typeId;
		});
		
		// 触发点击
		$("#deleteTypeBtn").trigger("click");
		
	}
	
	// 处于选中的checkbox的数量
	function checkedLength() {
		var typeIds = $(":checkbox[name='typeId']:checked");
		return typeIds.length;
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
		
		$(":checkbox[name='typeId']").prop("checked", $(this).prop("checked"));
		
	});
	
	// 监听点击事件
	$(":checkbox[name='typeId']").unbind("click");
	$(":checkbox[name='typeId']").bind("click", function() {
		var checkedLen = checkedLength(); 
		var allCheckboxLength = $(":checkbox[name='typeId']").length;
		$("#selectAll").prop("checked", checkedLen == allCheckboxLength);
		
	});
	
	function editTypeClickToSubmit(submitFormId) {
		var url = $("#" + submitFormId).attr("action");

		var param = {
				"typeId": $("#editHiddenTypeId").val(), 
				"typeName": $("#editTypeName").val(), 
				"description": $("#editTypeDesc").val() 
		};

		$.post(url, param, function(data) {
			$("#mainContentDiv").html(data);
		});
		
	}
	
	function addTypeClickToSubmit(submitFormId) {
		var url = $("#" + submitFormId).attr("action");

		var param = {
				"typeName": $("#addTypeName").val(), 
				"description": $("#addTypeDesc").val() 
		};

		$.post(url, param, function(data) {
			$("#mainContentDiv").html(data);
		});
		
	}
	
	function deleteTypeClickToSubmit(btnObj) {
		var url = $(btnObj).attr("url");

		var param = {
				"typeIds": typeIdsToDelete, 
		};

		$.post(url, param, function(data) {
			$("#mainContentDiv").html(data);
		});
		
	}
	
	
</script>


<div style="text-align: center;">
	<!-- 按钮触发模态框 -->
	<a href="javascript:void(0);" onclick="addTypeBtnClick()" class="btn btn-primary" style=" margin: 0 20px;">新增类别</a>
	<button id="addTypeBtn" style="display: none;" data-toggle="modal" data-target="#addTypeModal"></button>
	
	<!-- 按钮触发模态框 -->
	<a href="javascript:void(0);" onclick="editTypeBtnClick()" class="btn btn-primary" style=" margin: 0 20px;">编辑类别</a>
	<button id="editTypeBtn" style="display: none;" data-toggle="modal" data-target="#editTypeModal"></button>
	
	<a href="javascript:void(0);" onclick="deleteTypeBtnClick()" class="btn btn-primary" style=" margin: 0 20px;">删除类别</a>
	<button id="deleteTypeBtn" style="display: none;" data-toggle="modal" data-target="#deleteTypeModal"></button>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="addTypeModal" submitForm="" tabindex="-1" role="dialog" aria-labelledby="addTypeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
					新增类别
				</h4>
			</div>
			<div class="modal-body">
				
				<form id="addTypeForm" class="form-horizontal" action="${pageContext.request.contextPath}/blogType/saveBlogType.action" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">类型名称</label>
						<div class="col-sm-10">
							<input type="text" id="addTypeName" name="typeName" style="width: 65%;">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">描述</label>
					    <div class="col-sm-10">
							<input type="text" id="addTypeDesc" name="description" style="width: 80%;">
					    </div>
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button onclick="addTypeClickToSubmit('addTypeForm')" type="button" class="btn btn-primary">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="editTypeModal" submitForm="" tabindex="-1" role="dialog" aria-labelledby="editTypeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
					编辑类别
				</h4>
			</div>
			<div class="modal-body">
				
				<form id="editTypeForm" class="form-horizontal" action="${pageContext.request.contextPath}/blogType/editBlogType.action" method="post">
					<input type="hidden" id="editHiddenTypeId" name="typeId" value="">
					<div class="form-group">
						<label class="col-sm-2 control-label">类型名称</label>
						<div class="col-sm-10">
							<input id="editTypeName" type="text" name="typeName" style="width: 65%;">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">描述</label>
					    <div class="col-sm-10">
							<input type="text" name="description" id="editTypeDesc" style="width: 80%;">
					    </div>
					</div>
				</form>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button onclick="editTypeClickToSubmit('editTypeForm')" type="button" class="btn btn-primary">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="deleteTypeModal" tabindex="-1" role="dialog" aria-labelledby="deleteTypeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
					删除类别
				</h4>
			</div>
			<div class="modal-body">
				确定要删除所选类别吗？
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button url="${pageContext.request.contextPath}/blogType/deleteTypes.action"
				 onclick="deleteTypeClickToSubmit(this)" type="button" class="btn btn-primary">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
