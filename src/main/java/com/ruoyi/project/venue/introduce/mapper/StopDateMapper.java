package com.ruoyi.project.venue.introduce.mapper;

import java.util.List;

import com.ruoyi.project.venue.introduce.domain.StopDate;

/**
 * 禁用时间 数据层
 * 
 * @author jungao
 * @date Dec 14, 2018 2:03:15 PM
 */
public interface StopDateMapper {
	/**
	 * 查询禁用时间列表
	 * 
	 * @param venueIntro
	 *            禁用时间信息
	 * @return 禁用时间集合
	 */
	public List<StopDate> selectStopDateList(StopDate stopDate);
	
	/**
	 * 获取当前时间有效禁用时间段
	 * @return
	 */
	public List<StopDate>  selectValidStopDateList();
	/**
	 * 新增禁用时间
	 * 
	 * @param venueIntro
	 *            禁用时间信息
	 * @return 结果
	 */
	public int insertStopDate(StopDate stopDate);


	/**
	 * 批量删除禁用时间
	 * 
	 * @param venueIntroIds
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deleteStopDateByIds(String[] ids);
}