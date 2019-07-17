package com.ruoyi.project.system.wechat.mapper;

import com.ruoyi.project.system.wechat.domain.WechatMenu;

import java.util.List;

public interface WechatMenuMapper {
	public WechatMenu loadByKey(String key);

	public List<WechatMenu> selectMenuList();

	public int add(WechatMenu wm);

	public void delete(int id);

	public void update(WechatMenu wm);

	public WechatMenu load(int id);
}
