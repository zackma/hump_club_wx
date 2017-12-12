package com.hump.common.cotroller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import com.hump.common.constant.Constant;
import org.apache.log4j.Logger;

/**
 * baseController
 * @author zackma
 *
 */
public class BaseController extends Controller {
	
	/**
	 * 获取微信用户
	 * @return
	 */
	public Record getCurrentUser(){
		return getSessionAttr(Constant.WEIXIN_USER);
	}
	
	/**
	 * 获取当前用户的openid(如果存在后台登陆用户信息，则取的openid是后台用户绑定的openid。否则就是当前微信用户的openid)
	 * @return
	 */
	public String getCurrentOpenId(){
		if(null != getCurrentBackendUser()){
			return getCurrentBackendUser().get("openid");
		}else{
			return getCurrentUser().get("openid");
		}
	}
	
	/**
	 * 获取当前用户的openid
	 * @return
	 */
	public String getCurrentUserId(){
		return getCurrentUser().get("id");
	}
	
	/**
	 * 获取当前工作人员用户信息
	 * @return
	 */
	public Record getCurrentBackendUser(){
		return getSessionAttr(Constant.BACKEND_USER);
	}
	
	/**
	 * 获取当前工作人员用户id
	 * @return
	 */
	public String getCurrentBackendUserId(){
		return getCurrentBackendUser().getStr("userid");
	}
	
	protected  final static Logger logger = Logger.getLogger(BaseController.class);

}
