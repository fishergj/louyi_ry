package com.ruoyi.project.system.wechat.controller;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.wechat.domain.WechatMenu;
import com.ruoyi.project.system.wechat.service.IWechatMenuService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/system/wechat/menu")
public class WechatMenuController extends BaseController {
	private String prefix = "system/wechat";
	
	@Autowired
	private IWechatMenuService wechatMenuService;
	
	@RequiresPermissions("wechat:menu:view")
	@GetMapping()
	public String menu() {
		return prefix + "/menu";
	}
	
	@RequiresPermissions("wechat:menu:list")
	@GetMapping("/list")
	@ResponseBody
	public TableDataInfo list(WechatMenu menu) {
		startPage();
		List<WechatMenu> list = wechatMenuService.selectMenuList();
//		model.addAttribute("menus", wechatMenuService.selectMenuList());
//		model.addAttribute("wmds", wechatMenuService.generateWechatMenuDto());
		return getDataTable(list);
	}
	
//	@RequestMapping("/list")
//	public String list(Model model) {
//		model.addAttribute("menus", wechatMenuService.selectMenuList());
//		model.addAttribute("wmds", wechatMenuService.generateWechatMenuDto());
//		return "weixinMenu/list";
//	}
	
	/**
	 * 新增菜单
	 */
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}
	
	/*@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(Model model) {
		model.addAttribute("menu", new WechatMenu());
		return "weixinMenu/add";
	}*/
	
	/**
	 * 新增保存菜单
	 */
	@RequiresPermissions("wechat:menu:add")
	@Log(title = "微信菜单管理", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@Transactional(rollbackFor = Exception.class)
	@ResponseBody
	public AjaxResult addSave(WechatMenu wechatMenu) {
		return toAjax(wechatMenuService.add(wechatMenu));

	}
	
	/*@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(WechatMenu menu) {
		wechatMenuService.add(menu);
		return "redirect:/weixinMenu/list";
	}*/
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String update(@PathVariable int id,Model model) {
		model.addAttribute("menu", wechatMenuService.load(id));
		return "weixinMenu/add";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	public String update(@PathVariable int id,WechatMenu menu) {
		WechatMenu twm = wechatMenuService.load(id);
		twm.setContent(menu.getContent());
		twm.setMenuKey(menu.getMenuKey());
		twm.setName(menu.getName());
		twm.setRespType(menu.getRespType());
		twm.setType(menu.getType());
		twm.setUrl(menu.getUrl());
		twm.setRespType(menu.getRespType());
		wechatMenuService.update(twm);
		return "redirect:/weixinMenu/list";
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.GET)
	public String delete(@PathVariable int id,Model model) {
		wechatMenuService.delete(id);
		return "redirect:/weixinMenu/list";
	}
	
	@RequestMapping("/queryPublishMenu")
	public String queryPublish(Model model) throws Exception {
		model.addAttribute("ms", wechatMenuService.queryMenu());
		return "weixinMenu/publish";
	}
	
	@RequestMapping("/publishMenu")
	public String publishMenu() throws Exception {
		wechatMenuService.publishMenu();
		return "redirect:/weixinMenu/queryPublishMenu";
	}
}
