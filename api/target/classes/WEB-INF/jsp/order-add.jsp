<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<%@ include file="../../static/common/common.jsp" %>
</head>
<body>
<article class="page-container">
	<form action="editSupplier" method="post" class="form form-horizontal" id="form-member-add">
        <input hidden="hidden" id="id" name="id" value="-1">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>订单日期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" onfocus="WdatePicker({ maxDate:'%y-%M-%d' })" id="date" name="date" class="input-text Wdate" style="width:200px;">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>车队编码：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="fleetNumber" id="fleetNumber">
					<option value="1">GXT101</option>
					<option value="2">GXT102</option>
					<option value="3">GXT103</option>
					<option value="4">GXT104</option>
					<option value="5">GXT105</option>
				</select>
				</span> </div>
        </div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>车队车牌号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="fleetLicense" name="fleetLicense">
			</div>
		</div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>货物名称：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="goodsName" id="goodsName">
					<option value="1">砂</option>
					<option value="2">土</option>
					<option value="3">石</option>
				</select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>供货名称：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="supplierName" id="supplierName">
					<option value="1">1店</option>
					<option value="2">2店</option>
					<option value="3">3店</option>
					<option value="4">4店</option>
					<option value="5">5店</option>
				</select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>供货单号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="supplierCertify" name="supplierCertify">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>计费数量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="goodsCount" name="goodsCount">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>货物单价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="goodsPrice" name="goodsPrice">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>货物金额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="goodsMoney" name="goodsMoney">
            </div>
        </div>
        <br>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>收货单位：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="receiverName" id="receiverName">
					<option value="1">北京</option>
					<option value="2">上海</option>
					<option value="3">石家庄</option>
				</select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>收货方单号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="receiverCertify" name="receiverCertify">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>收货数量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="receiverCount" name="receiverCount">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>收货单价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="receiverPrice" name="receiverPrice">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>收货金额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="receiverMoney" name="receiverMoney">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>利润：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="profit" name="profit">
            </div>
        </div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea id="memo" name="memo" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入1个字符"  ></textarea>
			</div>
		</div>
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2" style="padding-top: 10px">
            <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
            date:{
				required:true,
			},
            fleetNumber:{
                required:true,
                minlength:0,
                maxlength:50
            },
            fleetLicense:{
                required:true,
                minlength:0,
                maxlength:50
            }, goodsName:{
                required:true,
                minlength:0,
                maxlength:50
            },supplierName:{
                required:true,
                minlength:0,
                maxlength:50
            },supplierCertify:{
                required:true,
                minlength:0,
                maxlength:50
            },goodsCount:{
                required:true,
                isNumber:true
            },goodsPrice:{
                required:true,
                isNumber:true
            },goodsMoney:{
                required:true,
                isNumber:true
            },receiverName:{
                required:true,
                minlength:0,
                maxlength:50
            },receiverCertify:{
                required:true,
                minlength:0,
                maxlength:50
            },receiverCount:{
                required:true,
                isNumber:true
            },receiverPrice:{
                required:true,
                isNumber:true
            },receiverMoney:{
                required:true,
                isNumber:true
            },profit:{
                required:true,
                isNumber:true
            }
		},
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit(function(data){
                if(data == "新增" || data == "修改" ){
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layerResult(data,index);
                } else{
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
        $("#supplierAddress").val()
        $('#telephone').val("");
        $("#sex-1").attr("checked","checked");
        if(id != -1){
            $.ajax({
                url:_basePath +"order/querySupplierList",
                data:{id:id},
                success:function(data){
                    var json = JSON.parse(data).data[0];
                    $('#f_id').val(json.id)
                    $("#memo").val(json.memo)
                    $('#supplierName').val(json.supplierName)
                    $('#supplierOfficial').val(json.supplierOfficial)
                    $('#telephone').val(json.telephone)
                    $('#supplierAddress').val(json.supplierAddress)
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