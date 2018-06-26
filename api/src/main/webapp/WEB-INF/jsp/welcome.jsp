<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*" pageEncoding="UTF-8"%>
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
<div class="page-container">
	<p class="f-20 text-success">欢迎使用GOVERNOR <span class="f-14">v1.1</span></p>
	<div class="page-container">
        <p class="f-15 text-success">本月订单数: <span class="f-18" id="monthCount"><%=session.getAttribute("monthCount")%></span></p>
        <p class="f-15 text-success">今日订单数: <span class="f-18" id="todayCount"><%=session.getAttribute("todayCount")%></span></p>
        <table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
			<tr class="text-c">
				<th width="40" >日期</th>
				<th width="120" >车队编码</th>
				<th width="150" >货物名称</th>
				<th width="70" >订单总数</th>
			</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
    $(function(){
        window.setInterval(initTable,5000);
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
                if(json.data.length !=0){
                    mergeTable("日期")
                    mergeTable("车队编码")
                }
                document.getElementById("todayCount").innerHTML = '<%=session.getAttribute("todayCount")%>';
                document.getElementById("monthCount").innerHTML = '<%=session.getAttribute("monthCount")%>';

                var inToday = document.getElementById("todayCount").innerHTML;
                var inMonth = document.getElementById("monthCount").innerHTML;
                if(inToday == 'null'|| inToday=='' || inToday==null || inToday== undefined){
                    document.getElementById("todayCount").innerHTML = '0'
                }
                if(inMonth == 'null'|| inMonth=='' || inMonth==null || inMonth== undefined){
                    document.getElementById("monthCount").innerHTML = '0'
                }
            }

        });
    }

    function mergeTable(field){
        $table=$(".table-sort");
        var obj=getObjFromTable($table,field);
        var ths = $table.find("th");
        var thIndex = 0;
        for(var i in ths){  //当前是第几列
            if(ths.eq(i).html()==field){
                thIndex = i;
                break;
            }
        }
        var trs = $table.find("tbody > tr"); //获取所有行
        for(item in obj){
            var flag = false;
            var count = 1;
            for(var i=0;i<trs.length ;i++){
                var f = trs.eq(i).find("td").eq(thIndex);  //获取当前列的每一行
                if(flag){
                    if(count != obj[item].row){
                        f.hide();
                        count++;
                    }else{
                        flag = false;
                    }
                }
                if(obj[item].index == i){
                    f.attr('rowspan',obj[item].row);
                    flag = true;
                }

            }
        }
    }

    function getObjFromTable($table,field){
        var obj=[];
        var maxV=$table.find("th").length;

        var columnIndex=0;
        var filedVar;
        for(columnIndex=0;columnIndex<maxV;columnIndex++){
//            filedVar=$table.find("th").eq(columnIndex).attr("data-field");
            filedVar=$table.find("th").eq(columnIndex).html();
            if(filedVar==field) break;

        }
        var $trs=$table.find("tbody > tr");
        var $tr;
        var index=0;
        var content="";
        var row=1;
        for (var i = 0; i <$trs.length;i++)
        {
            $tr=$trs.eq(i);
            var contentItem=$tr.find("td").eq(columnIndex).html();
            //exist
            if(contentItem.length>0 && content==contentItem ){
                row++;
            }else{
                //save
                if(row>1){
                    obj.push({"index":index,"row":row});
                }
                index=i;
                content=contentItem;
                row=1;
            }
        }
        if(row>1)obj.push({"index":index,"row":row});
        return obj;
    }
</script>

</body>
</html>