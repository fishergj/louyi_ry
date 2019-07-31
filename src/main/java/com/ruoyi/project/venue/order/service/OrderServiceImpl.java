package com.ruoyi.project.venue.order.service;

import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.DateUtil;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.project.system.wechat.domain.Comment;
import com.ruoyi.project.venue.order.domain.Order;
import com.ruoyi.project.venue.order.domain.OrderVo;
import com.ruoyi.project.venue.order.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private OrderMapper orderMapper;
	@Autowired
    private RuoYiConfig ruoYiConfig;

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
    @Override
	public String checkCancel(int id) {
		Order order = orderMapper.selectOrder(id);
		Date orderDt = order.getInput_time();
		Date currentdt = null;
		try {
			currentdt = DateUtil.parse(DateUtil.getNowTime("yyyy-MM-dd"), "yyyy-MM-dd");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int days = DateUtil.getBetweenDays(currentdt, orderDt);
		if(days < ruoYiConfig.getPreReserveDay()){
			return "不可以取消预约，需要提前" +ruoYiConfig.getPreReserveDay() + "天取消！";
		}
		return "";
	}
}
