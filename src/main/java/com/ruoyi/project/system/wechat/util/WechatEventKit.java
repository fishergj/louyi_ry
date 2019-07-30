package com.ruoyi.project.system.wechat.util;

import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.project.system.wechat.domain.WechatMenu;
import com.ruoyi.project.system.wechat.service.IWechatMenuService;

import java.io.IOException;
import java.util.Map;

public class WechatEventKit {
	public static String handlerEventMsg(Map<String, String> msgMap) throws IOException {
		String event = msgMap.get("Event");
		System.out.println(event);
		System.out.println();
		if("CLICK".equals(event)) {
			//return handlerClickEvent(msgMap);
		} else if("SCAN".equals(event)) {
			//return handlerScanEvent(msgMap);
		} else if("subscribe".equals(event)) {
			//用户关注事件
			//return handlerSubscribeEvent(msgMap);
		} else if("unsubscribe".equals(event)) {
			//return handlerUnsubscribeEvent(msgMap);
		}
		return null;
	}
	
	private static String handlerClickEvent(Map<String, String> msgMap) throws IOException {
		String keyCode = msgMap.get("EventKey"); 
		IWechatMenuService wechatMenuService = (IWechatMenuService) SpringUtils.getBean("wechatMenuService");
		WechatMenu wm = wechatMenuService.loadByKey(keyCode);
		if(wm!=null&&wm.getRespType()==1) {
			Map<String,Object> map = MessageCreateKit.createTextMsg(msgMap, wm.getContent());
			return WechatMessageKit.map2xml(map);
		}
		return null;
	}
}
