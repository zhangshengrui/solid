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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 日志查询 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="#" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c">
        操作日期范围：
        <input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:170px;">
        -
        <input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'datemin\')}' })" id="datemax" class="input-text Wdate" style="width:170px;">
        <input type="text" id="s_person" placeholder="操作人" style="width:120px" class="input-text">&nbsp;&nbsp;
        <input type="text" id="s_type" placeholder="操作类型" style="width:120px" class="input-text">&nbsp;&nbsp;
        <button  class="btn btn-success" type="button" onclick="initTable()"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
    </div>
    <br><br>
    <table class="table table-border table-bordered table-hover table-bg table-sort">
        <thead>
        <tr>
            <th scope="col" colspan="5" style="text-align: center">日志查询</th>
        </tr>
        <tr class="text-c">
            <th width="40">ID</th>
            <th width="120">操作人</th>
            <th width="150">操作时间</th>
            <th width="150">操作类型</th>
            <th width="250">操作内容</th>
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
            "ajax":_basePath +"journal/querySupplierList",
            "columns": [
                { "data": "id",defaultContent:''},
                { "data": "person",defaultContent:''},
                { "data": "time",defaultContent:'',
                    "render":function(data, type, full, callback){
                    if(data != null && data != undefined && data != ''){
                        return data.substring(0,data.length-2);
                    }
                }},
                { "data": "type",defaultContent:''},
                { "data": "content",defaultContent:''}
            ],
            "aaSorting": [[ 0, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "columnDefs": [
                {"orderable":false,"aTargets":[4]}// 制定列不参与排序
            ],
            bDestroy:true,
            "bProcessing": true,
            "fnServerParams": function (aoData) {
                aoData.push({
                        name: "startTime",
                        value: $('#datemin').val()
                    },
                    {
                        name: "endTime",
                        value: $('#datemax').val()
                    },
                    {
                        name: "person",
                        value: $('#s_person').val()
                    },
                    {
                        name: "type",
                        value: $('#s_type').val()
                    }
                );
            }
        });
    }

</script>
</body>
</html>