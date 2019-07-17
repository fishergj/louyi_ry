package com.ruoyi.project.system.wechat.task;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.http.HttpClientUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.framework.config.WechatConfig;
import com.ruoyi.project.system.wechat.domain.AccessToken;
import com.ruoyi.project.system.wechat.util.WechatBasicKit;
import com.ruoyi.project.system.wechat.util.WechatFinalValue;

import java.text.SimpleDateFormat;
import java.util.Date;

//@Component("wechatTask")
public class WechatTask {
	public void refreshToken() throws Exception {
		String url = WechatFinalValue.ACCESS_TOKEN_URL;
		WechatConfig wechatConfig = (WechatConfig) SpringUtils.getBean("wechatConfig");
		
		url = url.replaceAll("APPID", wechatConfig.getAppID());
		url = url.replaceAll("APPSECRET", wechatConfig.getAppsecret());
		String content = HttpClientUtils.https(url, "");
		if(WechatBasicKit.checkRequestSucc(content)) {
			AccessToken accessToken = (AccessToken) JSONObject.parseObject(content, AccessToken.class);
			wechatConfig.setAccessToken(accessToken);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			System.out.println(sdf.format(new Date()) + "-> " + wechatConfig.getAccessToken());
		} else {
			refreshToken();
		}
	}
}