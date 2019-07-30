package com.ruoyi.project.venue.introduce.service;

import java.util.List;

import com.ruoyi.project.venue.introduce.domain.StopDate;

/**
 * 禁用时间 服务层
 * 
 * @author jungao
 * @date Dec 14, 2018 2:03:34 PM
 */
public interface IStopDateService {

	/**
	 * 查询禁用时间列表
	 * 
	 * @param stopdate
	 *            禁用时间信息
	 * @return 禁用时间集合
	 */
	public List<StopDate> selectStopDateList(StopDate stopdate);

	/**
	 * 新增禁用时间
	 * 
	 * @param stopdate
	 *            禁用时间信息
	 * @return 结果
	 */
	public int insertStopDate(StopDate stopdate);



	/**
	 * 删除禁用时间信息
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deleteStopDateByIds(String ids);

}
