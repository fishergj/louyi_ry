package com.ruoyi.project.venue.order.service;

import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.project.system.wechat.domain.Comment;
import com.ruoyi.project.venue.order.domain.Order;
import com.ruoyi.project.venue.order.domain.OrderVo;
import com.ruoyi.project.venue.order.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public String insert(Order order) {
        int ret = orderMapper.insert(order);
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        if (ret > 0) {
            successMsg.append("您已预约成功！");
        } else {
            failureMsg.append("预约失败，请重试！");
            throw new BusinessException(failureMsg.toString());
        }
        return successMsg.toString();
    }

    @Override
    public List<Order> getNormalOrderByWno(String w_no) {
        return orderMapper.getNormalOrderByWno(w_no);
    }

    @Override
    public int getValidCountByTimeId(int subscribe_time_id) {
        return orderMapper.getValidCountByTimeId(subscribe_time_id);
    }

    @Override
    public int insertComment(Comment comment) {
        return orderMapper.insertComment(comment);
    }

    @Override
    public List<OrderVo> getNormalOrderVoByWno(String w_no) {
        return orderMapper.getNormalOrderVoByWno(w_no);
    }

    @Override
    public int cancelReserveById(int id) {
        return orderMapper.cancelReserveById(id);
    }
}
