<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<%@ include file="common.jsp" %>
</head>
<body>
<article class="page-container">
	<form action="editSupplier" method="post" class="form form-horizontal" id="form-member-add">
        <input hidden="hidden" id="f_id" name="id" value="-1">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>订单日期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd' })" id="date" name="date" class="input-text Wdate" style="width:200px;">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>供货单号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="supplierCertify" name="supplierCertify">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>车队编码：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="fleetNumber" id="fleetNumber">
				</select>
				</span>
            </div>
        </div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>车队车牌号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="fleetLicense" name="fleetLicense" readonly="readonly" style="background: #eae8e8">
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
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>吨位/方数：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="tonnage" name="tonnage">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>转换比例：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="conversion" name="conversion" readonly="readonly" style="background: #eae8e8">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>计费数量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="goodsCount" name="goodsCount" readonly="readonly" style="background: #eae8e8">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>货物单价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="goodsPrice" name="goodsPrice" readonly="readonly" style="background: #eae8e8">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>货物金额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="goodsMoney" name="goodsMoney" readonly="readonly" style="background: #eae8e8">
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
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>吨位/方数：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="company" name="company">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>转换比例：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="receiverConversion" name="receiverConversion" readonly="readonly" style="background: #eae8e8">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>计费数量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="receiverCount" name="receiverCount" readonly="readonly" style="background: #eae8e8">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>收货单价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="receiverPrice" name="receiverPrice" readonly="readonly" style="background: #eae8e8">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>收货金额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="receiverMoney" name="receiverMoney" readonly="readonly" style="background: #eae8e8">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>利润：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="profit" name="profit" readonly="readonly" style="background: #eae8e8">
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

    $("#fleetNumber").change(function(){
        fleetNumberChange();
    });

    $("#receiverName").change(function(){
        receiverNameChange();
        money1();money2();
    });

    $("#goodsName").change(function(){
        goodsNameChange();
        money1();money2();
    });

    $('#tonnage').blur(function(){
        money1();
        money2();
    });

    $('#company').blur(function(){
        money1();
        money2();
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
                isFloat:true
            },tonnage:{
                required:true,
                isFloat:true
            },conversion:{
                required:true,
                isFloatGtZero:true,isFloat:true
            },goodsPrice:{
                required:true,
                isFloat:true
            },goodsMoney:{
                required:true,
                isFloat:true
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
                isFloat:true
            },receiverPrice:{
                required:true,
                isFloat:true
            },receiverMoney:{
                required:true,
                isFloat:true
            },profit:{
                required:true,
                isFloat:true
            },receiverConversion:{
                required:true,
                isFloatGtZero:true,
                isFloat:true
            }
		},
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit(function(data){
                if(data == "新增"){
                    $('#supplierCertify').val('');
                    $('#tonnage').val('');
                    $('#company').val('');
                    $('#goodsCount').val("");
                    $('#goodsMoney').val("");
                    $('#receiverName').val("");
                    $('#receiverCertify').val("");
                    $('#receiverCount').val("");
                    $('#receiverMoney').val("");
                    $('#profit').val("");
                    $('#memo').val("");
                    layer.msg('新增操作成功!',{icon:1,time:2500});
                }else if(data == '修改'){
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layerResult(index);
                }
                else{
                    layer.msg('操作失败!',{icon:2,time:2000});
                }
            });
		}
	});

	$(function(){
	    initCombobox();
        initTable();
    });

	function money1(){
        var tonnage = $('#tonnage').val();  //单位
        var conversion =$('#conversion').val();//换算单位
        var reg = /^[0-9]+([.]{1}[0-9]+){0,1}$/;
        if(!reg.test(tonnage)  || !reg.test(conversion)){ //校验
            console.log("is wrong number")
            return;
        }
        tonnage = parseFloat(tonnage);
        conversion = parseFloat(conversion);
        if(isNaN(tonnage) ||isNaN(conversion)||conversion===0||conversion==0){
            console.log("is NaN")
            return
        }

        var num = tonnage / conversion;
        var count = num.toFixed(2);
        console.log("count"+count)
        $('#goodsCount').val(count)

        var goodsPrice= $('#goodsPrice').val(); //单价
        if(!reg.test(goodsPrice) || !reg.test(count)){
            return;
        }
        goodsPrice = parseFloat(goodsPrice);
        if(isNaN(goodsPrice) || isNaN(count)){
            return;
        }
        var money = goodsPrice * count;
        console.log("money"+money)
        $('#goodsMoney').val(money.toFixed(2))
    }

    function money2(){
        var company = $('#company').val();  //单位
        var conversion =$('#receiverConversion').val();//换算单位
        var reg = /^[0-9]+([.]{1}[0-9]+){0,1}$/;
        if(!reg.test(company)  || !reg.test(conversion)){ //校验
            console.log("is wrong number")
            return;
        }
        company = parseFloat(company);
        conversion = parseFloat(conversion);
        if(isNaN(company) ||isNaN(conversion)||conversion===0||conversion==0){
            console.log("is NaN")
            return
        }

        var num = company / conversion;
        var count = num.toFixed(2);
        console.log("count"+count)
        $('#receiverCount').val(count)

        var receiverPrice= $('#receiverPrice').val(); //收获单价
        if(!reg.test(receiverPrice) || !reg.test(count)){
            return;
        }
        receiverPrice = parseFloat(receiverPrice);
        if(isNaN(receiverPrice) || isNaN(count)){
            return;
        }
        var money = receiverPrice * count;
        console.log("money"+money)
        money = money.toFixed(2)
        $('#receiverMoney').val(money)

        var a = $('#goodsMoney').val()
        if(!reg.test(a) ){
            return;
        }
        a = parseFloat(a);
        if(isNaN(a)){
            return
        }
        var profit = (money - a).toFixed(2);
        console.log(profit)
        $('#profit').val(profit);
    }

	function goodsNameChange(){
        var name = $('#goodsName').val();
        $('#supplierName').val('');
        $('#conversion').val('');
        $('#goodsPrice').val('');
        $.ajax({
            url:_basePath+"base/goods/querySupplierList",
            async:false,
            data:{name: name},
            success:function(data){
                var json = JSON.parse(data).data
                for(var i in json){
                    if(json[i].name == name){
                        $('#supplierName').val(json[i].address)
                        $('#conversion').val(json[i].conversion)
                        $('#goodsPrice').val(json[i].price)
                    }
                }
            }
        });
    }
	function receiverNameChange() {
        var receiverName = $('#receiverName').val();
        $('#receiverPrice').val('');
        $.ajax({
            url:_basePath+"base/receiver/querySupplierList",
            async:false,
            data:{supplierName: receiverName},
            success:function(data){
                var json = JSON.parse(data).data
                for(var i in json){
                    if(json[i].supplierName == receiverName){
                        $('#receiverPrice').val(json[i].price);
                        $('#receiverConversion').val(json[i].conversion);
                    }
                }
            }
        });
    }

	function fleetNumberChange(){
        var fleetNumber = $('#fleetNumber').val();
        $('#fleetLicense').val('');
        $.ajax({
            url:_basePath+"base/fleet/querySupplierList",
            async:false,
            data:{number: fleetNumber},
            success:function(data){
                var json = JSON.parse(data).data
                for(var i in json){
                    if(json[i].number == fleetNumber){
                        $('#fleetLicense').val(json[i].license)
                    }
                }
            }
        });
    }

    function initCombobox(){
	    //车队编码初始化
        $.ajax({
            url:_basePath+"base/fleet/querySupplierList",
            async:false,
            success:function(data){
                var json = JSON.parse(data);
                $.each(json.data,function(index,value){
                    if(value.status ===0){
                        $("#fleetNumber").append("<option value='"+value.number+"'>"+value.number+"</option>");
                    }
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
                    if(value.status ===0){
                        $("#goodsName").append("<option value='"+value.name+"'>"+value.name+"</option>");
                    }
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
                    if(value.status ===0){
                        $("#supplierName").append("<option value='"+value.supplierName+"'>"+value.supplierName+"</option>");
                    }
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
                    if(value.status ===0){
                        $("#receiverName").append("<option value='"+value.supplierName+"'>"+value.supplierName+"</option>");
                    }
                })
            }
        });
    }

	function　initTable(){
        var id = <%=session.getAttribute("id")%>
        if(check(id)){
            id = -1
        }
        $('#f_id').val(-1);
        $('#date').val("");
        $('#fleetNumber').val("");
        $('#fleetLicense').val("");
        $('#goodsName').val("");
        $('#supplierName').val("");
        $('#supplierCertify').val("");
        $('#goodsCount').val("");
        $('#goodsPrice').val("");
        $('#goodsMoney').val("");
        $('#receiverName').val("");
        $('#receiverCertify').val("");
        $('#receiverCount').val("");
        $('#receiverPrice').val("");
        $('#receiverMoney').val("");
        $('#profit').val("");
        $('#company').val("");
        $('#memo').val("");
        if(id != -1){
            $.ajax({
                url:_basePath +"order/querySupplierList",
                data:{id:id},
                success:function(data){
                    var json = JSON.parse(data).data[0];
                    $('#f_id').val(json.id);
                    $('#date').val(json.date);
                    $('#fleetNumber').val(json.fleetNumber);
                    $('#fleetLicense').val(json.fleetLicense);
                    $('#goodsName').val(json.goodsName);
                    $('#supplierName').val(json.supplierName);
                    $('#supplierCertify').val(json.supplierCertify);
                    $('#goodsCount').val(json.goodsCount);
                    $('#goodsPrice').val(json.goodsPrice);
                    $('#goodsMoney').val(json.goodsMoney);
                    $('#receiverName').val(json.receiverName);
                    $('#receiverCertify').val(json.receiverCertify);
                    $('#company').val(json.company);
                    $('#receiverCount').val(json.receiverCount);
                    $('#receiverPrice').val(json.receiverPrice);
                    $('#receiverMoney').val(json.receiverMoney);
                    $('#conversion').val(json.conversion);
                    $('#tonnage').val(json.tonnage);
                    $('#profit').val(json.profit);
                    $('#memo').val(json.memo);
                    $('#receiverConversion').val(json.receiverConversion);
                },
                error:function () {
                    layer.msg('系统异常!',{icon:2,time:1000});
                }
            })
        }else{
            fleetNumberChange();
            receiverNameChange();
            goodsNameChange();
        }
    }
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>