package com.ruoyi.project.system.wechat.mapper;

import com.ruoyi.project.system.wechat.domain.Hyt;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WeatherMapper {
	
	List<Hyt> queryHytList();

	Hyt showHytLast(@Param("imei") String imei);

	List<Hyt> showHyt24(@Param("imei") String imei);

}
