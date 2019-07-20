package com.ruoyi.project.venue.order.mapper;

import java.util.Date;
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
	
	/**
	 * 获取frmDt之后有效的可预约时间
	 * @param nowDate
	 * @return
	 */
	public List<SubscribeDetail> getInvalidDateList(Date fromDt);
	
	/**
	 * 获取开始时间
	 * @param id
	 * @return
	 */
	public Date selectFromDtById(int id);

}
