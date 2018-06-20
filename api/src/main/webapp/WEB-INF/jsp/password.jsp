<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*" pageEncoding="UTF-8"%>
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 密码管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="#" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <table class="table table-border table-bordered table-hover table-bg table-sort">
        <thead>
        <tr>
            <th scope="col" colspan="5" style="text-align: center">密码管理</th>
        </tr>
        <tr class="text-c">
            <th width="40">ID</th>
            <th width="120">节点名称</th>
            <th width="150">密码描述</th>
            <th width="70">操作</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    $(function(){
        initTable();
    })

    function initTable(){
        $('.table-sort').dataTable({
            "ajax":_basePath +"password/querySupplierList",
            "columns": [
                { "data": "id",defaultContent:''},
                { "data": "node",defaultContent:''},
                { "data": "memo",defaultContent:''},
                { "data": "status","render":function(data,type,full,collback){
                    if(data == '1'){
                        return '<td class="f-14 td-manage">' +
                            '<a style="text-decoration:none" class="ml-5" onClick="replace('+full.id+')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a></td>'+
                            '<a style="text-decoration:none" class="ml-5" onClick="reset('+full.id+')" href="javascript:;" title="重置密码"><i class="Hui-iconfont">&#xe63f;</i></a></td>'
                    }else{
                        return '<td class="f-14 td-manage">' +
                            '<a style="text-decoration:none" class="ml-5" onClick="replace('+full.id+')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a></td>'+
                            '<a style="text-decoration:none" class="ml-5" onClick="reset('+full.id+')" href="javascript:;" title="重置密码"><i class="Hui-iconfont">&#xe63f;</i></a></td>'
                    }

                } }
            ],
            "order": [[ 0, "asc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "columnDefs": [
                {"orderable":false,"aTargets":[0,1,2,3]}// 制定列不参与排序
            ],
            searching:false,
            paging:false,
            bDestroy:true,
            "processing": true,

        });
    }

    function reset(id) {
        layer.confirm('确认要重置密码吗？',function(index){
            $.ajax({
                url:_basePath + "password/reset",
                data:{id:id},
                success:function(data){
                    if(data == "success"){
                        layer.msg('重置成功!',{icon:1,time:2000});
                    }else {
                        layer.msg('重置失败!',{icon:2,time:2000});
                    }
                },
                error:function () {
                    layer.msg('系统异常!',{icon:2,time:2000});
                }
            })
        });
    }

    //删除用户信息
    function replace(id) {
        layer.prompt({
            title: '请输入新密码:',
        }, function(value, index, elem){
            $.ajax({
                url:_basePath + "password/update",
                data:{password:value,id:id},
                success:function(data){
                    layer.close(index);
                    if(data == "success"){
                        layer.msg('修改成功!',{icon:1,time:2000});
                    } else{
                        layer.msg('修改失败!',{icon:2,time:2000});
                    }
                },
                error:function () {
                    layer.msg('系统异常!',{icon:2,time:2000});
                }
            })
        });
    }


</script>
</body>
</html>