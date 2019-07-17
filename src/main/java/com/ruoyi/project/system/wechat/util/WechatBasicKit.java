package com.ruoyi.project.system.wechat.util;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.framework.config.WechatConfig;

public class WechatBasicKit {
	public static String replaceAccessTokenUrl(String url) {
		WechatConfig wechatConfig = (WechatConfig) SpringUtils.getBean("wechatConfig");
		return url.replace("ACCESS_TOKEN", wechatConfig.getAccessToken().getAccess_token());
	}
	
	/**
	 * 检查请求是否成功
	 * @return
	 */
	public static boolean checkRequestSucc(String content) {
		try {
			JSONObject jsonObj = JSONObject.parseObject(content);
			if (!jsonObj.containsKey("errcode"))
				return true;
			if (Integer.parseInt(jsonObj.get("errcode").toString()) == 0)
				return true;
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static String getRequestMsg(String content) {
		try {
			JSONObject jsonObj = JSONObject.parseObject(content);
			if (jsonObj.containsKey("errcode")) 
				return jsonObj.getString("errcode");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
