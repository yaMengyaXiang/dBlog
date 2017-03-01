<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">

	function submitData(){
		var title = $("#title").val();
		var typeId = $("#typeId option:selected").val();
		var content = UE.getEditor('editor').getContent();
		var keyWord = $("#keyWord").val();
		if(title==null || title==''){
			alert("请输入标题！");
		}else if(typeId==null || typeId==''){
			alert("请选择博客类别！");
		}else if(content==null || content==''){
			alert("请输入内容！");
		}else{
			var param = {
				'title':title,
				'blogType.typeId':typeId,
				'content':content,
				'summary':UE.getEditor('editor').getContentTxt().substr(0,155),
				'keyWord':keyWord
			};
			var url = $("#url").attr("url");
			$.post(url, param, function(data) {
				if(data == 1){
					alert("博客发布成功！");
					resetValue();
				}else{
					alert("博客发布失败！");
				}
			});
		}
	}

	// 重置数据
	function resetValue(){
		$("#title").val("");
		$("#typeId").prop('selectedIndex', 0);
		UE.getEditor('editor').setContent("");
		$("#keyWord").val("");
	}
	
</script>

		
	<div url="${pageContext.request.contextPath}/blog/saveBlog.action" id="url" 
		  style="padding: 10px; margin-top: 10px;">
		  <div class="row">
			  <div class="col-md-12">
				 <div class="data-list-title">
		             <i class="fa fa-pencil-square-o" style="font-size: 18px;"></i>
		             	更新博客
				</div>
		  	</div>
		</div>
		 <div class="row" style="margin-top: 25px; margin-bottom: 25px;">
		 	<div class="col-md-8">
		 		<div>
		 		博客标题：
		 		<input type="text" id="title" name="title" style="width: 70%;" value="${blog.title }"/>
		 		</div>
		 	</div>
		 	<div class="col-md-4">
			 	<div style="text-align: right;">
		 		所属类别：
		 		<select class="" style="width: 65%" id="typeId" name="blogType.typeId" editable="false" panelHeight="auto" >
					<option value="">请选择博客类别...</option>	
				    <c:forEach var="blogType" items="${blogTypes }">
				    	<option <c:if test="${blogType.typeId == blog.blogType.typeId}"> selected="selected"</c:if> 
				    	value="${blogType.typeId }">${blogType.typeName }</option>
				    </c:forEach>			
	            </select>
	            
			 	</div>
            </div>
		 </div>
		 <div class="row" style="margin-top: 15px; margin-bottom: 15px; min-height: 480px;">
		 	<div class="col-md-12">
		 		博客内容：<br/><br/>
		 		<script id="editor" type="text/plain" style="width:100%;height:300px;"></script>
		 		<img src="${pageContext.request.contextPath}/static/image/loading.gif" alt="加载中" 
		             	id="loadingImg" style="margin-left: 20px;">
		 	</div>
		 </div>
		 <div class="row">
		 	<div class="col-md-9">
		 		关键字：
		 		<input type="text" id="keyWord" name="keyWord" ${blog.keyWord } style="width: 55%;"/>&nbsp;(多个关键字中间用空格隔开)
	 		</div>
		 	<div class="col-md-3" style="text-align: right;">
	 			<a href="javascript:void(0)" onclick="submitData()" class="btn btn-default" role="button" >更新博客</a>
	 		</div>
		</div>	 
	
	<script type="text/javascript">
	
	    $("#loadingImg").delay(1000).hide();
	    
	    //实例化编辑器
	    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，
	    // 直接调用UE.getEditor('editor')就能拿到相关的实例
	    var ue = UE.getEditor('editor');
	
	    $("#editor").hide().delay(800).fadeIn();
	</script>
	
	
	 </div>
