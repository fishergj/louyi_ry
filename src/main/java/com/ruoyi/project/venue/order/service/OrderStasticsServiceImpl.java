package com.ruoyi.project.venue.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.project.venue.order.domain.Order;
import com.ruoyi.project.venue.order.domain.OrderStastics;
import com.ruoyi.project.venue.order.mapper.OrderMapper;

@Service
public class OrderStasticsServiceImpl implements IOrderStasticsService{
	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public List<OrderStastics> selectOrderStasticsList(Order order) {

		List<OrderStastics> list = orderMapper.selectOrderStasticsList(order);
		for(OrderStastics item:list){
			item.setOrderWeeDay(getWeekDayString(item.getWeekDay()));
		}
		return list;
	}
	
	/**
	 * 根据数字获取星期字符串
	 * @param weekDay
	 * @return
	 */
	private String getWeekDayString(int weekDay){
		
		String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
		return weekDays[weekDay];
	}

}
