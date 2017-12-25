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
    <h1 class="demos-title">Toast</h1>
</header>

<div class='demos-content-padded'>
    <a href="javascript:;" id='show-toast' class="weui_btn weui_btn_primary">显示 Toast 成功</a>
    <a href="javascript:;" id='show-toast-cancel' class="weui_btn weui_btn_primary">显示 Toast 取消</a>
    <a href="javascript:;" id='show-toast-forbidden' class="weui_btn weui_btn_primary">显示 Toast 禁止</a>
    <a href="javascript:;" id='show-loading' class="weui_btn weui_btn_primary">显示 Loading</a>
</div>

<script>
    $(document).on("click", "#show-toast", function() {
        $.toast("操作成功");
    });
    $(document).on("click", "#show-toast-cancel", function() {
        $.toast("取消操作", "cancel");
    });
    $(document).on("click", "#show-toast-forbidden", function() {
        $.toast("禁止操作", "forbidden");
    });
    $(document).on("click", "#show-loading", function() {
        $.showLoading();

        setTimeout(function() {
            $.hideLoading();
        }, 3000)
    });
</script>
</body>
</html>
