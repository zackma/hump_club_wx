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
    <script src="${path}/weui/js/swiper.js"></script>
    <style>
        .swiper-container {
            width: 100%;
        }

        .swiper-container img {
            display: block;
            width: 100%;
        }
    </style>
</head>

<body ontouchstart>

<div class="swiper-container">
    <!-- Additional required wrapper -->
    <div class="swiper-wrapper">
        <!-- Slides -->
        <div class="swiper-slide"><img src="./images/swiper-1.jpg" /></div>
        <div class="swiper-slide"><img src="./images/swiper-2.jpg" /></div>
        <div class="swiper-slide"><img src="./images/swiper-3.jpg" /></div>
    </div>
    <!-- If we need pagination -->
    <div class="swiper-pagination"></div>
</div>

<script>
    $(".swiper-container").swiper({
        loop: true,
        autoplay: 3000
    });
</script>
</body>
</html>