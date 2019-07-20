package com.ruoyi.project.venue.order.service;

import java.util.List;

import com.ruoyi.project.venue.order.domain.Order;
import com.ruoyi.project.venue.order.domain.OrderStastics;

public interface IOrderStasticsService {
	/**
	 * 统计人数
	 */
	public List<OrderStastics> selectOrderStasticsList(Order order);
	
}
