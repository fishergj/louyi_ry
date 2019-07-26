package com.ruoyi.project.venue.order.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.common.utils.DateUtil;
import com.ruoyi.common.utils.TimeUtil;
import com.ruoyi.project.venue.order.bo.OrderIndex;
import com.ruoyi.project.venue.order.domain.OrderStastics;
import com.ruoyi.project.venue.order.mapper.OrderMapper;


@Service
public class OrderIndexServiceImpl implements IOrderIndexService{
	@Autowired
	private OrderMapper orderMapper;

	@Override
	public OrderIndex index() {
		int weekDay = TimeUtil.getWeekIntOfDate(new Date());
		OrderIndex index = new OrderIndex();
		String[] weekDayNames = new String[6];
		int[] weekdays = new int[6];;
		int[] dataDaySum = new int[6];
		int[] dataDayAdultSum = new int[6];
		int[] dataDayChildSum = new int[6];
		boolean isSunday = false;
		for(int i=0;i<7;i++){
			int newWeekDay = (weekDay + i)%7;
			if(newWeekDay == 0){
				isSunday = true;
				continue;
			} 
			if(isSunday){
				weekDayNames[i-1] = getWeekDayString(newWeekDay);
				weekdays[i-1] = newWeekDay;
			}else{
				weekDayNames[i] = getWeekDayString(newWeekDay);
				weekdays[i] = newWeekDay;
			}
			 
		}
		Date currentDt = new Date();
		Date nextDt = DateUtil.getNextDay(currentDt, 7);
		// 获取统计信息
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("beginTime", currentDt);
		map.put("endTime", nextDt);
		List<OrderStastics> list = orderMapper.selectNextOrderStasticsByWeek(map);
		int i=0;
		for(int day:weekdays){
			boolean isDayOrder = false;
			for(OrderStastics item:list){
				if(day == item.getWeekDay()){
					dataDaySum[i] = item.getOrderSum();
					dataDayAdultSum[i] = item.getOrderAdult();
					dataDayChildSum[i] = item.getOrderChild();
					isDayOrder = true;
					continue;
				}
			}
			if(!isDayOrder){
				dataDaySum[day-1] = 0;
				dataDayAdultSum[day-1] = 0;
				dataDayChildSum[day-1] = 0;
			}
			i++;
		}
		index.setWeekDayName(weekDayNames);
		index.setDataDaySum(dataDaySum);
		index.setDataDayAdultSum(dataDayAdultSum);
		index.setDataDayChildSum(dataDayChildSum);
		
		int auditNum = orderMapper.selectWaiteAuditCount();
		index.setAuditNum(auditNum);
		
		return index;
	}
	
	/**
	 * 根据数字获取星期字符串
	 * @param weekDay
	 * @return
	 */
	private String getWeekDayString(int weekDay){
		
		String[] weekDays = {"周日", "周一", "周二", "周三", "周四", "周五", "周六"};
		return weekDays[weekDay];
	}
	
}
