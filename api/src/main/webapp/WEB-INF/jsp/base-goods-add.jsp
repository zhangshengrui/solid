<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<%@ include file="common.jsp" %>
</head>
<body>
<article class="page-container">
	<form action="goods/editSupplier" method="post" class="form form-horizontal" id="form-member-add">
        <input type="hidden"  value="-1" name="id" id="f_id">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>货物名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="name" name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">是否开启：</label>
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
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>货物编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="" name="number" id="number">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>货物价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="" name="price" id="price">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>供货商名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select class="select" name="address" id="address">
                    </select>
				</span>
			</div>
		</div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>换算价格：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="" name="conversion" id="conversion">
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
            name:{
				required:true,
				minlength:1,
				maxlength:50
			},
            number:{
                required:true,
                minlength:1,
                maxlength:50
            },
            address:{
                required:true,
                minlength:1,
                maxlength:50
            },
            price:{
                required:true,
                isFloat:true,
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
                    layer.msg('当前货物名称已存在!',{icon:2,time:2000});
                }else{
                    layer.msg('操作失败!',{icon:2,time:2000});
                }
            });
		}
	});

    $("#address").change(function(){
        addressChange();
    });

});
$(function(){
    InitCombobox();
    InitValue();
})
function addressChange(){
    var address = $('#address').val();
    $('#conversion').val('');
    $.ajax({
        url:_basePath+"base/supplier/querySupplierList",
        async:false,
        data:{supplierName: address},
        success:function(data){
            var json = JSON.parse(data).data
            for(var i in json){
                if(json[i].supplierName == address && json[i].status === 0){
                    $('#conversion').val(json[i].conversion)
                }
            }
        }
    });
}
function InitCombobox(){
  $.ajax({
      url:_basePath+"base/supplier/querySupplierList",
      async:false,
      success:function(data){
          var json = JSON.parse(data);
          $.each(json.data,function(index,value){
              if(value.status === 0){
                  $("#address").append("<option value='"+value.supplierName+"'>"+value.supplierName+"</option>");
              }
          })
      }
  })
}

function InitValue(){
    var id = <%=session.getAttribute("id")%>
    if(check(id)){
        id = -1
    }
    $('#f_id').val("-1");
    $("#memo").val("");
    $("#sex-1").attr("checked","checked");
    $('#name').val("");
    $('#number').val("");
    $("#address").val();
    $('#price').val("");
    addressChange();
    if(id != -1){
        $.ajax({
            url:_basePath +"base/goods/querySupplierList",
            data:{id:id},
            success:function(data){
                var json = JSON.parse(data).data[0];
                $('#f_id').val(json.id);
                $("#memo").val(json.memo);
                $('#name').val(json.name);
                $('#number').val(json.number);
                $('#price').val(json.price);
                $('#conversion').val(json.conversion)
                var arr = document.getElementById('address').children
                $.each(arr,function(index,value){
                    if(value.text == json.address){
                        this.selected = true;
                    }
                })
            },
            error:function () {
                layer.msg('系统异常!',{icon:2,time:1000});
            }
        })
    }
}
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>