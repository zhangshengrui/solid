<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="common.jsp" %>
    <title>GOVERNOR v1.1</title>
</head>
<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="#">GOVERNOR</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="#">GOVERNOR</a>
            <span class="logo navbar-slogan f-l mr-10 hidden-xs">v1.1</span>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li><%=session.getAttribute("role")%></li>
                    <li class="dropDown dropDown_hover">
                        <a href="#" class="dropDown_A"><%=session.getAttribute("name")%><i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="#" onclick="layer_show('更改密码','admin/change','400','220')">更改密码</a></li>
                            <li><a href="#" onclick="logout()">退出</a></li>
                        </ul>
                    </li>
                    <li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">
        <dl id="menu-product">
            <dt><i class="Hui-iconfont">&#xe620;</i>基本信息管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="base/base-supplier" data-title="供货商基本信息管理" href="javascript:void(0)">供货商基本信息管理</a></li>
                    <li><a data-href="base/base-goods" data-title="货物基本信息管理" href="javascript:void(0)">货物基本信息管理</a></li>
                    <li><a data-href="base/base-fleet" data-title="车队基本管理" href="javascript:void(0)">车队基本管理</a></li>
                    <li><a data-href="base/base-receiver" data-title="收货方基本信息管理" href="javascript:void(0)">收货方基本信息管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-tongji">
            <dt><i class="Hui-iconfont">&#xe61a;</i>订单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="order/index" data-title="订单详情" href="javascript:void(0)">订单详情</a></li>
                    <li><a data-href="order/order-add?id=-1" data-title="添加订单" href="javascript:void(0)">添加订单</a></li>
                    <li><a data-href="calculation/index" data-title="汇总订单详情" href="javascript:void(0)">汇总订单详情</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i>系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="admin/user" data-title="用户信息管理" href="javascript:void(0)">用户信息管理</a></li>
                    <li><a data-href="password/index" data-title="密码管理" href="javascript:void(0)">密码管理</a></li>
                    <li><a data-href="journal/index" data-title="日志查询" href="javascript:void(0)">日志查询</a></li>
                </ul>
            </dd>
        </dl>
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active">
                    <span title="我的桌面" data-href="welcome">我的桌面</span>
                    <em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="welcome"></iframe>
        </div>
    </div>
</section>

<div class="contextMenu" id="Huiadminmenu">
    <ul>
        <li id="closethis">关闭当前 </li>
        <li id="closeall">关闭全部 </li>
    </ul>
</div>

<script type="text/javascript">
    function logout(){
        layer.confirm('确定退出本系统??', {icon: 3, title:'提示'}, function(index){
            window.location.href=_basePath+'/logout'
            layer.close(index);
        });
    }
</script>


</body>
</html>