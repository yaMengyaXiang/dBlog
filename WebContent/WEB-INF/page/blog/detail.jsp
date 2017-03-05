<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客详情</title>

<jsp:include page="/WEB-INF/page/common/static.jsp"></jsp:include>

	<script type="text/javascript">
	
		function checkImageCode() {
			var url = "${pageContext.request.contextPath}/system/checkImageCode.action";
			var imageCode = $("#imageCode").val();
			if (imageCode == "") {
				alert("验证码不能为空！");
				return;
			}
			var param = {
					"imageCode": imageCode
			};
			
			$.post(url, param, function(data) {
				if (data == "true") {
					if ($("#content").val() == "") {
						alert("内容不能为空！");
						return;
					}
					publishComment();
				} else {
					alert("验证码错误！");
					$("#imageCode").val("");
				}
			});
		}
		
		function publishComment() {
			$("#commentForm").submit();
		}
		
		function createImage(img) {
			var $img = $(img);
			var url = $img.attr("src");
			var timestamp = (new Date()).valueOf();
			$img.attr("src", url + "?time=" + timestamp);
		}
	
		function searchBlogKeyWord(kw) {
			$("#searchForm input[name='keyWord']").val(kw);
			$("#searchForm a").trigger("click");
		}		
		
	</script>

</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/page/common/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/page/common/navbar.jsp"></jsp:include>
	 <div class="row" style="border: 0px solid #ccc; border-radius: 2px;">
            <div class="col-md-9" style="border: 0px solid #ccc; border-radius: 2px;">
                <div class="data-list">
                    <div class="data-list-title">
                        <span class="glyphicon glyphicon-list-alt"></span>
                        博客信息
                    </div>
                    <div>
                        <div class="blog-title">
                            ${blog.title}
                        </div>
                        <div class="blog-info">
                            博主：${blog.blogger.username }  &nbsp;&nbsp;
                            发布时间：<fmt:formatDate value="${blog.publishDate }" type="both"/>  &nbsp;&nbsp;
                            博客类别：${blog.blogType.typeName } &nbsp;&nbsp;
                            阅读(${blog.clickHit }) &nbsp;&nbsp;
                            评论(${blog.replyHit })
                        </div>
                        <div class="blog-content">
                            ${blog.content }
                        </div>
                        <div class="blog-keyWord">
                            <label style="font-weight: bold;">关键字：</label>
                            <c:forEach items="${keyWords }" var="keyWord">
	                            <a onclick="searchBlogKeyWord('${keyWord}')" href="javascript:void(0);">${keyWord }</a>
                            </c:forEach>
                        </div>
                        <div class="blog-prevAndNext-blog">
                            <p>
							上一篇：
								<c:if test="${empty previousBlog }">
									没有了
								</c:if>
								<c:if test="${!empty previousBlog }">
                                <a href="${pageContext.request.contextPath}/blog/detail.action?blogId=${previousBlog.blogId}">${previousBlog.title }</a>
								</c:if>
                            </p>
                            <p>
							下一篇：
								<c:if test="${empty nextBlog }">
									没有了
								</c:if>
								<c:if test="${!empty nextBlog }">
                                <a href="${pageContext.request.contextPath}/blog/detail.action?blogId=${nextBlog.blogId}">${nextBlog.title }</a>
                                </c:if>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="data-list">
                    <div class="data-list-title">
                        <i style="font-size: 18px;" class="fa fa-comments-o"></i>
                        评论信息
                    </div>
                    <c:forEach items="${comments }" var="comment" varStatus="vs">
	                    <div class="blog-comments">
	                        <div class="blog-comment">
	                            <label style="font-weight: bold;">
	                                ${vs.count }楼&nbsp;&nbsp;
	                                ${comment.userIp }: &nbsp;&nbsp;
	                            </label>
	                            ${comment.content }&nbsp;&nbsp;
	                            【 <fmt:formatDate value="${comment.commentDate }" type="both"/> 】
	                        </div>
	                    </div>
                    </c:forEach>
                </div>
                
				<div class="data-list">
	                    <div class="data-list-title">
	                        <i style="font-size: 18px;" class="fa fa-commenting-o"></i>
	                        	发表评论
	                    </div>
	                    <div class="blog-publish-comment">
	                    	<form id="commentForm" action="${pageContext.request.contextPath}/comment/publishComment.action" method="post">
		                        <div>
		                        	<input name="blogId" type="hidden" value="${blog.blogId}">
		                            <textarea id="content" placeholder="来说两句吧..." name="content" style="width: 100%; resize: vertical; min-height: 100px;"></textarea>
		                        </div>
	                    	</form>
	                        <div class="col-md-8">
	                            <div class="verCode">
	                               	 验证码：
	                                <input id="imageCode" type="text" size="10" name="imageCode" value="">
	                                <img onclick="createImage(this)" style="margin-bottom: 1px; vertical-align: top; cursor: pointer;"
	                                 src="${pageContext.request.contextPath}/system/getImageCode.action">
	                            </div>
	                        </div>
	                        <div class="col-md-4">
	                            <div class="publishCommentBtn">
	                                <a class="btn btn-default" role="button" href="javascript:void(0);" onclick="checkImageCode()">发表评论</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
			</div>
			
		    <div class="col-md-3" style="border: 0px solid #ccc; border-radius: 2px;">
		          <div class="data-list">
		              <div class="data-list-title">
		                  <i style="font-size: 18px;" class="fa fa-user"></i>
		                 	 博主信息
		              </div>
		              <div class="avatar">
		                  <img src="${blog.blogger.avatar}" width="90%" height="90%">
		              </div>
		              <div class="username">
		                  ${blog.blogger.username }
		              </div>
		              <div class="signature">
		                  (${blog.blogger.signature })
		              </div>
		          </div>
		          
				<jsp:include page="/WEB-INF/page/common/right.jsp"></jsp:include>
		          
			</div>  
		</div>
		
		<jsp:include page="/WEB-INF/page/common/copyright.jsp"></jsp:include>
    </div> <!-- /container -->
	
</body>
</html>