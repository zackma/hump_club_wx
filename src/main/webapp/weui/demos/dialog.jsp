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
    <h1 class="demos-title">对话框</h1>
</header>

<div class='demos-content-padded'>
    <a href="javascript:;" id='show-alert' class="weui_btn weui_btn_primary">显示 Alert</a>
    <a href="javascript:;" id='show-confirm' class="weui_btn weui_btn_primary">显示 Confirm</a>
    <a href="javascript:;" id='show-prompt' class="weui_btn weui_btn_primary">显示 Prompt</a>
    <a href="javascript:;" id='show-custom' class="weui_btn weui_btn_primary">显示自定义对话框</a>
</div>

<script>
    $(document).on("click", "#show-alert", function() {
        $.alert("AlphaGo 就是天网的前身，人类要完蛋了！", "警告！");
    });
    $(document).on("click", "#show-confirm", function() {
        $.confirm("您确定要删除文件<<苍井空全集>>吗?", "确认删除?", function() {
            $.toast("文件已经删除!");
        }, function() {
            //取消操作
        });
    });
    $(document).on("click", "#show-prompt", function() {
        $.prompt("名字不能超过6个字符，不得出现不和谐文字", "输入姓名", function(text) {
            $.alert("您的名字是:"+text, "角色设定成功");
        }, function() {
            //取消操作
        });
    });
    $(document).on("click", "#show-custom", function() {
        $.modal({
            title: "Hello",
            text: "我是自定义的modal",
            buttons: [
                { text: "支付宝", onClick: function(){ $.alert("你选择了支付宝"); } },
                { text: "微信支付", onClick: function(){ $.alert("你选择了微信支付"); } },
                { text: "取消", className: "default"},
            ]
        });
    });
</script>
</body>
</html>
