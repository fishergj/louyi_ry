package com.ruoyi.project.venue.order.controller;

import java.util.Date;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.util.StringUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.venue.order.domain.SubscribeTime;
import com.ruoyi.project.venue.order.service.ISubscribeDetailService;
import com.ruoyi.project.venue.order.bo.OrderResultBo;
import com.ruoyi.project.venue.order.domain.Order;
import com.ruoyi.project.venue.order.service.IOrderAuditService;

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
	private IOrderAuditService orderAuditService;
	@Autowired
	private ISubscribeDetailService subscribeDetailService;

	@RequiresPermissions("venue:orderaudit:view")
	@GetMapping()
	public String orderAudit() {
		return prefix + "/index";
	}

	/**
	 * 查询预约审核列表
	 */
	@RequiresPermissions("venue:orderaudit:list")
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
	@RequiresPermissions("venue:orderaudit:pass")
	@Log(title = "预约信息通过", businessType = BusinessType.UPDATE)
	@PostMapping("/pass")
	@ResponseBody
	public AjaxResult pass(String ids) {
		String checkMsg = orderAuditService.checkPassOrderState(ids,"审核通过");
		if(StringUtil.isNotEmpty(checkMsg)){
			return AjaxResult.warn(checkMsg);
		}
		int rst = orderAuditService.updateStatus(ids,"5");
		if(rst == 1){
			return AjaxResult.success("所有记录审核通过成功");
		} else{
			return AjaxResult.success("所有记录审核通过失败");
		}
	}
	
	/**
	 * 驳回预约信息
	 */
	@RequiresPermissions("venue:orderaudit:reject")
	@Log(title = "预约信息驳回", businessType = BusinessType.UPDATE)
	@PostMapping("/reject")
	@ResponseBody
	public AjaxResult reject(String ids) {
		String checkMsg = orderAuditService.checkPassOrderState(ids,"驳回");
		if(StringUtil.isNotEmpty(checkMsg)){
			return AjaxResult.warn(checkMsg);
		}
		int rst = orderAuditService.updateStatus(ids,"3");
		if(rst == 1){
			return AjaxResult.success("所有记录驳回成功");
		} else{
			return AjaxResult.success("所有记录驳回失败");
		}
	}
	
	/**
	 * 修改场馆介绍
	 */
	@GetMapping("/editTime/{id}")
	public String editTime(@PathVariable("id") Long id, ModelMap mmap) {
		OrderResultBo order = orderAuditService.getOrderById(id);
		mmap.put("order",order );
		// 不需要管预约类型，当前时间之后的所有有效时间段
		List<SubscribeTime> list = subscribeDetailService.getInvalidDateList(order.getSubscribe_num(), new Date(),true);
		mmap.put("timeList", list);
		return prefix + "/editTime";
	}
	
	
	/**
	 * 更改预约时间
	 */
	@RequiresPermissions("venue:orderaudit:editTime")
	@Log(title = "更改预约时间", businessType = BusinessType.UPDATE)
	@PostMapping("/editTime")
	@ResponseBody
	public AjaxResult editTime(OrderResultBo order) {
		String checkMsg = orderAuditService.checkPassOrderState(String.valueOf(order.getId()),"更改时间");
		if(StringUtil.isNotEmpty(checkMsg)){
			return AjaxResult.warn(checkMsg);
		}
		int rst = orderAuditService.updateOrderTime(order);
		if(rst == 1){
			return AjaxResult.success("更改预约时间成功");
		} else{
			return AjaxResult.success("更改预约时间失败");
		}
	}
}
