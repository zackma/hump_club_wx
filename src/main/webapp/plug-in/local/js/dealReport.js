$(function(){  
    var tmpImgs = document.getElementsByTagName("img");
    for(var i=0,len=tmpImgs.length; i<len; i++){  
    	var imgSrc = tmpImgs[i].src;
    	if (imgSrc.indexOf(".jpg") > -1) {
    		tmpImgs[i].onclick = function() {
    			decorateP(this);
    		}
    	}
    }  
    
    function decorateP(obj){
     	var currentArray = [];  
     	var imgs = document.getElementsByTagName("img");
     	for (var i=0,len=imgs.length; i<len; i++) {
     		var imgSrc = imgs[i].src;
     		if (imgSrc.indexOf(".jpg") > -1) {
     			currentArray.push(imgSrc);
     		}
     	}	     
     	wx.previewImage({
 	       current: obj.src,
 	       urls: currentArray
 	    });
    };
    
});

var eventImages = {  //事件图片对象变量
	    localId:[],
	    serverId:[]
	};
	var localImages = {   //位置参考图片对象变量
	    localId:[],
	    serverId:[]
	};
	var voice = {   //语音对象变量
	    localId:"",
	    serverId:"",
	};
//选择图片
function selectPicFromLoc(imgObj,dom){
    var that = $(dom);
    var imgObj = imgObj;
    wx.chooseImage({    //本地选择图片
        count: 3,
        success:function (res) {
            var localIds = res.localIds;// 返回选定照片的本地ID列表，localId可以作为img便签的src属性显示图片
            for(var i=0;i<localIds.length;i++){
                var ios = window.__wxjs_is_wkwebview; //判断WKWebview内核
                if(ios){
                    wx.getLocalImgData({
                        localId:res.localIds[i], //图片的localId
                        success:function (res) {
                            var imgsSize = that.prevAll().size(); //已经选择好插入事件图片框中图片的张数
                            if(imgsSize >= 2){
                                that.hide();
                            }
                            if(imgsSize <= 2){
                                var localData = res.localData; // localData是图片的base64数据，可以用img标签显示
                                var imgsItem = "<li class=\"pull-left img-item\"><img src=\""+localData+"\"><span class=\"close\" onclick=\"deleteImg('"+localIds[i]+"','"+imgObj+"',this)\"><i class=\"fa fa-close\"></i></span></li>";
                                that.before(imgsItem);
                                imgObj.localId.push(localIds[i]);
                            }
                        }
                    })
                }else {   //android
                    var imgsSize = that.prevAll().size();  //已经选择好插入事件图片框中图片的张数
                    var imgsItem = "<li class=\"pull-left img-item\"><img src=\""+localIds[i]+"\"><span class=\"close\" onclick=\"deleteImg('"+localIds[i]+"','"+imgObj+"',this)\"><i class=\"fa fa-close\"></i></span></li>";
                    that.before(imgsItem);
                    imgObj.localId.push(localIds[i]);
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
function deleteImg(id,imgObj,obj) {
    var imgPp = $(obj).parent().parent();
    var imgsSize = imgPp.find(".img-item").size(); //已经选择好插入事件图片框中图片的张数
    $(obj).parent().remove();
    $.each(imgObj.localId,function(index,item){
        if(item == id){
            imgObj.localId.splice(index,1)
        }
    });
    if(imgsSize < 4){
        imgPp.find(".add-picture").show();
    }
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
                        $(this).text("按住录音").hide().css("background","#cdcdcd");
                        $(this).nextAll().show();
                        $(this).parent().next().animate({top:"50px",width:"6px",height:"7",opacity:0});
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
    $(this).text("按住录音").hide().css("background","#cdcdcd");
    $(this).nextAll().show();
    $(this).parent().next().animate({top:"50px",width:"6px",height:"7",opacity:0});
    if((END - START) < 300){
        END = 0;
        START = 0;
        //小于300ms，不录音
        clearTimeout(recordTimer);
    }else{
        wx.stopRecord({
            success: function (res) {
                voice.localId = res.localId;
            },
            fail: function (res) {
                alertX(JSON.stringify(res));
            }
        });
    }
});
//删除语音
function deleteRecord(obj){
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
//保存
function save(){
    var eventImagesLength = eventImages.localId.length;
    var localImagesLength = localImages.localId.length;
    var currentLocation = $("#inputLocation").val();
    var i = 0;
    var j = 0;
    if(eventImagesLength > 0){
        loadingX("提交数据中...");
        function eventImagesUpload() {  //上传事件图片
            var eventImagesLength = eventImages.localId.length;
            wx.uploadImage({
                localId: eventImages.localId[i],
                isShowProgressTips: 0,
                success: function (res){
                    i++;
                    eventImages.serverId.push(res.serverId);
                    if (i < eventImagesLength) {
                        eventImagesUpload();
                    };
                    if (i == eventImagesLength){
                        wx.uploadVoice({//上传语音
                            localId: voice.localId,
                            isShowProgressTips: 0,
                            success:function(res){
                                voice.serverId = res.serverId;
                                function localImagesUpload(){
                                    var localImagesLength = localImages.localId.length;
                                    if(localImagesLength>0){
                                        wx.uploadImage({   //上传
                                            localId: localImages.localId[j],
                                            isShowProgressTips: 0,
                                            success:function(res){
                                                j++;
                                                localImages.serverId.push(res.serverId);
                                                if (j < localImagesLength) {
                                                    localImagesUpload();
                                                }
                                                if(j==localImagesLength){
                                                    postData();
                                                }
                                            },
                                            fail:function(res){
                                                alertX(JSON.stringify(res))
                                            }
                                        })
                                    }else{
                                        postData();
                                    }
                                }
                                localImagesUpload();
                            },
                            fail:function(res){
                                alertX(JSON.stringify(res))
                            }
                        })
                    }
                },
                fail: function (res) {
                    alertX(JSON.stringify(res))

                }
            })
        }
        eventImagesUpload();

    }else{
        alertX("请填入带有红色*号的内容");
    }
}
function postData(){
//	var eventD = ; //事件描述
    var eventDes = $.trim($("#eventDes").val());
    /*提交数据*/
    var data = {
        serverEventId: eventImages.serverId,   //上传事件图片
        serverVoiceId: voice.serverId,        //上传语音
        eventId:$("#eventId").val(),

    };
    $.post(path+"/service/dealSubmit", data, function (data) {
        closeX();
        if (data.success) {
            msgB(data.msg, function () {
                location.href = path;
            })
        } else {
            alertX(data.msg);
        }
    });
}