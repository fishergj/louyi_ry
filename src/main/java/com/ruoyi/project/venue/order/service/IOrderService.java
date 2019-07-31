package com.ruoyi.project.venue.order.service;

import com.ruoyi.project.system.wechat.domain.Comment;
import com.ruoyi.project.venue.order.domain.Order;
import com.ruoyi.project.venue.order.domain.OrderVo;

import java.util.List;

public interface IOrderService {

	String checkCancel(int id);
	  
    public String insert(Order order);

    List<Order> getNormalOrderByWno(String w_no);

    // 当前时段有多少已预约
    int getValidCountByTimeId(int subscribe_time_id);

    int insertComment(Comment comment);

    List<OrderVo> getNormalOrderVoByWno(String w_no);

    int cancelReserveById(int id);
}
