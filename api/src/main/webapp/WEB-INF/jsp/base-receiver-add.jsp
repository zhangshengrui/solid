<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<%@ include file="common.jsp" %>
</head>
<body>
<article class="page-container">
	<form action="receiver/editSupplier" method="post" class="form form-horizontal" id="form-member-add">
        <input type="hidden"  value="-1" name="id" id="f_id">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>收货方名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="supplierName" name="supplierName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>是否开启：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="status" type="radio" id="sex-1" value = '0' checked>
					<label for="sex-1">开启</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-2" name="status" value = '1'>
					<label for="sex-2">关闭</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>收货方负责人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="" name="supplierOfficial" id="supplierOfficial">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>转换比例：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="" name="conversion" id="conversion">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>收货单价：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="" name="price" id="price">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>负责人手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="telephone" name="telephone">
			</div>
		</div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">收货方地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="supplierAddress" id="supplierAddress" cols="" rows="" class="textarea"  placeholder=""></textarea>
                <p class="textarea-numberbar"></p>
            </div>
        </div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="memo" id="memo" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入1个字符"></textarea>
				<p class="textarea-numberbar"></p>
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
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-member-add").validate({
		rules:{
            supplierName:{
				required:true,
				minlength:1,
				maxlength:50
			},
            status:{
				required:true
			},
            supplierOfficial:{
                required:false,
                minlength:1,
                maxlength:8
            },
            telephone:{
				required:false,
				isMobile:true,
			},
            price:{
                required:true,
                isFloat:true
            },
            conversion:{
                required:true,
                isFloatGtZero:true,
				isFloat:true
            }
		},
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit(function(data){
                if(data == "新增" || data == "修改" ){
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layerResult(data,index);
                }else if(data == 'repeat'){
                    layer.msg('当前收货方名称已存在!',{icon:2,time:2000});
                }else{
                    layer.msg('操作失败!',{icon:2,time:2000});
                }
            });
		}
	});

	$(function(){
        var id = <%=session.getAttribute("id")%>
        if(check(id)){
            id = -1
        }
        $('#f_id').val("-1");
        $("#memo").val("");
        $('#supplierName').val("");
        $('#supplierOfficial').val("");
        $("#supplierAddress").val();
        $('#telephone').val("");
        $("#sex-1").attr("checked","checked");
        if(id != -1){
            $.ajax({
                url:_basePath +"base/receiver/querySupplierList",
                data:{id:id},
                success:function(data){
                    var json = JSON.parse(data).data[0];
                    $('#f_id').val(json.id);
                    $("#memo").val(json.memo);
                    $('#supplierName').val(json.supplierName);
                    $('#supplierOfficial').val(json.supplierOfficial);
                    $('#telephone').val(json.telephone);
                    $('#supplierAddress').val(json.supplierAddress);
                    $('#price').val(json.price);
                    $('#conversion').val(json.conversion);
                    if(json.status == 1){
                        $("#sex-2").attr("checked","checked");
                    }
                },
                error:function () {
                    layer.msg('系统异常!',{icon:2,time:1000});
                }
            })
        }
    })
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>