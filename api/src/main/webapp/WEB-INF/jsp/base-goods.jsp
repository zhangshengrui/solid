﻿<!DOCTYPE HTML>
<html>
<head>
	<%@ include file="common.jsp" %>
	<style>
		.table td{
			text-align: center;
		}
	</style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 基本信息管理 <span class="c-gray en">&gt;</span>货物信息管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:;" onclick="initTable()" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="page-container">
		<div class="text-c">
			<input type="text" id="s_name" placeholder="货物编号" style="width:250px" class="input-text">&nbsp;&nbsp;
			<input type="text" id="s_tel"  placeholder="货物名称" style="width:250px" class="input-text">&nbsp;&nbsp;
			<input type="text" id="s_add"  placeholder="供货商名称" style="width:250px" class="input-text">
			<button  class="btn btn-success" type="button" onclick="initTable()"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="deleteSupplier()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="layer_show('添加货物','base-goods-add?id=-1','','520')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加货物</a></span> </div>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-sort table-hover ">
				<thead>
				<tr class="text-c">
					<th width="1%"><input type="checkbox"></th>
					<th width="5%">ID</th>
					<th width="10%">货物编号</th>
					<th width="10%">货物名称</th>
					<th width="10%">货物价格</th>
					<th width="15%">供货商名称</th>
					<th width="10%">换算单位</th>
					<th width="20%">备注信息</th>
					<th width="10%">当前状态</th>
					<th width="10%">操作</th>
				</tr>
				</thead>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
    $(function(){
        $('#s_name').val('');
        $('#s_tel').val('');
        $('#s_add').val();
        initTable();
    })

    function initTable(){
        $('.table-sort').dataTable({
            "ajax":_basePath +"base/goods/querySupplierList",
            "columns": [
                { "data": "",
                    "render":function(data, type, full, callback){
                        return '<input type="checkbox"  value='+full.id+' name="data_checkbox"/>';
                    }
                },
                { "data": "num",defaultContent:''},
                { "data": "number",defaultContent:''},
                { "data": "name",defaultContent:''},
                { "data": "price",defaultContent:''},
                { "data": "address",defaultContent:''},
                { "data": "conversion",defaultContent:''},
                { "data": "memo",defaultContent:''},
                { "data": "status" ,defaultContent:'',"render":function (data,type,full,collback) {
                    if(data == '1'){
                        return '<span class="label label-danger radius">已关闭</span>';
                    }else{
                        return '<span class="label label-success radius">已开启</span>';
                    }
                }},
                { "data": "status","render":function(data,type,full,collback){
                    if(data == '1'){
                        return '<td class="f-14 td-manage">' +
                            '<a style="text-decoration:none" onClick="operate('+full.id+',0)" href="#" >开启</a> ' +
                            '<a style="text-decoration:none" class="ml-5" onClick="layer_show(\'修改货物信息\',\'base-goods-add?id='+full.id+'\',\'\',\'520\')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> ' +
                            '<a style="text-decoration:none" class="ml-5" onClick="base_supplier_delete('+full.id+')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>'
                    }else{
                        return '<td class="f-14 td-manage">' +
                            '<a style="text-decoration:none" onClick="operate('+full.id+',1)" href="#">关闭</a> ' +
                            '<a style="text-decoration:none" class="ml-5" onClick="layer_show(\'修改货物信息\',\'base-goods-add?id='+full.id+'\',\'\',\'520\')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> ' +
                            '<a style="text-decoration:none" class="ml-5" onClick="base_supplier_delete('+full.id+')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>'
                    }

                } }
            ],
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "columnDefs": [
                {"orderable":false,"aTargets":[0,6,9]}// 制定列不参与排序
            ],
            bDestroy:true,
            "bProcessing": true,
            "fnServerParams": function (aoData) {
                aoData.push({
                        name: "number",
                        value: $('#s_name').val()
                    },
                    {
                        name: "name",
                        value: $('#s_tel').val()
                    },
                    {
                        name: "address",
                        value: $('#s_add').val()
                    }
                );
            },
            fnDrawCallback : function () {
                this.api().column(1).nodes().each(function(cell, i) {
                    cell.innerHTML = i + 1;
                });
            }
        });
    }

    function operate(id,type){
        $.ajax({
            url:_basePath + "base/goods/operate",
            data:{id:id,status:type},
            success:function(data){
                var message = "开启";
                if(type == 1){
                    message = "关闭";
                }
                if(data == "success"){
                    initTable();
                    layer.msg(message+'成功!',{icon:1,time:2000});
                }else{
                    layer.msg(message+'失败!',{icon:2,time:2000});
                }
            },
            error:function () {
                layer.msg('系统异常!',{icon:2,time:2000});
            }
        })
    }

    function layerResult(m,index){
        initTable();
        layer.msg(m+'操作成功!',{icon:1,time:1520});
        layer.close(index);
    }

    //删除货物信息
    function base_supplier_delete(id) {
        layer.prompt({
            formType: 1,
            title: '请输入密码:',
        }, function(value, index, elem){
            $.ajax({
                url:_basePath + "base/goods/delete",
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
</script>
</body>
</html>