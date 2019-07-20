package com.ruoyi.project.venue.order.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.venue.order.domain.Order;
import com.ruoyi.project.venue.order.domain.OrderStastics;
import com.ruoyi.project.venue.order.service.IOrderStasticsService;

/**
 * 预约审核 信息操作处理
 * 
 * @author jungao
 * @date Dec 14, 2018 2:04:04 PM
 */
@Controller
@RequestMapping("/venue/orderstastics")
public class OrderStasticsController extends BaseController {
	private String prefix = "venue/orderstastics";

	@Autowired
	private IOrderStasticsService orderStasticsService;

	@RequiresPermissions("venue:orderstastics:view")
	@GetMapping()
	public String orderAudit() {
		return prefix + "/index";
	}

	/**
	 * 查询预约审核列表
	 */
	@RequiresPermissions("venue:orderstastics:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Order order) {
		startPage();
		List<OrderStastics> list = orderStasticsService.selectOrderStasticsList(order);
		return getDataTable(list);
	}
}
