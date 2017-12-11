package com.hump.util;

import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Record;
import com.hump.common.utils.HttpReqUtil;

public class ApiUtil {
	
	private static ApiUtil instance = null;
	
	/**
	 * 单例初始化工具类
	 * 
	 * @return
	 */
	public static ApiUtil getInstance() {
		if (instance == null) {
			instance = new ApiUtil();
		}
		return instance;
	}
	/**
	 * 通过openid查询微信用户信息
	 * @param openId
	 * @return
	 */
	public Record getWxUserByOpenId(String openId){
		return HttpReqUtil.getSingle(PropKit.get("apiUrl")+"/weixinUserApi/getOpenId?openId="+openId);
	}
	
	/**
	 * 创建微信用户
	 * @param data
	 * @return
	 */
	public int createWxUser(String data){
		return HttpReqUtil.doPost(PropKit.get("apiUrl")+"/weixinUserApi/create", data);
	}
	
	/**
	 * 更新微信用户
	 * @param data
	 * @return
	 */
	public int updateWxUser(String data){
		return HttpReqUtil.doPost(PropKit.get("apiUrl")+"/weixinUserApi/update", data);
	}
}
