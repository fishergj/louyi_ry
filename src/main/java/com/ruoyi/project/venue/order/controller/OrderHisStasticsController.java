package com.ruoyi.project.venue.order.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.project.venue.order.bo.OrderHisStastics;
import com.ruoyi.project.venue.order.domain.Order;
import com.ruoyi.project.venue.order.service.IOrderHisStasticsService;

/**
 * 预约历史统计 信息操作处理
 * 
 * @author jungao
 * @date Dec 14, 2018 2:04:04 PM
 */
@Controller
@RequestMapping("/venue/orderhisstastics")
public class OrderHisStasticsController extends BaseController {
	private String prefix = "venue/orderhisstastics";

	@Autowired
	private IOrderHisStasticsService OrderHisStasticsService;

	@RequiresPermissions("venue:orderhisstastics:view")
	@GetMapping()
	public String orderAudit() {
		return prefix + "/index";
	}

	/**
	 * 查询预约历史统计列表
	 */
	@RequiresPermissions("venue:orderhisstastics:list")
	@PostMapping("/list")
	@ResponseBody
	public OrderHisStastics list(Order order) {		
		OrderHisStastics info = OrderHisStasticsService.selectStasticsResult(order);
		return info;
	}
}
