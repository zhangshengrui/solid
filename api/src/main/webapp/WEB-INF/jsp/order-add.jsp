<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<%@ include file="../../static/common/common.jsp" %>
</head>
<body>
<article class="page-container">
	<form action="editSupplier" method="post" class="form form-horizontal" id="form-member-add">
        <input hidden="hidden" id="f_id" name="id" value="-1">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>订单日期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" onfocus="WdatePicker({ maxDate:'%y-%M-%d' })" id="date" name="date" class="input-text Wdate" style="width:200px;">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>车队编码：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="fleetNumber" id="fleetNumber" >
				</select>
				</span>
            </div>
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
				</select>
				</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>供货名称：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="supplierName" id="supplierName">
				</select>
				</span>
            </div>
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
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>顿位/方数：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="company" name="company">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>计费数量：</label>
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
            },company:{
                required:true,
                minlength:0,
                maxlength:50
            },
            receiverCount:{
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
                    layer.msg(data+'操作成功!',{icon:1,time:2500});
                } else{
                    layer.msg('操作失败!',{icon:2,time:2000});
                }
            });
		}
	});

	$(function(){
	    initCombobox();
        initTable();
    })

    function fleetChange() {
        alert(111)
    }

    function initCombobox(){
	    //车队编码初始化
        $.ajax({
            url:_basePath+"base/fleet/querySupplierList",
            async:false,
            success:function(data){
                var json = JSON.parse(data);
                $.each(json.data,function(index,value){
                    $("#fleetNumber").append("<option value='"+value.number+"'>"+value.number+"</option>");
                })
            }
        });

        //货物名称初始化
        $.ajax({
            url:_basePath+"base/goods/querySupplierList",
            async:false,
            success:function(data){
                var json = JSON.parse(data);
                $.each(json.data,function(index,value){
                    $("#goodsName").append("<option value='"+value.name+"'>"+value.name+"</option>");
                })
            }
        });

        //供货名称初始化
        $.ajax({
            url:_basePath+"base/supplier/querySupplierList",
            async:false,
            success:function(data){
                var json = JSON.parse(data);
                $.each(json.data,function(index,value){
                    $("#supplierName").append("<option value='"+value.supplierName+"'>"+value.supplierName+"</option>");
                })
            }
        });

        //收货单位初始化
        $.ajax({
            url:_basePath+"base/receiver/querySupplierList",
            async:false,
            success:function(data){
                var json = JSON.parse(data);
                $.each(json.data,function(index,value){
                    $("#receiverName").append("<option value='"+value.supplierName+"'>"+value.supplierName+"</option>");
                })
            }
        });
    }

	function　initTable(){
        var id = <%=session.getAttribute("id")%>
        if(check(id)){
            id = -1
        }
        $('#f_id').val(-1)
        $('#date').val("")
        $('#fleetNumber').val("")
        $('#fleetLicense').val("")
        $('#goodsName').val("")
        $('#supplierName').val("")
        $('#supplierCertify').val("")
        $('#goodsCount').val("")
        $('#goodsPrice').val("")
        $('#goodsMoney').val("")
        $('#receiverName').val("")
        $('#receiverCertify').val("")
        $('#receiverCount').val("")
        $('#receiverPrice').val("")
        $('#receiverMoney').val("")
        $('#profit').val("")
        $('#company').val("")
        $('#memo').val("")
        if(id != -1){
            $.ajax({
                url:_basePath +"order/querySupplierList",
                data:{id:id},
                success:function(data){
                     console.log(1)
                    var json = JSON.parse(data).data[0];
                    $('#f_id').val(json.id)
                    $('#date').val(json.date)
                    $('#fleetNumber').val(json.fleetNumber)
                    $('#fleetLicense').val(json.fleetLicense)
                    $('#goodsName').val(json.goodsName)
                    $('#supplierName').val(json.supplierName)
                    $('#supplierCertify').val(json.supplierCertify)
                    $('#goodsCount').val(json.goodsCount)
                    $('#goodsPrice').val(json.goodsPrice)
                    $('#goodsMoney').val(json.goodsMoney)
                    $('#receiverName').val(json.receiverName)
                    $('#receiverCertify').val(json.receiverCertify)
                    $('#company').val(json.company)
                    $('#receiverCount').val(json.receiverCount)
                    $('#receiverPrice').val(json.receiverPrice)
                    $('#receiverMoney').val(json.receiverMoney)
                    $('#profit').val(json.profit)
                    $('#memo').val(json.memo)
                },
                error:function () {
                    layer.msg('系统异常!',{icon:2,time:1000});
                }
            })
        }
    }
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>