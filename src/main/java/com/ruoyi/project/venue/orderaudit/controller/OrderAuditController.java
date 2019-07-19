package com.ruoyi.project.venue.orderaudit.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.venue.introduce.service.IIntroduceService;
import com.ruoyi.project.venue.orderaudit.domain.Order;
import com.ruoyi.project.venue.orderaudit.service.IOrderAuditService;

/**
 * 预约审核 信息操作处理
 * 
 * @author jungao
 * @date Dec 14, 2018 2:04:04 PM
 */
@Controller
@RequestMapping("/venue/orderaudit")
public class OrderAuditController extends BaseController {
	private String prefix = "venue/orderaudit";
	@Autowired
	private IIntroduceService introduceService;

	@Autowired
	private IOrderAuditService orderAuditService;

	@RequiresPermissions("system:orderaudit:view")
	@GetMapping()
	public String orderAudit() {
		return prefix + "/index";
	}

	/**
	 * 查询预约审核列表
	 */
	@RequiresPermissions("system:orderaudit:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Order order) {
		startPage();
		List<Order> list = orderAuditService.selectOrderList(order);
		return getDataTable(list);
	}

	/**
	 * 通过预约信息
	 */
	@RequiresPermissions("system:orderaudit:pass")
	@Log(title = "预约信息通过", businessType = BusinessType.DELETE)
	@PostMapping("/pass")
	@ResponseBody
	public AjaxResult pass(String ids) {
		return toAjax(introduceService.deleteVenueIntroByIds(ids));
	}
	
	/**
	 * 驳回预约信息
	 */
	@RequiresPermissions("system:orderaudit:reject")
	@Log(title = "预约信息驳回", businessType = BusinessType.DELETE)
	@PostMapping("/reject")
	@ResponseBody
	public AjaxResult reject(String ids) {
		return toAjax(introduceService.deleteVenueIntroByIds(ids));
	}
}
