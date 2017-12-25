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


<header class='demos-header'>
    <h1 class="demos-title">按钮</h1>
</header>

<div class='demos-content-padded'>
    <a href="javascript:;" class="weui_btn weui_btn_primary">按钮</a>
    <a href="javascript:;" class="weui_btn weui_btn_disabled weui_btn_primary">按钮</a>
    <a href="javascript:;" class="weui_btn weui_btn_warn">确认</a>
    <a href="javascript:;" class="weui_btn weui_btn_disabled weui_btn_warn">确认</a>
    <a href="javascript:;" class="weui_btn weui_btn_default">按钮</a>
    <a href="javascript:;" class="weui_btn weui_btn_disabled weui_btn_default">按钮</a>
    <a href="javascript:;" class="weui_btn weui_btn_plain_default">按钮</a>
    <a href="javascript:;" class="weui_btn weui_btn_plain_primary">按钮</a>

    <div class="button_sp_area">
        <a href="javascript:;" class="weui_btn weui_btn_mini weui_btn_primary">按钮</a>
        <a href="javascript:;" class="weui_btn weui_btn_mini weui_btn_default">按钮</a>
    </div>
</div>

</body>
</html>
