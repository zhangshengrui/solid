<!DOCTYPE HTML>
<html>
<head>
	<%@ include file="../../static/common/common.jsp" %>
    <style>
        .table td{
            text-align: center;
        }
    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单管理 <span class="c-gray en">&gt;</span>订单详情 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:;" onclick="initTable()" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="page-container">
        <div class="text-c">
        订单日期范围：
            <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
            -
            <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">&nbsp;&nbsp;
            <input type="text" id="s_license" placeholder="车号" style="width:120px" class="input-text">&nbsp;&nbsp;
            <input type="text" id="s_supplier_name" placeholder="供货单位" style="width:120px" class="input-text">&nbsp;&nbsp;
            <input type="text" id="s_supplier_certify"  placeholder="供货单号" style="width:120px" class="input-text">&nbsp;&nbsp;
            <input type="text" id="s_receiver_name"  placeholder="收货单位" style="width:120px" class="input-text">&nbsp;&nbsp;
            <input type="text" id="s_receiver_certify"  placeholder="收货单号" style="width:120px" class="input-text">&nbsp;&nbsp;
			<button  class="btn btn-success" type="button" onclick="initTable()"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="deleteSupplier()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span> </div>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-sort">
                <thead>
                <tr>
                    <th style="text-align: center" colspan="12">采购明细</th>
                    <th style="text-align: center"  colspan="9">销售明细</th>
                </tr>
                <tr class="text-c">
                    <th width="1%"><input type="checkbox"></th>
                    <th width="5%">日期</th>
                    <th width="7%">供货单号</th>
                    <th width="5%">编码</th>
                    <th width="5%">车号</th>
                    <th width="5%">品名</th>
                    <th width="5%">供货单位</th>
                    <th width="5%">转换比例</th>
                    <th width="5%">吨位/方数</th>
                    <th width="5%">计费数量</th>
                    <th width="5%">货物单价</th>
                    <th width="7%">货物金额</th>
                    <th width="5%">收货单位</th>
                    <th width="7%">收货方单号</th>
                    <th width="5%">吨位/方数</th>
                    <th width="5%">计费数量</th>
                    <th width="5%">收货方单价</th>
                    <th width="5%">收货方金额</th>
                    <th width="5%">利润</th>
                    <th width="10%">备注信息</th>
                    <th width="10%">操作</th>
                </tr>
                </thead>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
    Date.prototype.format = function (format) {
        //eg:format="yyyy-MM-dd hh:mm:ss";

        if (!format) {
            format = "yyyy-MM-dd hh:mm:ss";
        }

        var o = {
            "M+": this.getMonth() + 1,  // month
            "d+": this.getDate(),       // day
            "H+": this.getHours(),      // hour
            "h+": this.getHours(),      // hour
            "m+": this.getMinutes(),    // minute
            "s+": this.getSeconds(),    // second
            "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
            "S": this.getMilliseconds()
        };

        if (/(y+)/.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear() + "")
                .substr(4 - RegExp.$1.length));
        }

        for (var k in o) {
            if (new RegExp("(" + k + ")").test(format)) {
                format = format.replace(RegExp.$1, RegExp.$1.length == 1
                    ? o[k]
                    : ("00" + o[k]).substr(("" + o[k]).length));
            }
        }

        return format;
    };

    $(function(){
        $('#s_name').val('');
        $('#s_tel').val('');
        $('#s_add').val();
        initTable();
	})

    function initTable(){
        $('.table-sort').dataTable({
            "ajax":_basePath +"order/querySupplierList",
            "columns": [
                { "data": "",
                    "render":function(data, type, full, callback){
                        return '<input type="checkbox"  value='+full.id+' name="data_checkbox"/>';
                    }
                },
                { "data": "date",defaultContent:'','render':function(data,type,full,collback){
                    return new Date(data).format("MM/dd");
                }},
                { "data": "supplierCertify",defaultContent:''},
                { "data": "fleetNumber",defaultContent:''},
                { "data": "fleetLicense",defaultContent:''},
                { "data": "goodsName",defaultContent:''},
                { "data": "supplierName",defaultContent:''},
                { "data": "conversion",defaultContent:''},
                { "data": "tonnage",defaultContent:''},
                { "data": "goodsCount",defaultContent:''},
                { "data": "goodsPrice",defaultContent:''},
                { "data": "goodsMoney",defaultContent:''},
                { "data": "receiverName",defaultContent:''},
                { "data": "receiverCertify",defaultContent:''},
                { "data": "company",defaultContent:''},
                { "data": "receiverCount",defaultContent:''},
                { "data": "receiverPrice",defaultContent:''},
                { "data": "receiverMoney",defaultContent:''},
                { "data": "profit",defaultContent:''},
                { "data": "memo",defaultContent:''},
                { "data": "status","render":function(data,type,full,collback){
                    return '<td class="f-14 td-manage">' +
                        '<a style="text-decoration:none" class="ml-5" onClick="order_add(\'修改订单信息\',\'order-add?id='+full.id+'\')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> ' +
                        '<a style="text-decoration:none" class="ml-5" onClick="base_supplier_delete('+full.id+')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>'

                } }
            ],
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "columnDefs": [
                {"orderable":false,"aTargets":[0,19,20]}// 制定列不参与排序
            ],
            bDestroy:true,
            "bProcessing": true,
            "fnServerParams": function (aoData) {
                aoData.push({
                        name: "startTime",
                        value: $('#logmin').val()
                    },
                    {
                        name: "endTime",
                        value: $('#logmax').val()
                    },
                    {
                        name: "fleetLicense",
                        value: $('#s_license').val()
                    },
                    {
                        name: "supplierName",
                        value: $('#s_supplier_name').val()
                    },
                    {
                        name: "supplierCertify",
                        value: $('#s_supplier_certify').val()
                    },
                    {
                        name: "receiverName",
                        value: $('#s_receiver_name').val()
                    },
                    {
                        name: "receiverCertify",
                        value: $('#s_receiver_certify').val()
                    }
                );
            }
        });
    }

    function layerResult(m,index){
        initTable();
        layer.msg(m+'操作成功!',{icon:1,time:1500});
        layer.close(index);
    }

    //删除订单信息
    function base_supplier_delete(id) {
        if(!id.toString().includes('[')){
            id =  "[\""+id+"\"]";
        }
        layer.prompt({
            formType: 1,
            title: '请输入密码:',
        }, function(value, index, elem){
            $.ajax({
                url:_basePath + "order/delete",
                data:{password:value,ids:id},
                success:function(data){
                    layer.close(index);
                    if(data == "success"){
                        initTable();
                        layer.msg('删除成功!',{icon:1,time:2000});
                    }else if(data == "wrong"){
                        layer.msg('密码错误!',{icon:2,time:2000});
                    }else{
                        layer.msg('删除失败!',{icon:2,time:2000});
                    }
                },
                error:function () {
                    layer.msg('系统异常!',{icon:2,time:2000});
                }
            })
        });
    }

    //批量删除
    function deleteSupplier(){
        var rows = document.getElementsByName('data_checkbox')
        var arr = new Array();
        for(var i in rows){
            if(rows[i].checked == true){
                arr.push(rows[i].value);
            }
        }
        if(arr.length == 0){
            layer.msg('请选择需要批量删除的数据!',{icon:2,time:2000});
            return;
        }
        base_supplier_delete(JSON.stringify(arr))
    }

    /*图片-添加*/
    function order_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
</script>
</body>
</html>