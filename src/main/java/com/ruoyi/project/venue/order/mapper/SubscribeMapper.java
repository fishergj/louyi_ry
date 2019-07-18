package com.ruoyi.project.venue.order.mapper;

import java.util.List;

import com.ruoyi.project.venue.order.domain.Subscribe;

public interface SubscribeMapper {
	/**
	 * 获取所有的预约模板信息
	 * @return
	 */
	public List<Subscribe>  selectAllSubscribes();
}
