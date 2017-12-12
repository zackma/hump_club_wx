package com.hump.common.config;

import com.hump.common.cotroller.MsgController;
import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.hump.controller.index.IndexController;

/**
 * API引导式配置
 */
public class WebConfig extends JFinalConfig {
	 /**
     * 如果生产环境配置文件存在，则优先加载该配置，否则加载开发环境配置文件
     * @param pro 生产环境配置文件
     * @param dev 开发环境配置文件
     */
    public void loadProp(String pro, String dev) {
        try {
            PropKit.use(pro);
        }
        catch (Exception e) {
            PropKit.use(dev);
        }
    }
	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {
		// 加载少量必要配置，随后可用PropKit.get(...)获取值
		loadProp("a_little_config_pro.txt", "a_little_config.txt");
		me.setDevMode(PropKit.getBoolean("devMode", true));
		me.setViewType(ViewType.JSP);
		// ApiConfigKit 设为开发模式可以在开发阶段输出请求交互的 xml 与 json 数据
        ApiConfigKit.setDevMode(me.getDevMode());
	}
	
	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) {
		// 第三个参数为该Controller的视图存放路径
		me.add("/", IndexController.class, "/view/index");			//默认首页
		me.add("/msg",MsgController.class);
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		//添加缓存插件
		me.add(new EhCachePlugin());
	}
	
	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {
		
	}
	
	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {
		me.add(new ContextPathHandler("root"));
	}
	public void afterJFinalStart() {
		
      ApiConfig ac = new ApiConfig();
      // 配置微信 API 相关参数
      ac.setToken(PropKit.get("token"));
      ac.setAppId(PropKit.get("appId"));
      ac.setAppSecret(PropKit.get("appSecret"));

      /**
       *  是否对消息进行加密，对应于微信平台的消息加解密方式：
       *  1：true进行加密且必须配置 encodingAesKey
       *  2：false采用明文模式，同时也支持混合模式
       */
      ac.setEncryptMessage(PropKit.getBoolean("encryptMessage", false));
      ac.setEncodingAesKey(PropKit.get("encodingAesKey", "setting it in config file"));
      
      /**
       * 多个公众号时，重复调用ApiConfigKit.putApiConfig(ac)依次添加即可，第一个添加的是默认。
       */
      ApiConfigKit.putApiConfig(ac);
      
      /**
       * 1.9 新增LocalTestTokenCache用于本地和线上同时使用一套appId时避免本地将线上AccessToken冲掉
       * 
       * 设计初衷：https://www.oschina.net/question/2702126_2237352
       * 
       * 注意：
       * 1. 上线时应保证此处isLocalDev为false，或者注释掉该不分代码！
       * 
       * 2. 为了安全起见，此处可以自己添加密钥之类的参数，例如：
       * http://localhost/weixin/api/getToken?secret=xxxx
       * 然后在WeixinApiController#getToken()方法中判断secret
       * 
       * @see WeixinApiController#getToken()
       */
//      if (isLocalDev) {
//          String onLineTokenUrl = "http://localhost/weixin/api/getToken";
//          ApiConfigKit.setAccessTokenCache(new LocalTestTokenCache(onLineTokenUrl));
//      }
//      WxaConfig wc = new WxaConfig();
//      wc.setAppId("wx4f53594f9a6b3dcb");
//      wc.setAppSecret("eec6482ba3804df05bd10895bace0579");
//      WxaConfigKit.setWxaConfig(wc);
    }
	/**
	 * 建议使用 JFinal 手册推荐的方式启动项目
	 * 运行此 main 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
	 */
	public static void main(String[] args) {
		JFinal.start("WebRoot", 8088, "/", 5);
	}
	
	@Override
	public void configEngine(Engine me) {
		// TODO Auto-generated method stub
	}
}
