package com.ruoyi.project.venue.orderaudit.service;

import java.util.List;

import com.ruoyi.project.venue.orderaudit.domain.Order;

public interface IOrderAuditService {
	/**
	 * 查询预约列表
	 * @param searchBo
	 */
	public List<Order>  selectOrderList(Order order);
}
