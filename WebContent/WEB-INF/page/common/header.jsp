<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script type="text/javascript">
    	
	    function searchKeyWord(formId) {
	    	$("#" + formId).submit();
	    }
    
    </script>
    
	<div class="row">
		<div class="col-md-3 col-sm-3 col-xs-3">
			<a target="_blank" href="${pageContext.request.contextPath}">
				<img alt="logo" src="${pageContext.request.contextPath}/static/image/logo.png">
			</a>
		</div>
		<div class="col-md-9 col-sm-9 col-xs-9" style="text-align: right; height: 50px; padding-top:10px;">
		
			<form id="searchForm" class="form-inline" role="form"
				action="${pageContext.request.contextPath}/blog/search.action" method="post">
            	<input name="keyWord" value="${keyWord}" type="text" class="form-control" style="width: 300px; height: 34px;" placeholder="请输入要查询的关键字">
            	<a onclick="searchKeyWord('searchForm')" class="btn btn-default" role="button" style="height: 34px;" href="javascript:void(0);">
            		<i style="font-size: 18px;" class="fa fa-search"></i>
            	</a>
          	</form>
		
		</div>
	</div>
	