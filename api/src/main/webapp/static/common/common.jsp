<%--
  Created by IntelliJ IDEA.
  User: kevin
  Date: 2018/6/10
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../../lib/html5shiv.js"></script>
    <script type="text/javascript" src="../../lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="../h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="../../lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="../h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="../h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="../../lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->

    <!--_footer 作为公共模版分离出去-->
    <script type="text/javascript" src="../../lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../lib/layer/2.4/layer.js"></script>
    <script type="text/javascript" src="../h-ui/js/H-ui.min.js"></script>
    <script type="text/javascript" src="../h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

    <!--请在下方写此页面业务相关的脚本-->
    <script type="text/javascript" src="../../lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
    <script type="text/javascript" src="../../lib/My97DatePicker/4.8/WdatePicker.js"></script>
    <script type="text/javascript" src="../../lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../lib/laypage/1.2/laypage.js"></script>

    <link rel="stylesheet" href="../../lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">

    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <script type="text/javascript">
        var _basePath = "<%=basePath%>";
    </script>
</head>
<body>

</body>
</html>
