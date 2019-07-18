package com.ruoyi.project.venue.order.mapper;

import java.util.HashMap;
import java.util.List;

import com.ruoyi.project.venue.order.domain.SubscribeDetail;


public interface SubscribeDetailMapper {
	/**
	 * 批量插入数据
	 * @param list
	 * @return
	 */
	public int  insertBatchDetails(List<SubscribeDetail> list);
	
	/**
	 * 判断时间是否已经存在
	 * @param map
	 * @return
	 */
	int isOrderTimeExist(HashMap<String,Object> map);

}
