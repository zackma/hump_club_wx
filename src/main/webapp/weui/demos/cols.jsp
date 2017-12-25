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
    <h1 class="demos-title">12栏栅格</h1>
</header>

<style>
    .weui-row {
        margin-top: 10px;
    }
    [class*="weui-col-"] {
        border: 1px solid #ccc;
        height: 40px;
        line-height: 40px;
        text-align: center;
    }

</style>

<h2 class='doc-head'>有间距</h2>

<div class="weui-row">
    <div class="weui-col-20">20</div>
    <div class="weui-col-20">20</div>
    <div class="weui-col-20">20</div>
    <div class="weui-col-20">20</div>
    <div class="weui-col-20">20</div>
</div>

<div class="weui-row">
    <div class="weui-col-33">33</div>
    <div class="weui-col-33">33</div>
    <div class="weui-col-33">33</div>
</div>

<div class="weui-row">
    <div class="weui-col-50">50</div>
    <div class="weui-col-50">50</div>
</div>


<h2 class='doc-head'>无间距</h2>

<div class="weui-row weui-no-gutter">
    <div class="weui-col-20">20</div>
    <div class="weui-col-20">20</div>
    <div class="weui-col-20">20</div>
    <div class="weui-col-20">20</div>
    <div class="weui-col-20">20</div>
</div>

<div class="weui-row weui-no-gutter">
    <div class="weui-col-33">33</div>
    <div class="weui-col-33">33</div>
    <div class="weui-col-33">33</div>
</div>

<div class="weui-row weui-no-gutter">
    <div class="weui-col-50">50</div>
    <div class="weui-col-50">50</div>
</div>

</body>
</html>