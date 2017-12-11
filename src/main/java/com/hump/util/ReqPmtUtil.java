package com.hump.util;

import java.util.Map;

public class ReqPmtUtil {
	
	/**
	 * map 转 参数
	 * @param pmtMap
	 * @return
	 */
	public static String build(Map<String, String> pmtMap){
		StringBuffer b = new StringBuffer();
		if(null!= pmtMap && !pmtMap.isEmpty()){
			for (Map.Entry<String, String> m : pmtMap.entrySet()) {       
			    b.append("&").append(m.getKey()).append("=").append(m.getValue());
			}
			//移除最开始的&符
			b = b.deleteCharAt(0);
		}
		return b.toString();
	}

}
