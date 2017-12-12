package com.hump.controller.index;

import com.hump.common.cotroller.BaseController;
import com.hump.common.interceptor.AuthInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.aop.Invocation;

/**
 * 首页
 * @author zackma
 *
 */
@Before(value = {AuthInterceptor.class})
public class IndexController extends BaseController{
	public void index(){
		render("index.jsp");
	}
}
