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
    <h1 class="demos-title">Picker</h1>
</header>


<div class="weui_cells weui_cells_form">
    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="name" class="weui_label">称呼</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="name" type="text" value="">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="date" class="weui_label">手机</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="mobile" type="text" value="">
        </div>
    </div>
</div>

<script>
    $("#mobile").picker({
        title: "请选择您的手机",
        cols: [
            {
                textAlign: 'center',
                values: ['iPhone 4', 'iPhone 4S', 'iPhone 5', 'iPhone 5S', 'iPhone 6', 'iPhone 6 Plus', 'iPad 2', 'iPad Retina', 'iPad Air', 'iPad mini', 'iPad mini 2', 'iPad mini 3']
            }
        ]
    });
    $("#name").picker({
        title: "怎么称呼您？",
        cols: [
            {
                textAlign: 'center',
                values: ['Mr', 'Ms']
            },
            {
                textAlign: 'center',
                values: ['Amy', 'Bob', 'Cat', 'Dog', 'Ella', 'Fox', 'Google']
            }
        ]
    });
</script>
</body>
</html>