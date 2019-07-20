package com.ruoyi.project.venue.order.service;

import java.util.List;

import com.ruoyi.project.venue.order.bo.OrderResultBo;
import com.ruoyi.project.venue.order.domain.Order;

public interface IOrderAuditService {
	/**
	 * 查询预约列表
	 * @param searchBo
	 */
	public List<Order>  selectOrderList(Order order);
	
	/**
	 * 根据Id获取信息
	 * @param id
	 * @return
	 */
	public OrderResultBo getOrderById(Long id);
	
	/**
	 * 检查未审核的状态
	 * @param ids
	 * @return
	 */
	public String checkPassOrderState(String ids,String statusName);
	
	/**
	 * 改变预约状态
	 * @param ids
	 * @param status
	 * @return
	 */
	public int updateStatus(String ids,String status);
	
	/**
	 * 强制更新时间
	 * @param order
	 * @return
	 */
	public int updateOrderTime(OrderResultBo order);
	
}
