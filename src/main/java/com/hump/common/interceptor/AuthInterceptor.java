package com.hump.common.interceptor;

import com.hump.common.constant.Constant;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.jfinal.weixin.sdk.api.SnsAccessTokenApi;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * Created by Zackma on 2017/9/12 0012.
 */
public class AuthInterceptor implements Interceptor {
    public Log log = Log.getLog(getClass());

    @Override
    public void intercept(Invocation inv) {
        log.info("LoginInterceptor：Before method invoking");
        Controller controller =  inv.getController();

        String openId = controller.getSessionAttr(Constant.CURRENT_OPENID);
        log.info(Constant.CURRENT_OPENID+":"+openId);
        if(StrKit.isBlank(openId)){
            //微信服务器交互授权用code换取token
            if(!PropKit.getBoolean("autoAuth")){
                log.info("当前未登录/跳转授权");
                log.info("getControllerKey:" + inv.getControllerKey());
                log.info("getActionKey:" + inv.getActionKey());
                String authorizeURL = SnsAccessTokenApi.getAuthorizeURL(PropKit.get("appId"),
                        urlencode(PropKit.get("domain") + "/auth/index"),true);
                log.info("authorizeURL:" + authorizeURL);
                controller.redirect(authorizeURL);
            }
            //免授权
            if(PropKit.getBoolean("autoAuth")){
                try{
                    openId = PropKit.get("authOpenId");
                    String token  = PropKit.get("authToken");
                    controller.setSessionAttr(Constant.CURRENT_OPENID,openId);
                    controller.setSessionAttr(Constant.CURRENT_TOKEN,token);
                    inv.invoke();
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }else{
            inv.invoke();
        }
    }

    /**
     * url编码
     * @param url
     * @return
     */
    private String urlencode(String url){
        String encodeurl = null;
        try {
            encodeurl = URLEncoder.encode(url, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return encodeurl;
    }
}
