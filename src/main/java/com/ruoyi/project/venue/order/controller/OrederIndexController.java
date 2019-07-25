package com.ruoyi.project.venue.order.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.project.venue.order.bo.OrderIndex;
import com.ruoyi.project.venue.order.service.IOrderIndexService;
@Controller
@RequestMapping("/venue/orderIndex")
public class OrederIndexController extends BaseController {
	
	@Autowired
	private IOrderIndexService orderIndexService;
	
	/**
	 * 查询预约历史统计列表
	 */
	@RequiresPermissions("venue:orderhisstastics:list")
	@PostMapping("/index")
	@ResponseBody
	public OrderIndex list() {		
		OrderIndex info = orderIndexService.index();
		return info;
	}
}
