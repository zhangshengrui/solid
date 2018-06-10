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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 基本信息管理 <span class="c-gray en">&gt;</span>供货商信息管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="page-container">
        <div class="text-c">
            <input type="text" id="s_name" placeholder="供货商名称" style="width:250px" class="input-text">&nbsp;&nbsp;
            <input type="text" id="s_tel"  placeholder="供货商电话" style="width:250px" class="input-text">&nbsp;&nbsp;
            <input type="text" id="s_add"  placeholder="供货商地址" style="width:250px" class="input-text">
			<button  class="btn btn-success" type="button" onclick="initTable()"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="product_add('添加产品','product-add.html')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加供货商</a></span> </div>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-sort">
                <thead>
                <tr class="text-c">
                    <th width="1%"><input type="checkbox"></th>
                    <th width="5%">ID</th>
                    <th width="10%">供货商简称</th>
                    <th width="10%">供货商负责人</th>
                    <th width="10%">供货商电话</th>
                    <th width="15%">供货商地址</th>
                    <th width="20%">备注信息</th>
                    <th width="10%">添加日期</th>
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
            "ajax":_basePath +"base/querySupplierList",
            "columns": [
                { "data": "",
                    "render":function(data, type, full, callback){
                        return '<input type="checkbox" name="checkbox" value='+full.id+'/>';
                    }
                },
                { "data": "id",defaultContent:''},
                { "data": "supplierName",defaultContent:''},
                { "data": "supplierOfficial",defaultContent:''},
                { "data": "telephone",defaultContent:''},
                { "data": "supplierAddress",defaultContent:''},
                { "data": "memo",defaultContent:''},
                { "data": "indate" ,defaultContent:''},
                { "data": "status" ,defaultContent:''},
                { "data": "","render":function(data,type,full,collback){
                    return '<td class="f-14 td-manage"><a style="text-decoration:none" onClick="article_shenhe(this,\'10001\')" href="javascript:;" title="审核">审核</a> <a style="text-decoration:none" class="ml-5" onClick="article_edit(\'资讯编辑\',\'article-add.html\',\'10001\')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_del(this,\'10001\')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>'
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
                        name: "supplierName",
                        value: $('#s_name').val()
                    },
                    {
                        name: "telephone",
                        value: $('#s_tel').val()
                    },
                    {
                        name: "supplierAddress",
                        value: $('#s_add').val()
                    }
                );
            }
        });
    }
</script>
</body>
</html>