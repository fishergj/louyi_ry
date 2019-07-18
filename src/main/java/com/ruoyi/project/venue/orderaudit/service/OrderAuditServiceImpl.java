package com.ruoyi.project.venue.orderaudit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.project.venue.orderaudit.domain.Order;
import com.ruoyi.project.venue.orderaudit.mapper.OrderMapper;


@Service
public class OrderAuditServiceImpl implements IOrderAuditService{
	@Autowired
	private OrderMapper orderMapper;
	
	
	@Override
	public List<Order> selectOrderList(Order searchBo) {
		return orderMapper.selectOrderList(searchBo);
	}	
}
