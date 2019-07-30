package com.ruoyi.project.venue.introduce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.common.support.Convert;
import com.ruoyi.project.venue.introduce.domain.StopDate;
import com.ruoyi.project.venue.introduce.mapper.StopDateMapper;

/**
 * 场馆介绍 服务层实现
 * 
 * @author jungao
 * @date Dec 14, 2018 2:03:48 PM
 */
@Service
public class StopDateServiceImpl implements IStopDateService {
	@Autowired
	private StopDateMapper stopDateMapper;
	


	/**
	 * 查询场馆介绍列表
	 * 
	 * @param stopdate
	 *            场馆介绍信息
	 * @return 场馆介绍集合
	 */
	@Override
	public List<StopDate> selectStopDateList(StopDate stopdate) {
		return stopDateMapper.selectStopDateList(stopdate);
	}

	/**
	 * 新增场馆介绍
	 * 
	 * @param stopdate
	 *            场馆介绍信息
	 * @return 结果
	 */
	@Override
	public int insertStopDate(StopDate stopdate) {
		
		return stopDateMapper.insertStopDate(stopdate);
	}

	

	/**
	 * 删除场馆介绍对象
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	@Override
	public int deleteStopDateByIds(String ids) {
		return stopDateMapper.deleteStopDateByIds(Convert.toStrArray(ids));
	}

}
