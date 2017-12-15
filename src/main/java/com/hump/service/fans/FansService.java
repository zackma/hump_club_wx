package com.hump.service.fans;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by zackma on 2017/12/15 0015.
 */
public class FansService {
    /**
     * 关注公众号后新增微信用户信息
     */
    public String insertFans(String wechatUserStr){
        String rst = "";
        Map<String,String> header = new HashMap();
        header.put("Content-Type","application/json");
        header.put("charset","UTF-8");
        if(StrKit.notBlank(wechatUserStr)){
            try {
                //移除tagid_list字段
                JSONObject jsonObject = JSONObject.parseObject(wechatUserStr);
                jsonObject.remove("tagid_list");
                wechatUserStr = jsonObject.toJSONString();
                rst = HttpKit.post(PropKit.get("apiUrl")+"insertFans",wechatUserStr,header);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return rst;
    }

    /**
     * 取消关注公众号后删除微信用户信息
     */
    public String removeFans(String openid){
        String rst = "";
        Map<String,String> header = new HashMap();
        header.put("Content-Type","application/json");
        header.put("charset","UTF-8");
        if(StrKit.notBlank(openid)){
            try {
                //移除tagid_list字段
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("openid",openid);
                String data = jsonObject.toJSONString();
                rst = HttpKit.post(PropKit.get("apiUrl")+"removeFans",data,header);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return rst;
    }
}
