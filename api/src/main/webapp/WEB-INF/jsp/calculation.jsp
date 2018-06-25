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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单管理 <span class="c-gray en">&gt;</span>汇总订单详情 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:;" onclick="initTable()" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="page-container">
        <div class="text-c">
        订单日期范围：
            <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
            -
            <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}' })" id="logmax" class="input-text Wdate" style="width:120px;">&nbsp;&nbsp;
			<button  class="btn btn-success" type="button" onclick="initTable()"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a class="btn btn-primary radius" onclick="report()" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 下载表格</a> </span>  </div>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-sort table-hover ">
                <thead>
                <tr class="text-c">
                    <th width="5%">日期</th>
                    <th width="7%">收货单位</th>
                    <th width="6%">编码</th>
                    <th width="6%">货物名称</th>
                    <th width="5%">车数</th>
                    <th width="5%">发货总重</th>
                    <th width="5%">发货计费</th>
                    <th width="5%">发货价格</th>
                    <th width="5%">收货总重</th>
                    <th width="5%">收货计费</th>
                    <th width="5%">收货价格</th>
                    <th width="5%">汇总利润</th>
                    <th width="7%">全部发货价格</th>
                    <th width="5%">全部收货价格</th>
                    <th width="5%">全部利润</th>
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
        initTable();
	})

    function initTable(){
        $('.table-sort').dataTable({
            "ajax":_basePath +"calculation/queryCalculationList",
            "columns": [
                { "data": "date",defaultContent:'','render':function(data,type,full,collback){
                    return new Date(data).format("MM/dd");
                }},
                { "data": "receiverName",defaultContent:''},
                { "data": "fleetNumber",defaultContent:''},
                { "data": "goodsName",defaultContent:''},
                { "data": "count",defaultContent:''},
                { "data": "goodsTonnage",defaultContent:''},
                { "data": "goodsTotal",defaultContent:''},
                { "data": "goodsBid",defaultContent:''},
                { "data": "receiverTonnage",defaultContent:''},
                { "data": "receiverTotal",defaultContent:''},
                { "data": "receiverBid",defaultContent:''},
                { "data": "account",defaultContent:''},
                { "data": "monthFrom",defaultContent:''},
                { "data": "monthTo",defaultContent:''},
                { "data": "monthProfit",defaultContent:'0'},
            ],
            "order": [[ 1, "asc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
//            "columnDefs": [
//                {"orderable":false,"aTargets":[0,19,20]}// 制定列不参与排序
//            ],
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
                    }
                );
            },
            "initComplete":function(setting,json){
                if(json.data.length !=0){
                    mergeTable("日期")
                    mergeTable("全部发货价格")
                    mergeTable("全部收货价格")
                    mergeTable("全部利润")
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

    function report(){
        window.location.href=_basePath+"order/report?startTime="
            +$('#logmin').val()+"&endTime="+$('#logmax').val()
            +"&fleetLicense="+$('#s_license').val()
            +"&supplierName="+$('#s_supplier_name').val()
            +"&supplierCertify="+$('#s_supplier_certify').val()
            +"&receiverName="+$('#s_receiver_name').val()
            +"&receiverCertify="+$('#s_receiver_certify').val()
    }
</script>
</body>
</html>