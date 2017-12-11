package com.hump.controller.index;

import com.hump.common.cotroller.BaseController;

/**
 * 首页
 * @author nays
 *
 */
//@Before(value = {LoginInterceptor.class})
public class IndexController extends BaseController{
	public void index(){
		render("index.jsp");
	}
}
