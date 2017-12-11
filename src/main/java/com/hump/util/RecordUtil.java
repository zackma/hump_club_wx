package com.hump.util;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.plugin.activerecord.Record;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class RecordUtil {
	
	public static Record jCovR(JSONObject object){
		Record rd = null;
		if (!object.isEmpty()) {
			rd = new Record();
			for (Map.Entry<String, Object> map : object.entrySet()) {
				rd.set(map.getKey(), map.getValue());
			}
			return rd;
		} else {
			return null;
		}
	}
	
	public static List<Record> jaCovRl(JSONArray array){
		List<Record> rds = new ArrayList<Record>();
		if(null != array && !array.isEmpty()){
			Iterator<Object> it = array.iterator();
			Record rd = null;
			while (it.hasNext()) {
				JSONObject ob = (JSONObject) it.next();
				rd = new Record();
				for (Map.Entry<String, Object> map : ob.entrySet()) {
					rd.set(map.getKey(), map.getValue());
				}
				rds.add(rd);
			}
		}
		return rds;
	}

}
