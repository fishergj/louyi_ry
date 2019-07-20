package com.ruoyi.project.venue.orderaudit.mapper;

import java.util.HashMap;
import java.util.List;

import com.ruoyi.project.venue.orderaudit.bo.OrderResultBo;
import com.ruoyi.project.venue.orderaudit.domain.Order;


public interface OrderMapper {
	/**
	 * 查询预约记录列表
	 * @param list
	 * @return
	 */
	public List<Order>  selectOrderList(Order bo);
	
	/**
	 * 根据Id获取信息
	 * @param id
	 * @return
	 */
	public OrderResultBo getOrderById(long id);
	
	/**
	 * 查看预约明细记录
	 * @param id
	 * @return
	 */
	public Order selectOrder(int id);
	
	/**
	 * 更新状态
	 * @param map
	 * @return
	 */
	public int updateStatus(HashMap<String,Object> map);
	
	/**
	 * 强制更改时间段
	 * @param bo
	 * @return
	 */
	public int updateOrderTime(OrderResultBo bo);

}
