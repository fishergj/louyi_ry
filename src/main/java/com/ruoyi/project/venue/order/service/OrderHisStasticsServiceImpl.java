package com.ruoyi.project.venue.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.project.venue.order.bo.OrderHisStastics;
import com.ruoyi.project.venue.order.domain.Order;
import com.ruoyi.project.venue.order.domain.OrderStastics;
import com.ruoyi.project.venue.order.mapper.OrderMapper;

@Service
public class OrderHisStasticsServiceImpl implements IOrderHisStasticsService{
	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public OrderHisStastics selectStasticsResult(Order order) {
		OrderHisStastics his = new OrderHisStastics();
		his.setStastics(selectOrderHisStasticsList(order));
		List<OrderStastics> list = orderMapper.selectHisOrderStasticsByWeek(order);
		int[] weekdays = {1,2,3,4,5,6};
		int[] dataDaySum = new int[6];
		int[] dataDayAdultSum = new int[6];
		int[] dataDayChildSum = new int[6];

		for(int day:weekdays){
			boolean isDayOrder = false;
			for(OrderStastics item:list){
				if(day == item.getWeekDay()){
					dataDaySum[day-1] = item.getOrderSum();
					dataDayAdultSum[day-1] = item.getOrderAdult();
					dataDayChildSum[day-1] = item.getOrderChild();
					isDayOrder = true;
					continue;
				}
			}
			if(!isDayOrder){
				dataDaySum[day-1] = 0;
				dataDayAdultSum[day-1] = 0;
				dataDayChildSum[day-1] = 0;
			}
		}
		his.setDataDaySum(dataDaySum);
		his.setDataDayAdultSum(dataDayAdultSum);
		his.setDataDayChildSum(dataDayChildSum);
		return his;
	}


	/**
	 * 表格统计信息
	 * @param order
	 * @return
	 */
	private OrderStastics selectOrderHisStasticsList(Order order) {

		OrderStastics stastic = orderMapper.selectHisOrderStastics(order);
		
		Object beginDt = order.getParams().get("beginTime");
		String orderDt = "";
		if(beginDt != null && !"".equals(beginDt)){
			orderDt = beginDt.toString();
		}
		Object endDt = order.getParams().get("endTime");
		
		if(endDt != null&& !"".equals(endDt)){
			orderDt = orderDt + "-" + endDt.toString();
		}
		stastic.setOrderDt(orderDt);
		return stastic;
	}
}
