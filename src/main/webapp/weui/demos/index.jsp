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
    <h1 class="demos-title">jQuery WeUI</h1>
    <p class='demos-sub-title'>轻量强大的UI库，不仅仅是 WeUI</p>
</header>

<div class="weui_grids">
    <a href="${path}/weui/demos/buttons.jsp" class="weui_grid js_grid" data-id="button">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_button.png" alt="">
        </div>
        <p class="weui_grid_label">
            Button
        </p>
    </a>
    <a href="${path}/weui/demos/cell.jsp" class="weui_grid js_grid" data-id="cell">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_cell.png" alt="">
        </div>
        <p class="weui_grid_label">
            Cell
        </p>
    </a>
    <a href="${path}/weui/demos/form.jsp" class="weui_grid js_grid" data-id="cell">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_cell.png" alt="">
        </div>
        <p class="weui_grid_label">
            Form
        </p>
    </a>
    <a href="${path}/weui/demos/toast.jsp" class="weui_grid js_grid" data-id="toast">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_toast.png" alt="">
        </div>
        <p class="weui_grid_label">
            Toast
        </p>
    </a>
    <a href="${path}/weui/demos/dialog.jsp" class="weui_grid js_grid" data-id="dialog">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_dialog.png" alt="">
        </div>
        <p class="weui_grid_label">
            Dialog
        </p>
    </a>
    <a href="${path}/weui/demos/progress.jsp" class="weui_grid js_grid" data-id="progress">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_progress.png" alt="">
        </div>
        <p class="weui_grid_label">
            Progress
        </p>
    </a>
    <a href="${path}/weui/demos/msg.jsp" class="weui_grid js_grid" data-id="msg">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_msg.png" alt="">
        </div>
        <p class="weui_grid_label">
            Msg
        </p>
    </a>
    <a href="${path}/weui/demos/article.jsp" class="weui_grid js_grid" data-id="article">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_article.png" alt="">
        </div>
        <p class="weui_grid_label">
            Article
        </p>
    </a>
    <a href="${path}/weui/demos/action-sheet.jsp" class="weui_grid js_grid" data-id="actionsheet">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_actionSheet.png" alt="">
        </div>
        <p class="weui_grid_label">
            ActionSheet
        </p>
    </a>
    <a href="${path}/weui/demos/icons.jsp" class="weui_grid js_grid" data-id="icons">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_icons.png" alt="">
        </div>
        <p class="weui_grid_label">
            Icons
        </p>
    </a>
    <a href="${path}/weui/demos/panel.jsp" class="weui_grid js_grid">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_panel.png" alt="">
        </div>
        <p class="weui_grid_label">
            Panel
        </p>
    </a>
    <a href="${path}/weui/demos/tabbar.jsp" class="weui_grid js_grid">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_tab.png" alt="">
        </div>
        <p class="weui_grid_label">
            Tabbar
        </p>
    </a>
    <a href="${path}/weui/demos/searchbar.jsp" class="weui_grid js_grid">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_search_bar.png" alt="">
        </div>
        <p class="weui_grid_label">
            SearchBar
        </p>
    </a>
</div>

<div class="demos-header">
    <h2 class='demos-second-title'>拓展组件</h2>
    <p class='demos-sub-title'>jQuery WeUI 专属组件</p>
</div>

<div class="weui_grids">
    <a href="${path}/weui/demos/ptr.jsp" class="weui_grid js_grid">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_ptr.png" alt="">
        </div>
        <p class="weui_grid_label">
            下拉刷新
        </p>
    </a>
    <a href="${path}/weui/demos/infinite.jsp" class="weui_grid js_grid">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_up.png" alt="">
        </div>
        <p class="weui_grid_label">
            滚动加载
        </p>
    </a>
    <a href="${path}/weui/demos/cols.jsp" class="weui_grid js_grid">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_cell.png" alt="">
        </div>
        <p class="weui_grid_label">
            12栏栅格
        </p>
    </a>
    <a href="${path}/weui/demos/picker.jsp" class="weui_grid js_grid">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_picker.png" alt="">
        </div>
        <p class="${path}/weui/demos/weui_grid_label">
            Picker
        </p>
    </a>
    <a href="${path}/weui/demos/calendar.jsp" class="weui_grid js_grid">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_calendar.png" alt="">
        </div>
        <p class="weui_grid_label">
            Calendar
        </p>
    </a>
    <a href="${path}/weui/demos/city-picker.jsp" class="weui_grid js_grid">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_city.png" alt="">
        </div>
        <p class="weui_grid_label">
            City Picker
        </p>
    </a>
    <a href="${path}/weui/demos/datetime-picker.jsp" class="weui_grid js_grid">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_datetime.png" alt="">
        </div>
        <p class="weui_grid_label">
            Datetime
        </p>
    </a>
    <a href="${path}/weui/demos/swiper.jsp" class="weui_grid js_grid">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_swiper.png" alt="">
        </div>
        <p class="weui_grid_label">
            Swiper
        </p>
    </a>
    <a href="${path}/weui/demos/noti.jsp" class="weui_grid js_grid">
        <div class="weui_grid_icon">
            <i class="weui_icon_info_circle"></i>
        </div>
        <p class="weui_grid_label">
            Notification
        </p>
    </a>
    <a href="${path}/weui/demos/select.jsp" class="weui_grid js_grid">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_select.png" alt="">
        </div>
        <p class="weui_grid_label">
            Select
        </p>
    </a>
    <a href="javascript:;" class="weui_grid js_grid open-popup" data-target="#about">
        <div class="weui_grid_icon">
            <img src="${path}/weui/demos/images/icon_nav_panel.png" alt="">
        </div>
        <p class="weui_grid_label">
            Popup
        </p>
    </a>
</div>
</div>

<style>
    .weui_icon_info_circle:before {
        font-size: 28px;
        color: #09BB07;
    }
</style>

<div id="about" class='weui-popup-container'>
    <div class="weui-popup-modal">
        <header class='demos-header'>
            <h2 class="demos-second-title">关于 jQuery WeUI</h2>
            <p class="demos-sub-title">By 言川 @2016/03/30</p>
        </header>

        <article class="weui_article">
            <h1>大标题</h1>
            <section>
                <h2 class="title">章标题</h2>
                <section>
                    <h3>1.1 节标题</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat. Duis aute</p>
                </section>
                <section>
                    <h3>1.2 节标题</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </section>
            </section>
            <section>
                <a href="javascript:;" class="weui_btn weui_btn_plain_primary close-popup">关闭</a>
            </section>
        </article>
    </div>
</div>

</body>

</html>
