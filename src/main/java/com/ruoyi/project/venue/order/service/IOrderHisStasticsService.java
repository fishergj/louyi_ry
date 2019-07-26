package com.ruoyi.project.venue.order.service;

import com.ruoyi.project.venue.order.bo.OrderHisStastics;
import com.ruoyi.project.venue.order.domain.Order;

public interface IOrderHisStasticsService {
	
	/**
	 * 统计人数
	 */
	public OrderHisStastics selectStasticsResult(Order order);
	
}
