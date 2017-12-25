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
    <script src="${path}/weui/js/city-picker.js"></script>

</head>

<body ontouchstart>


<header class='demos-header'>
    <h1 class="demos-title">City Picker</h1>
</header>


<div class="weui_cells weui_cells_form">
    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="name" class="weui_label">发出地</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="start" type="text" value="">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="date" class="weui_label">目的地</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="end" type="text" value="">
        </div>
    </div>
</div>

<h2 class="demos-second-title">只选择城市</h2>
<div class="weui_cells weui_cells_form">
    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="home-city" class="weui_label">城市</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="home-city" type="text" value="">
        </div>
    </div>
</div>

<script>
    $("#start").cityPicker({
        title: "选择出发地"
    });
    $("#end").cityPicker({
        title: "选择目的地"
    });
    $("#home-city").cityPicker({
        title: "选择目的地",
        showDistrict: false
    });
</script>
</body>
</html>
