package com.ruoyi.project.venue.order.service;

import java.util.Date;
import java.util.List;
import com.ruoyi.project.venue.order.domain.SubscribeTime;
public interface ISubscribeDetailService {
	/**
	 * 批量插入数据
	 * @param list
	 * @return
	 */
	public void  insertBatchDetails();
	
	/**
	 * 获取有效的预约时间段
	 * @param guestNum
	 * @param fromDt
	 * @return
	 */
	List<SubscribeTime> getInvalidDateList(int guestNum,Date fromDt,boolean isTypeIngore);
}
