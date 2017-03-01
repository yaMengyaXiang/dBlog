<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath}/static/js/jquery-form.js"></script>

<script type="text/javascript">
	
	function linkMain(aObj) {
		var $a = $(aObj);
		var url = $a.attr("url");
		
		var $loading = $("<img src='${pageContext.request.contextPath}/static/image/loading.gif'>");
		$loading.css("width", "20px");
		$loading.css("height", "20px");
		$loading.css("float", "right");
		
		$a.after($loading);
		
		// ajax请求
		$.post(url, null, function(data) {
			if ("null" == data) {
				window.location.href = "${pageContext.request.contextPath}/admin/login.html";
			} else {
				$("#mainContentDiv").html(data);
				$loading.remove();
			}
		});
	}
	
	$(function() {
		
		$(window).scroll(function() {
			var top = $(window).scrollTop();
			var height = 100;
			if (top > height) {
				var y = $(window).scrollTop() - height;
				$("#menuDiv").css("top", y + "px");
			} else {
				$("#menuDiv").css("top", "0px");
			}
		});
		
	});

</script>

<div class="col-md-3">
	<div class="data-list" id="menuDiv" style="position: relative;">
		<div class="panel-group" id="accordion">

			<div class="panel panel-info">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseZero">常用操作 </a>
					</h4>
				</div>
				<div id="collapseZero" class="panel-collapse collapse in">
					<div class="panel-body">
						<ul class="list-group">
							<li class="list-group-item">
								<a url="${pageContext.request.contextPath}/blog/toWriteBlog.action"  
								href="javascript:void(0);" onclick="linkMain(this)">撰写博客</a>
							</li>
							<li class="list-group-item">
								<a url="${pageContext.request.contextPath}/blog/toMyBlog.action"   
								href="javascript:void(0);" onclick="linkMain(this)">我的博客</a>
							</li>
							<li class="list-group-item">
								<a url="${pageContext.request.contextPath}/blogType/showAllTypes.action" 
								 href="javascript:void(0);" onclick="linkMain(this)">查看类别</a>
							</li>
							<li class="list-group-item">
								<a url="${pageContext.request.contextPath}/blogger/toBloggerInfo.action"
								href="javascript:void(0);" onclick="linkMain(this)">修改个人信息</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="panel panel-warning">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne">博客管理 </a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse ">
					<div class="panel-body">
						<ul class="list-group">
							<li class="list-group-item">
								<a id="aToWriteBlog" url="${pageContext.request.contextPath}/blog/toWriteBlog.action"  
								href="javascript:void(0);" onclick="linkMain(this)">撰写博客</a>
							</li>
							<li class="list-group-item">
								<a url="${pageContext.request.contextPath}/blog/toMyBlog.action"   
								href="javascript:void(0);" onclick="linkMain(this)">我的博客</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="panel panel-danger">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseTwo">类别管理 </a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse">
					<div class="panel-body">
						<ul class="list-group">
							<li class="list-group-item">
								<a url="${pageContext.request.contextPath}/blogType/showAllTypes.action" 
								 href="javascript:void(0);" onclick="linkMain(this)">查看类别</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="panel panel-success">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseThree">评论管理 </a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse">
					<div class="panel-body">
						<ul class="list-group">
							<li class="list-group-item"><a href="javascript:void(0);" onclick="alert('很抱歉，暂未开发！');">浏览评论</a></li>
							<li class="list-group-item"><a href="javascript:void(0);" onclick="alert('很抱歉，暂未开发！');">删除评论</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseFour">博主管理 </a>
					</h4>
				</div>
				<div id="collapseFour" class="panel-collapse collapse">
					<div class="panel-body">
						<ul class="list-group">
							<li class="list-group-item">
								<a url="${pageContext.request.contextPath}/blogger/toBloggerInfo.action"
								href="javascript:void(0);" onclick="linkMain(this)">修改个人信息</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>