package com.ruoyi.project.venue.order.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ruoyi.common.utils.DateUtil;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.venue.order.mapper.SubscribeDetailMapper;
import com.ruoyi.project.venue.order.bo.OrderResultBo;
import com.ruoyi.project.venue.order.domain.Order;
import com.ruoyi.project.venue.order.mapper.OrderMapper;


@Service
public class OrderAuditServiceImpl implements IOrderAuditService{
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private SubscribeDetailMapper subscribeDetailMapper;
	@Override
	public List<Order> selectOrderList(Order searchBo) {
		return orderMapper.selectOrderList(searchBo);
	}
	
	/**
	 * 检查是否在待审核状态
	 */
	@Override
	public String checkPassOrderState(String ids,String statusName) {
		String[] idArray = ids.split(",");
		for(String id:idArray){
			Order order = orderMapper.selectOrder(Integer.valueOf(id));
			if(order == null){
				return "预约信息不存在！";
			}
			if(!"1".equals(order.getStatus())){
				return "预约状态不是待审核状态，无法"+statusName+"！";
			}
		}
		return "";
	}

	/**
	 * 更新状态
	 */
	@Override
	@Transactional
	public int updateStatus(String ids,String status) {
		String[] idArray = ids.split(",");
		HashMap<String,Object> map = new HashMap<String,Object>();
		for(String id:idArray){
			map.put("id", id);
			map.put("status", status);
			map.put("auditor", ShiroUtils.getLoginName());
			if(orderMapper.updateStatus(map) == 0) return 0;
		}
	    return 1;
	}

	/**
	 * 根据Id获取预约信息
	 */
	@Override
	public OrderResultBo getOrderById(Long id) {
		OrderResultBo bo = orderMapper.getOrderById(id);
		if(bo!=null){
			bo.setInputTimeFmt(DateUtil.formatDate(bo.getInput_time(), "yyyy-MM-dd HH:mm"));
		}
		return bo;
	}

	/**
	 * 更新预约时间段
	 */
	@Override
	public int updateOrderTime(OrderResultBo order) {
		order.setStatus("4");
	    Date fromDt = subscribeDetailMapper.selectFromDtById(order.getSubscribe_time_id());
	    if(fromDt == null){
	    	 return 0;
	    }
	    order.setInput_time(fromDt);
		return orderMapper.updateOrderTime(order);
	}	
}
