package com.ruoyi.project.system.wechat.task;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.http.HttpClientUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.framework.config.WechatConfig;
import com.ruoyi.project.system.wechat.domain.AccessToken;
import com.ruoyi.project.system.wechat.domain.TicketToken;
import com.ruoyi.project.system.wechat.util.Sign;
import com.ruoyi.project.system.wechat.util.WechatBasicKit;
import com.ruoyi.project.system.wechat.util.WechatFinalValue;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Component
@Configuration
@EnableScheduling
public class RefreshAccessTokenJob {
	public void refreshToken() throws Exception {
		String url = WechatFinalValue.ACCESS_TOKEN_URL;
		WechatConfig wechatConfig = (WechatConfig) SpringUtils.getBean("wechatConfig");
		
		url = url.replaceAll("APPID", wechatConfig.getAppID());
		url = url.replaceAll("APPSECRET", wechatConfig.getAppsecret());
		String content = HttpClientUtils.https(url, "");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(sdf.format(new Date()) + "-> " + content);
		if(WechatBasicKit.checkRequestSucc(content)) {
			AccessToken accessToken = (AccessToken) JSONObject.parseObject(content, AccessToken.class);
			wechatConfig.setAccessToken(accessToken);
			System.out.println(sdf.format(new Date()) + "-> " + wechatConfig.getAccessToken());

			/**** JSSDK ticket ****/
			String requestUrl = WechatFinalValue.TicketUrl.replace("ACCESS_TOKEN", accessToken.getAccess_token());
			String jsonObject2 = HttpClientUtils.https(requestUrl, "");
            TicketToken ticketToken = ((TicketToken)JSONObject.parseObject(jsonObject2, TicketToken.class));
			wechatConfig.setTicketToken(ticketToken);
			System.out.println(sdf.format(new Date()) + "-> TicketToken" + "-> " + wechatConfig.getTicketToken());
		} else {
			refreshToken();
		}
	}
	
	public void refreshTokenOnce() throws Exception {
		String url = WechatFinalValue.ACCESS_TOKEN_URL;
		WechatConfig wechatConfig = (WechatConfig) SpringUtils.getBean("wechatConfig");
		
		url = url.replaceAll("APPID", wechatConfig.getAppID());
		url = url.replaceAll("APPSECRET", wechatConfig.getAppsecret());
		String content = HttpClientUtils.https(url, "");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(sdf.format(new Date()) + "-> " + content);
		if(WechatBasicKit.checkRequestSucc(content)) {
			AccessToken accessToken = (AccessToken) JSONObject.parseObject(content, AccessToken.class);
			wechatConfig.setAccessToken(accessToken);
			System.out.println("refreshAccessTokenTriggerOnce run...");
			System.out.println(sdf.format(new Date()) + "-> " + wechatConfig.getAccessToken());

            /**** JSSDK ticket ****/
            String requestUrl = WechatFinalValue.TicketUrl.replace("ACCESS_TOKEN", accessToken.getAccess_token());
            String jsonObject2 = HttpClientUtils.https(requestUrl, "");
            TicketToken ticketToken = ((TicketToken)JSONObject.parseObject(jsonObject2, TicketToken.class));
            wechatConfig.setTicketToken(ticketToken);
			System.out.println(sdf.format(new Date()) + "-> TicketToken" + "-> " + wechatConfig.getTicketToken());
		} else {
			refreshToken();
		}
	}
}
