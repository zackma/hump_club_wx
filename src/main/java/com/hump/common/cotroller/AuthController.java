package com.hump.common.cotroller;

import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.weixin.sdk.api.ApiResult;
import com.jfinal.weixin.sdk.api.SnsAccessToken;
import com.jfinal.weixin.sdk.api.SnsAccessTokenApi;
import com.jfinal.weixin.sdk.api.UserApi;
import com.hump.common.constant.Constant;
import com.hump.util.ApiUtil;
import com.hump.util.ReqPmtUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * 微信授权操作
 * 
 * @author nays
 *
 */
public class AuthController extends Controller {

	/**
	 * 授权操作
	 */
	public void index() {
		//code 从微信服务器带着code来到我们自己的服务器，用code换取openId
		String code = getPara("code");
		SnsAccessToken snsAccessToken = SnsAccessTokenApi.getSnsAccessToken(PropKit.get("appId"),
				PropKit.get("appSecret"), code);
		if (snsAccessToken.isAvailable()) {
			String openId = snsAccessToken.getOpenid();
			Record wxUser = ApiUtil.getInstance().getWxUserByOpenId(openId);
			if (wxUser == null && !StrKit.isBlank(openId)) {
				ApiResult apiResult = UserApi.getUserInfo(openId);
				if (null != apiResult && apiResult.isSucceed()) {
					Map<String, String> param = new HashMap<String, String>();
					param.put("openid", apiResult.getStr("openid"));
					param.put("nickname", apiResult.getStr("nickname"));
					param.put("sex", apiResult.get("sex")!=null ?apiResult.get("sex").toString():"");
					param.put("country", apiResult.getStr("country"));
					param.put("province", apiResult.getStr("province"));
					param.put("city", apiResult.getStr("city"));
					param.put("headimgurl", apiResult.getStr("headimgurl"));
					int r = ApiUtil.getInstance().createWxUser(ReqPmtUtil.build(param));
					if (r > 0) {
						wxUser = ApiUtil.getInstance().getWxUserByOpenId(openId);
					}
				}
			}
			if (null != wxUser) {
				setSessionAttr(Constant.WEIXIN_USER, wxUser);
			}
			String back_url = getSessionAttr("back_url");
			if (!StrKit.isBlank(back_url)) {
				forwardAction(back_url);
			} else {
				redirect("/index");
			}
		} else {
			redirect("/index");
		}
	}
}
