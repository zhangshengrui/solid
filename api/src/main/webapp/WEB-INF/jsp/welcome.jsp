<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<%@ include file="/static/common/common.jsp" %>
    <style>
        .table td{
            text-align: center;
        }
    </style>
    <%--<meta http-equiv="refresh" content="5">--%>
</head>
<body>
<div class="page-container">
	<p class="f-20 text-success">欢迎使用GOVERNOR <span class="f-14">v1.1</span></p>
	<div class="page-container">
        <p class="f-15 text-success">本月订单数: <span class="f-18"><%=session.getAttribute("monthCount")%></span></p>
        <p class="f-15 text-success">今日订单数: <span class="f-18"><%=session.getAttribute("todayCount")%></span></p>
        <table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
			<tr>
				<th scope="col" colspan="5" style="text-align: center">今日订单概览</th>
			</tr>
			<tr class="text-c">
				<th width="40">日期</th>
				<th width="120">车队编码</th>
				<th width="150">货物名称</th>
				<th width="70">订单总数</th>
			</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
    $(function(){
        initTable();
    })


    function initTable(){
        $('.table-sort').dataTable({
                "ajax":_basePath +"order/today",
            "columns": [
                { "data": "date",defaultContent:''},
                { "data": "fleetNumber",defaultContent:''},
                { "data": "goodsName",defaultContent:''},
                { "data": "todayCount",defaultContent:''},
            ],
            "order": [[ 0, "asc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "columnDefs": [
                {"orderable":false,"targets":[0,1,2,3]},// 制定列不参与排序
            ],
            searching:false,
            bDestroy:true,
            "processing": true,
            "initComplete":function(setting,json){
            }

        });
    }
</script>

</body>
</html>