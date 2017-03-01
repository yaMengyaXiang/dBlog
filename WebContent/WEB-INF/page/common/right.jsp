<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    
		<div class="data-list">
          <div class="data-list-title">
              <span class="glyphicon glyphicon-list"></span>
              阅读排行榜
          </div>
          <ol style="margin: 15px auto;">
          	<c:forEach items="${maxClickBlogs }" var="maxClickBlog">
              <li>
                  <p class="list_p_title">
                  <a target="_blank" href="${pageContext.request.contextPath}/blog/detail.action?blogId=${maxClickBlog.blogId}">${maxClickBlog.title}</a>
                  </p>
              </li>
          	</c:forEach>
          </ol>
      </div>
      <div class="data-list">
          <div class="data-list-title">
              <i style="font-size: 18px;" class="fa fa-comment"></i>
              最新评论
          </div>
          <ol style="margin: 15px auto;">
          	<c:forEach items="${latestCommentBlogs }" var="latestCommentBlog">
              <li>
                  <p class="list_p_title">
                  <a target="_blank" href="${pageContext.request.contextPath}/blog/detail.action?blogId=${latestCommentBlog.blogId}">${latestCommentBlog.title}</a>
                  </p>
              </li>
          	</c:forEach>
          </ol>
      </div>
      <div class="data-list">
          <div class="data-list-title">
              <span class="glyphicon glyphicon-link"></span>
              友情链接
          </div>
          <ul style="margin: 15px auto;">
              <li>
                  <p class="list_p_title"><a target="_blank" href="https://www.baidu.com">百度</a></p>
              </li>
              <li>
                  <p class="list_p_title"><a target="_blank" href="http://www.zhihu.com">知乎</a></p>
              </li>
              <li>
                  <p class="list_p_title"><a target="_blank" href="http://www.cnblogs.com">博客园</a></p>
              </li>
              <li>
                  <p class="list_p_title"><a target="_blank" href="http://www.runoob.com">菜鸟教程</a></p>
              </li>
          </ul>
      </div>
	