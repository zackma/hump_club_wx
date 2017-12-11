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
$("#addEventImage").click(function () {
    var dom = $(this);
    selectPicFromLoc(eventImages,dom);
    return false;
});
$("#save").click(function () {
    save();
    return false;
});
//保存
function save(){
    var eventImagesLength = eventImages.localId.length;
    eventDesVal = $.trim($("#eventDes").val());
    caseTypeVal = $("#caseTypeSelect").val();
    verifyTypeVal = $("input[name='isReal']:checked").val();
    var i = 0;
    if(eventDesVal != ""){
        loadingX("提交数据中...");
        if(eventImagesLength > 0 && voice.localId != ""){
            function eventImagesUpload() {  //上传事件图片
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
                            wx.uploadVoice({
                                localId: voice.localId,
                                isShowProgressTips: 0,
                                success:function(res){
                                    voice.serverId = res.serverId;
                                    postData();
                                }
                            })
                        }
                    }
                })
            }
            eventImagesUpload();
        }
        if(eventImagesLength < 1 && voice.localId != ""){
            wx.uploadVoice({
                localId: voice.localId,
                isShowProgressTips: 0,
                success:function(res){
                    voice.serverId = res.serverId;
                    postData();
                }
            })
        }
        if(eventImagesLength > 0 && voice.localId == ""){
            function eventImagesUpload() {  //上传事件图片
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
                            postData();
                        }
                    }
                })
            }
            eventImagesUpload();
        }
        if(eventImagesLength < 1 && voice.localId ==""){
            postData();
        }
    }else{
        alertX("请填入带有红色*号的内容");
    }
}
function postData(){
    /*提交数据*/
    var data = {
        serverEventId: eventImages.serverId,   //上传事件图片
        serverVoiceId: voice.serverId,        //上传语音
        eventId:$("#eventId").val(),
        postScript:eventDesVal,               //事件描述
        caseType:caseTypeVal,    //事件类型
        verifyType:verifyTypeVal //0-虚报；1-实报
    };
    $.post(path+"/service/checkSubmit", data, function (data) {
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