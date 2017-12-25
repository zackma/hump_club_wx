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
    <h1 class="demos-title">Select</h1>
</header>


<div class="weui_cells weui_cells_form">
    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="name" class="weui_label">职业</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="job" type="text" value="">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="name" class="weui_label">手机</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="mobile" type="text" value="">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="name" class="weui_label">爱好</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="in" type="text" value="">
        </div>
    </div>
</div>


<script>
    $("#job").select({
        title: "选择职业",
        items: ["法官", "医生", "猎人", "学生", "记者", "其他"],
        onChange: function(d) {
            console.log(this, d);
        }
    });
    $("#mobile").select({
        title: "选择手机",
        items: [
            {
                title: "iPhone 3GS",
                value: "001",
            },
            {
                title: "iPhone 5",
                value: "002",
            },
            {
                title: "iPhone 5S",
                value: "003",
            },
            {
                title: "iPhone 6",
                value: "004",
            },
            {
                title: "iPhone 6S",
                value: "005",
            },
            {
                title: "iPhone 6P",
                value: "006",
            },
            {
                title: "iPhone 6SP",
                value: "007",
            },
            {
                title: "iPhone SE",
                value: "008",
            },
            {
                title: "iPhone 7",
                value: "009"
            }
        ]
    });
    $("#in").select({
        title: "您的爱好",
        multi: true,
        items: [
            {
                title: "画画",
                value: 1
            },
            {
                title: "打球",
                value: 2
            },
            {
                title: "唱歌",
                value: 3
            },
            {
                title: "游泳",
                value: 4
            },
        ],
        onChange: function(d) {
            console.log(this, d);
        }
    });
</script>
</body>
</html>