<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<%@ include file="../../static/common/common.jsp" %>
</head>
<body>
<article class="page-container">
	<form action="changeOld" method="post" class="form form-horizontal" id="form-member-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">旧密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" value="" placeholder="" id="old" name="old">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">新密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" placeholder="" name="password" id="password">
			</div>
		</div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
	</form>
</article>
<script>
$(function(){

	$("#form-member-add").validate({
		rules:{
            old:{
				required:true,
			},
            password:{
				required:true,
                isPwd:true
			}
		},
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit(function(data){
                if(data == "success"){
                    window.parent.location.href=_basePath+'/logout'
                }else if(data == 'wrong'){
                    layer.msg('原密码错误！',{icon:2,time:2000});
                }else{
                    layer.msg('更新失败!',{icon:2,time:2000});
                }
            });
		}
	});

});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>