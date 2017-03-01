<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/static/js/jquery-form.js"></script>

	<script type="text/javascript">
	
		$(function() {
	        
	        $("input[name='imageFile']").unbind("change");
	        $("input[name='imageFile']").bind("change", function() {
	        	var avatar = $(this).val();
				
	        	if (avatar == "") {
	        		alert("请选择图片！");
	        		return;
	        	}
	        	var extName = avatar.substring(avatar.lastIndexOf("."));
	        	if (".jpg" != extName && ".jpeg" != extName
	        			&& ".png" != extName && ".gif" != extName) {
	        		alert("请选择图片上传！");
	        		return;
	        	}
	        	
	        	var objUrl = getObjectURL(this.files[0]);
	        	if (objUrl) {
	        		$("#userImg").attr("src", objUrl);
	        	}
	        	
	        	/* $("#avatarForm").submit(function(data) {
	        		if (data == "false") {
	        			alert("上传失败！");
	        		} else {
	        			$("#userImg").attr("src", data);
	        		}
	        	});
	        	 */
	        });
	        
	    });
		
		
		// 建立一个可存取到该file的url
		function getObjectURL(file) {
			var url = null;
			if (window.createObjectURL != undefined) {	// basic
				url = window.createObjectURL(file);
			} else if (window.URL != undefined) {	// mozilla(firefox)
				url  = window.URL.createObjectURL(file);
			} else if (window.webkitURL != undefined) {	// webkit or chrome
				url = window.webkitURL.createObjectURL(file);
			}
			return url;
		}
	
        function update() {
        	$("#bloggerForm").ajaxSubmit({
        		dataType: "text", 
				success: function(data) {
					if (data == "true") {
						alert("修改成功！");
					}
				}
        	});
        }
        
    </script>


<div class="data-list">
	<div class="data-list-title">
		<i class="fa fa-address-card-o" style="font-size: 18px;"></i>
		修改个人信息
	</div>
</div>
<div class="row">
   	<form id="bloggerForm" method="post" enctype="multipart/form-data" 
   		action="${pageContext.request.contextPath}/blogger/updateBlogger.action">
	    <div class="col-md-6">
	        <div class="data-list" style="min-height: 350px;">
	            <div class="data-list-title">
	                <i style="font-size: 18px;" class="fa fa-user"></i>
			                  博主信息
					<input type="hidden" name="bloggerId" value="${currentUser.bloggerId}" size="36px">
	            </div>
	            <div style="margin-top: 20px; padding: 10px;">
		                <table>
		                    <tr class="blogger-info-table-tr">
		                        <td>名称：</td>
		                        <td>
		                            <input type="text" name="username" value="${currentUser.username}" size="36px">
		                        </td>
		                    </tr>
		                    <tr class="blogger-info-table-tr">
		                        <td>昵称：</td>
		                        <td>
		                            <input type="text" name="nickName" value="${currentUser.nickName}" size="36px">
		                        </td>
		                    </tr>
		                    <tr class="blogger-info-table-tr">
		                        <td>个性签名：</td>
		                        <td>
		                            <input type="text" name="signature" value="${currentUser.signature}" size="36px">
		                        </td>
		                    </tr>
		                    <tr class="blogger-info-table-tr">
		                        <td>个人简介：</td>
		                        <td>
		                            <input type="text" name="description" value="${currentUser.description}" size="36px">
		                        </td>
		                    </tr>
		                </table>
	            </div>
	        </div>
	    </div>
	    
	    <div class="col-md-6">
	        <div class="data-list" style="min-height: 350px;">
	            <div class="data-list-title">
	                <i style="font-size: 18px;" class="fa fa-image"></i>
	                	博主头像
	            </div>
		            <div style="margin-top: 15px;">
		            	更改头像：
		            	<input type="file" value="" name="imageFile" size="36px">
		            </div>
	            <div style="text-align: center; margin-top: 20px;">
	                <img id="userImg" src="${currentUser.avatar}" 
	                width="90%" height="90%">
	            </div>
	        </div>
	    </div>
	</form>
</div>
<div style="text-align: center;">
	<a href="javascript:void(0);" onclick="update()" class="btn btn-primary" style=" margin: 0 20px;">提交修改</a>
</div>
