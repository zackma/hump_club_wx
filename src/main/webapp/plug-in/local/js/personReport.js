/**
 * Created by Administrator on 2017/6/15.
 */
wx.ready(function () {
    //获取当前位置
    if($("#inputLocation").length > 0){
        wx.getLocation({
            type: 'gcj02', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
            success:function(res){
                longitude_wx_curt = res.longitude; // 经度，浮点数，范围为180 ~ -180。
                latitude_wx_curt = res.latitude;    // 纬度，浮点数，范围为90 ~ -90
                $.ajax({
                    url:"http://apis.map.qq.com/ws/geocoder/v1/?location="+latitude_wx_curt+","+longitude_wx_curt+"&coord_type=5&key=PUPBZ-GVQR5-XNGIL-Q3224-X4B6J-WCFQS&output=jsonp",
                    type:"GET",
                    dataType:"jsonp",
                    jsonp:"callback",
                    jsonpCallback:"QQmap",
                    success:function(data){
                        $(".mask-loading").hide("");
                        $("body,html").css("overflow","auto");
                        currentAddress = data.result.formatted_addresses.recommend;
                        $("#inputLocation").val(currentAddress);
                    },
                    fail:function () {
                        $(".mask-loading").hide("");
                        $("body,html").css("overflow","auto");
                        confirmX('查询当前地址失败,是否刷新当前页?',function(){
                            location.reload();
                        });
                    }

                })
            },
            cancel:function(){
                closeX();
                msgB('您已拒绝授权获取地理位置，现在将离开本页面',function(){
                    location.href = path //回到首页
                });
            },
            fail:function() {
                closeX();
                msgB('您已拒绝授权获取地理位置，现在将离开本页面',function(){
                    location.href = path //回到首页
                });
            }
        })
    }
})
//选择图片
function selectPicFromLoc(imgObj,dom){
    var that = dom;
    wx.chooseImage({    //本地选择图片
        count: 3,
        success:function (res) {
            var localIds = res.localIds;// 返回选定照片的本地ID列表，localId可以作为img便签的src属性显示图片
            for(var i=0;i<localIds.length;i++){
                var ios = window.__wxjs_is_wkwebview; //判断WKWebview内核
                if(ios){
                	var loacId = res.localIds[i];
                    wx.getLocalImgData({
                        localId:loacId, //图片的localId
                        success:function (res) {
                            var imgsSize = that.prevAll().size(); //已经选择好插入事件图片框中图片的张数
                            if(imgsSize >= 2){
                                that.hide();
                            }
                            if(imgsSize <= 2){
                                var localData = res.localData; // localData是图片的base64数据，可以用img标签显示
                                imgObj.localId.push(loacId);
                                var imgsItem = "<li class=\"pull-left img-item\"><img src=\""+localData+"\"><span class=\"close\" onclick=\"deleteImg('"+loacId+"',this)\"><i class=\"fa fa-close\"></i></span></li>";
                                that.before(imgsItem);
                            }
                        }
                    })
                }else {   //android
                    var imgsSize = that.prevAll().size();  //已经选择好插入事件图片框中图片的张数
                    imgObj.localId.push(localIds[i]);
                    var imgsItem = "<li class=\"pull-left img-item\"><img src=\""+localIds[i]+"\"><span class=\"close\" onclick=\"deleteImg('"+localIds[i]+"',this)\"><i class=\"fa fa-close\"></i></span></li>";
                    that.before(imgsItem);
                    if(imgsSize >= 2){
                        that.hide();
                        break;
                    }
                }
            }
        },
        cancel:function(res){  //取消事件

        }
    })
}
// 删除图片
function deleteImg(id,obj) {
    var imgPp = $(obj).parent().parent();
    var imgsSize = imgPp.find(".img-item").size(); //已经选择好插入事件图片框中图片的张数
    var imgTypeId = imgPp.attr("id");
    $(obj).parent().remove();
    if(imgTypeId == "eventImgBox"){
        $.each(eventImages.localId,function (index,item) {
            if(item == id){
                eventImages.localId.splice(index,1)
            }
        })
    }
    if(imgTypeId == "localImgBox"){
        $.each(localImages.localId,function(index,item){
            if(item == id){
                localImages.localId.splice(index,1)
            }
        });
    }
    if(imgsSize < 4){
        imgPp.find(".add-picture").show();
    }
}
//选择事发地
function addLocation(){
    var myLocationIframeH = $(window).height()-50;
    var myLocationIframe = $("#myLocation");
    myLocationIframe.attr("src","http://apis.map.qq.com/tools/locpicker?search=1&type=1&zoom=19&key=PUPBZ-GVQR5-XNGIL-Q3224-X4B6J-WCFQS&referer=myapp").css({"display":"block","height":myLocationIframeH,"z-index":"100"});
    window.addEventListener('message', function(event) {
        // 接收位置信息，用户选择确认位置点后选点组件会触发该事件，回传用户的位置信息
        var loc = event.data;
        if (loc && loc.module == 'locationPicker') {//防止其他应用也会向该页面post信息，需判断module是否为'locationPicker'
            myLocationIframe.hide();
            $("#inputLocation").val(loc.poiname);
            address = loc.poiname;
            longitude_wx_from = loc.latlng.lng;
            latitude_wx_from = loc.latlng.lat;
        }
    }, false);
}
//按下开始录音
$('#talkBtn').on('touchstart', function(event){
    event.preventDefault();
    START = new Date().getTime();
    $(this).text("请说话").css("background","#999");
    $(this).parent().next().show().animate({top:"-80px",width:"64px",height:"70px",opacity:1},300);
    recordTimer = setTimeout(function(){
        wx.startRecord({
            success: function(){
                localStorage.rainAllowRecord = 'true';
                wx.onVoiceRecordEnd({
                    complete:function(res){
                        alertX('已停止录音，最长可以录1分钟');
                        voice.localId = res.localId;
                        /*$(this).text("按住录音").hide().css("background","#cdcdcd");
                        $(this).nextAll().show();
                        $(this).parent().next().animate({top:"50px",width:"6px",height:"7",opacity:0});*/
                    }
                })

            },
            cancel: function () {
                alertX('用户拒绝授权录音');
            }
        });
    },300);
});
//松手结束录音
$('#talkBtn').on('touchend', function(event){
    event.preventDefault();
    END = new Date().getTime();
    if((END - START) < 300){
        END = 0;
        START = 0;
        $(this).text("按住录音").css("background","#cdcdcd");
        $(this).parent().next().animate({top:"50px",width:"6px",height:"7",opacity:0})
        //小于300ms，不录音
        clearTimeout(recordTimer);
    }else{
    	$(this).text("按住录音").hide().css("background","#cdcdcd");
        $(this).nextAll().show();
        $(this).parent().next().animate({top:"50px",width:"6px",height:"7",opacity:0});
        wx.stopRecord({
            success: function (res) {
                voice.localId = res.localId;
            },
            fail: function (res) {
                alertX(JSON.stringify(res));
                $(this).text("按住录音").css("background","#cdcdcd");
                $(this).parent().next().animate({top:"50px",width:"6px",height:"7",opacity:0});
            }
        });
    }
});
//删除语音
function deleteRecord(obj){
	wx.stopVoice({
		localId:voice.localId
	});
    voice.localId = "";
    $(obj).hide("fast");
    $(obj).prev().hide("fast");
    $(obj).siblings("#talkBtn").show("fast");
}
//播放语音
function playRecord(obj,path){
    if(voice.localId == ""){
        alertX("请先录制一段录音");
        return;
    }else{
        wx.playVoice({
            localId: voice.localId
        });
        wx.onVoicePlayEnd({
            success: function () {
                $(obj).css("background-image","url("+path+"/plug-in/local/img/personReport/play.png)");
            }
        });
    }
    $(obj).css("background-image","url("+path+"/plug-in/local/img/personReport/playing.gif)");
}