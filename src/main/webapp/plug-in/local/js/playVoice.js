/**
 * Created by Administrator on 2017/6/26.
 */
/*播放语音*/
function playVoice(obj){
    var thisDom = $(obj);
    var audio = thisDom.parent().next()[0];
    if(audio.paused){
        audio.play();
        thisDom.css("background-image","url("+path+"/plug-in/local/img/personReportDetail/playing.gif)").text("正在播放语音");
    }else{
        audio.pause();
        thisDom.css("background-image","url("+path+"/plug-in/local/img/personReportDetail/pause.png)").text("语音已暂停");
    }
    $(audio).bind("ended",function(){
        $(thisDom).css("background-image","url("+path+"/plug-in/local/img/personReportDetail/play.png)").text("点击播放语音");
    })
}