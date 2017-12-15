package com.hump.common.cotroller;

import com.hump.service.fans.FansService;
import com.jfinal.aop.Duang;
import com.jfinal.weixin.sdk.api.ApiResult;
import com.jfinal.weixin.sdk.api.UserApi;
import com.jfinal.weixin.sdk.jfinal.MsgControllerAdapter;
import com.jfinal.weixin.sdk.msg.in.InTextMsg;
import com.jfinal.weixin.sdk.msg.in.event.InFollowEvent;
import com.jfinal.weixin.sdk.msg.in.event.InMenuEvent;
import com.jfinal.weixin.sdk.msg.out.OutTextMsg;

/**
 * Created by Zackma on 2017/9/12 0012.
 */
public class MsgController extends MsgControllerAdapter{

    /**
     * 实现父类抽方法，处理关注/取消关注消息
     * @param inFollowEvent
     */
    @Override
    protected void processInFollowEvent(InFollowEvent inFollowEvent) {

        //关注
        if(inFollowEvent.EVENT_INFOLLOW_SUBSCRIBE.equals(inFollowEvent.getEvent())){
            //关注消息
            OutTextMsg outMsg = new OutTextMsg(inFollowEvent);
            outMsg.setContent("感谢关注驼峰俱乐部公众号 \n");

            //关注后保存微信用户信息
            String openId = inFollowEvent.getFromUserName();
            ApiResult apiResult = UserApi.getUserInfo(openId);
            String wxUserStr = apiResult.getJson();
            FansService service = Duang.duang(FansService.class);
            service.insertFans(wxUserStr);
        }
        //取消关注
        if(inFollowEvent.EVENT_INFOLLOW_UNSUBSCRIBE.equals(inFollowEvent.getEvent())){
            String openid = inFollowEvent.getFromUserName();
            FansService service = Duang.duang(FansService.class);
            service.removeFans(openid);
        }
    }

    @Override
    protected void processInTextMsg(InTextMsg inTextMsg) {

    }

    /**
     * 实现父类抽方法，处理自定义菜单事件
     * @param inMenuEvent
     */
    @Override
    protected void processInMenuEvent(InMenuEvent inMenuEvent) {

    }

}
