package com.hump.common.utils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.Feature;
import com.jfinal.kit.HttpKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.weixin.sdk.utils.HttpUtils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class HttpReqUtil {
	static Log log = Log.getLog(HttpReqUtil.class);

	/**
	 * 查询单条
	 * 
	 * @param url
	 * @return
	 */
	public static Record getSingle(String url) {
		Record rd = null;
		try {
			String rs = HttpUtils.get(url);
			JSONObject json = JSONObject.parseObject(rs);
			if (rs != null && json.getBoolean("success")) {
				JSONObject object = JSONObject.parseObject(json.get("obj").toString());
				if (!object.isEmpty()) {
					rd = new Record();
					for (Map.Entry<String, Object> map : object.entrySet()) {
						rd.set(map.getKey(), map.getValue());
					}
					return rd;
				} else {
					return null;
				}
			} else {
				log.info("=================查询失败================");
				log.info("=================" + json.getString("msg") + "================");
				return null;
			}
		} catch (Exception e) {
			log.info("=================查询异常================");
			log.info("=================" + e.getMessage() + "================");
			e.printStackTrace();
			return null;
		}
	}

	public static Record getSingle(String url, Map<String, String> param) {
		Record rd = null;
		try {
			String rs = HttpUtils.get(url, param);
			JSONObject json = JSONObject.parseObject(rs);
			if (rs != null && json.getBoolean("success")) {
				JSONObject object = JSONObject.parseObject(json.get("obj").toString());
				if (!object.isEmpty()) {
					rd = new Record();
					for (Map.Entry<String, Object> map : object.entrySet()) {
						rd.set(map.getKey(), map.getValue());
					}
					return rd;
				} else {
					return null;
				}
			} else {
				log.info("=================查询失败================");
				log.info("=================" + json.getString("msg") + "================");
				return null;
			}
		} catch (Exception e) {
			log.info("=================查询异常================");
			log.info("=================" + e.getMessage() + "================");
			e.printStackTrace();
			return null;
		}
	}

	public static List<Record> getMany(String url) {
		List<Record> rds = new ArrayList<Record>();
		try {
			String rs = HttpUtils.get(url);
			JSONObject json = JSONObject.parseObject(rs);
			if (rs != null && json.getBoolean("success")) {
				JSONArray jsonArray = JSONArray.parseArray(json.get("obj").toString());
				Iterator<Object> it = jsonArray.iterator();
				Record rd = null;
				while (it.hasNext()) {
					JSONObject ob = (JSONObject) it.next();
					rd = new Record();
					for (Map.Entry<String, Object> map : ob.entrySet()) {
						rd.set(map.getKey(), map.getValue());
					}
					rds.add(rd);
				}
				return rds;
			} else {
				log.info("=================查询失败================");
				log.info("=================" + json.getString("msg") + "================");
				return rds;
			}
		} catch (Exception e) {
			log.info("=================查询异常================");
			log.info("=================" + e.getMessage() + "================");
			e.printStackTrace();
			return rds;
		}
	}
	
	public static String getPasswordResult(String url, Map<String, String> param) {
		String rs ="";
		try {
			rs = HttpUtils.get(url, param);
			System.out.println(rs);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return rs;
	}
	public static String getManyJsonArry(String url, Map<String, String> param) {
		String rs ="";
		try {
			rs = HttpUtils.get(url, param);
			System.out.println(rs);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return rs;
	}

	public static String getManyToJsonArry(String url, Map<String, String> param) {
		JSONArray jsonArray = null;
		String jsonString = "[]";
		try {
			String rs = HttpUtils.get(url, param);
			System.out.println(rs);

			JSONObject json = JSONObject.parseObject(rs, JSONObject.class, Feature.values());
			if (rs != null && json.getBoolean("success")) {
				jsonArray = JSONArray.parseArray(json.get("obj").toString());
			}
			jsonString = jsonArray.toJSONString();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return jsonString;

	}

	public static List<Record> getMany(String url, Map<String, String> param) {
		List<Record> rds = new ArrayList<Record>();
		try {
			String rs = HttpUtils.get(url, param);
			System.out.println(rs);
			JSONObject json = JSONObject.parseObject(rs, JSONObject.class, Feature.values());
			if (rs != null && json.getBoolean("success")) {
				JSONArray jsonArray = JSONArray.parseArray(json.get("obj").toString());
				Iterator<Object> it = jsonArray.iterator();
				Record rd = null;
				while (it.hasNext()) {
					JSONObject ob = (JSONObject) it.next();
					rd = new Record();
					for (Map.Entry<String, Object> map : ob.entrySet()) {
						rd.set(map.getKey(), map.getValue());
					}
					rds.add(rd);
				}
				return rds;
			} else {
				log.info("=================查询失败================");
				log.info("=================" + json.getString("msg") + "================");
				return rds;
			}
		} catch (Exception e) {
			log.info("=================查询异常================");
			log.info("=================" + e.getMessage() + "================");
			e.printStackTrace();
			return rds;
		}
	}

	public static int doPost(String url, String data) {
		try {
			log.info("data:" + data);
			String rs = HttpKit.post(url, data, null);
			JSONObject json = JSONObject.parseObject(rs);
			if (rs != null && json.getBoolean("success")) {
				return 1;
			} else {
				log.info("=================操作失败================");
				log.info("=================" + json.getString("msg") + "================");
				return 0;
			}
		} catch (Exception e) {
			log.info("=================操作异常================");
			log.info("=================" + e.getMessage() + "================");
			e.printStackTrace();
			return 0;
		}
	}
}
