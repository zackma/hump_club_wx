<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
    <title>jQuery WeUI</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
    <link rel="stylesheet" href="${path}/weui/lib/weui.min.css">
    <link rel="stylesheet" href="${path}/weui/css/jquery-weui.css">
    <link rel="stylesheet" href="${path}/weui/demos/css/demos.css">
    <script src="${path}/weui/lib/jquery-2.1.4.js"></script>
    <script src="${path}/weui/js/jquery-weui.js"></script>

</head>

<body ontouchstart>

<div class="weui_tab">
    <div class="weui_navbar">
        <div class="weui_navbar_item weui_bar_item_on">
            选项一
        </div>
        <div class="weui_navbar_item">
            选项二
        </div>
        <div class="weui_navbar_item">
            选项三
        </div>
    </div>
    <div class="weui_tab_bd">

    </div>

    <div class="weui_tabbar">
        <a href="javascript:;" class="weui_tabbar_item weui_bar_item_on">
            <div class="weui_tabbar_icon">
                <img src="./images/icon_nav_button.png" alt="">
            </div>
            <p class="weui_tabbar_label">微信</p>
        </a>
        <a href="javascript:;" class="weui_tabbar_item">
            <div class="weui_tabbar_icon">
                <img src="./images/icon_nav_msg.png" alt="">
            </div>
            <p class="weui_tabbar_label">通讯录</p>
        </a>
        <a href="javascript:;" class="weui_tabbar_item">
            <div class="weui_tabbar_icon">
                <img src="./images/icon_nav_article.png" alt="">
            </div>
            <p class="weui_tabbar_label">发现</p>
        </a>
        <a href="javascript:;" class="weui_tabbar_item">
            <div class="weui_tabbar_icon">
                <img src="./images/icon_nav_cell.png" alt="">
            </div>
            <p class="weui_tabbar_label">我</p>
        </a>
    </div>
</div>

</body>
</html>
