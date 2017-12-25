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
    <h1 class="demos-title">Notification</h1>
</header>

<div class='demos-content-padded'>
    <a href="javascript:;" id='show-notification' class="weui_btn weui_btn_primary">显示通知</a>
</div>

<script>
    $(document).on("click", "#show-notification", function() {
        $.noti({
            title: "中奖啦！",
            text: "点击领取腾讯撸啊撸杯二等奖！",
            media: "<img src='./images/present.png' />",
            data: {
                message: "逗你玩的!"
            },
            time: 3000,
            onClick: function(data) {
                $.alert(data.message);
            }
        });
    });
</script>
</body>
</html>
