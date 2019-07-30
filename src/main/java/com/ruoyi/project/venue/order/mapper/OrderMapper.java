package com.ruoyi.project.venue.order.mapper;

import java.util.HashMap;
import java.util.List;

import com.ruoyi.project.system.wechat.domain.Comment;
import com.ruoyi.project.venue.order.bo.OrderResultBo;
import com.ruoyi.project.venue.order.domain.Order;
import com.ruoyi.project.venue.order.domain.OrderStastics;
import com.ruoyi.project.venue.order.domain.OrderVo;
import org.apache.ibatis.annotations.Param;


public interface OrderMapper {
	public int insert(Order order);

	/**
	 * 查询预约记录列表
	 * @param bo
	 * @return
	 */
	public List<Order>  selectOrderList(Order bo);
	
	/**
	 * 根据Id获取信息
	 * @param id
	 * @return
	 */
	public OrderResultBo getOrderById(long id);
	
	/**
	 * 查看预约明细记录
	 * @param id
	 * @return
	 */
	public Order selectOrder(int id);
	
	/**
	 * 更新状态
	 * @param map
	 * @return
	 */
	public int updateStatus(HashMap<String,Object> map);
	
	/**
	 * 强制更改时间段
	 * @param bo
	 * @return
	 */
	public int updateOrderTime(OrderResultBo bo);
	
	/**
	 * 统计人数
	 */
	public List<OrderStastics> selectOrderStasticsList(Order order);
	
	/**
	 * 统计历史人数
	 * @param order
	 * @return
	 */
	public OrderStastics selectHisOrderStastics(Order order);
	
	/**
	 * 按星期统计历史数据
	 * @param order
	 * @return
	 */
	public List<OrderStastics> selectHisOrderStasticsByWeek(Order order);
	
	/**
	 * 按星期统计未来一个星期的数据
	 * @param map
	 * @return
	 */
	public List<OrderStastics> selectNextOrderStasticsByWeek(HashMap<String,Object> map);
	
	/**
	 * 获取待审核的预约数
	 * @return
	 */
	public int selectWaiteAuditCount();
	
	/**
	 * 某一个时间段预约总人数
	 * @param id
	 * @return
	 */
	public int selectSubscribePerson(int id);

	/**
	 * 根据公众号openid查询当前有效预约
	 * @param w_no
	 * @return
	 */
	List<Order> getNormalOrderByWno(@Param("w_no") String w_no);

	int getValidCountByTimeId(@Param("subscribe_time_id") int subscribe_time_id);

	int insertComment(Comment comment);

    List<OrderVo> getNormalOrderVoByWno(String w_no);

	int cancelReserveByWno(@Param("w_no") String w_no);
}
