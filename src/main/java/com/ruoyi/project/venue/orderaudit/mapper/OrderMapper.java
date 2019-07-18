package com.ruoyi.project.venue.orderaudit.mapper;

import java.util.List;

import com.ruoyi.project.venue.orderaudit.domain.Order;


public interface OrderMapper {
	/**
	 * 查询预约记录列表
	 * @param list
	 * @return
	 */
	public List<Order>  selectOrderList(Order bo);

}
