package com.ruoyi.project.system.wechat.controller;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.DateUtil;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.framework.config.WechatConfig;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.system.wechat.domain.Comment;
import com.ruoyi.project.system.wechat.util.WechatFinalValue;
import com.ruoyi.project.venue.introduce.domain.Venue;
import com.ruoyi.project.venue.introduce.service.IIntroduceService;
import com.ruoyi.project.venue.order.domain.Order;
import com.ruoyi.project.venue.order.domain.OrderVo;
import com.ruoyi.project.venue.order.domain.SubscribeTime;
import com.ruoyi.project.venue.order.service.IOrderService;
import com.ruoyi.project.venue.order.service.ISubscribeDetailService;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/wechat")
public class WechatReserveController extends BaseController {
    private String prefix = "/system/reserve";

    @Autowired
    private ISubscribeDetailService subscribeDetailService;

    @Autowired
    private IOrderService orderService;

    @Autowired
    private IIntroduceService introduceService;

    @GetMapping("/reserve")
    public String reserve(HttpServletRequest request, HttpSession session) {
        // 获取OpenID
//        String code = request.getParameter("code");
//        String openId = getOpenid(code);
//        session.setAttribute("RESERVE_OPENID", openId);
        session.setAttribute("RESERVE_OPENID", "ofRfutyLry4QAZ7Xk0FtKpicBqfo");
        return prefix + "/reserve";
    }

    @PostMapping("/reserve")
    @ResponseBody
    public AjaxResult reserve(Order order, HttpSession session) {
        AjaxResult ajaxResult = null;
        String w_no = session.getAttribute("RESERVE_OPENID").toString();
        order.setW_no(w_no);
        int subscribeNum = order.getAdult() + order.getChild();
        // 查看当前是否有有效预约
        List<Order> validOrder = orderService.getNormalOrderByWno(w_no);
        if (validOrder != null && validOrder.size() > 0) {
            ajaxResult = new AjaxResult(AjaxResult.Type.NONE, "您有待进行的预约行程，请先取消或稍后再行预约！", order);
            return ajaxResult;
        }
        // 查看时段当前已有参观人数
        int validCount = orderService.getValidCountByTimeId(order.getSubscribe_time_id());
        if (subscribeNum + validCount > 100) {
            ajaxResult = new AjaxResult(AjaxResult.Type.NONE, "当前预约人数超过展馆接待量，请选择其他时段进行预约！", order);
            return ajaxResult;
        }

        order.setSubscribe_num(subscribeNum);
        if (subscribeNum < 10) {
            order.setSubscribe_type("1");
        } else {
            order.setSubscribe_type("2");
        }
        order.setStatus("1"); // 待审核
        Date subscribeDate = subscribeDetailService.selectFromDtById(order.getSubscribe_time_id());
        order.setInput_time(subscribeDate);
        order.setCreate_time(new Date());
        orderService.insert(order);
        ajaxResult = new AjaxResult(AjaxResult.Type.SUCCESS, "您已成功预约，请按预约时间准时参观！");
        return AjaxResult.success(ajaxResult);
    }

    @GetMapping("/venues")
    @ResponseBody
    public List<Venue> selectAllVenues() {
        return introduceService.selectAllVenues();
    }

    @GetMapping("/reserve_list")
    public String reserve_list(HttpServletRequest request, HttpSession session, Model model) {
        // 获取OpenID
//        String code = request.getParameter("code");
//        String openId = getOpenid(code);
//        session.setAttribute("RESERVE_OPENID", openId);
        session.setAttribute("RESERVE_OPENID", "ofRfutyLry4QAZ7Xk0FtKpicBqfo");
        String w_no = "";
        List<OrderVo> orderVos = null;
        if (session.getAttribute("RESERVE_OPENID") != null) {
            w_no = session.getAttribute("RESERVE_OPENID").toString();
            orderVos = orderService.getNormalOrderVoByWno(w_no);
            for (int i = 0; i < orderVos.size(); i++) {
                orderVos.get(i).setDate_format(DateUtil.dateToStr(orderVos.get(i).getInput_time()));
            }
        }
        model.addAttribute("orderVos", orderVos);
        return prefix + "/reserveList";
    }

    @PostMapping("/reserve_list")
    @ResponseBody
    public AjaxResult reserve_list(HttpSession session) {
        AjaxResult ajaxResult = null;
        String w_no = "";
        if (session.getAttribute("RESERVE_OPENID") != null) {
            w_no = session.getAttribute("RESERVE_OPENID").toString();
            List<OrderVo> orders = orderService.getNormalOrderVoByWno(w_no);
            if (orders != null) {
                ajaxResult = new AjaxResult(AjaxResult.Type.SUCCESS, "", orders);
            } else {
                ajaxResult = new AjaxResult(AjaxResult.Type.NONE, "您没有预约记录！");
            }
        } else {
            ajaxResult = new AjaxResult(AjaxResult.Type.ERROR, "请从公众号菜单进行访问");
        }
        return ajaxResult;
    }

    @PostMapping("/reserve_cancel")
    public AjaxResult reserve_cancel(@PathVariable("w_no") String w_no) {
        int ret = orderService.cancelReserveByWno(w_no);
        return new AjaxResult(AjaxResult.Type.SUCCESS, "预约取消成功！");
    }

    @GetMapping("/msg")
    public String msg() {
        return prefix + "/msg";
    }

    /**
     * 参观预约
     * @return
     */
    @GetMapping("/doReserve/{sec}")
    public String reserveInit(HttpServletRequest request, HttpSession session, @PathVariable("sec") String sec) throws IOException {
//        String code = request.getParameter("code");
//        String openId = getOpenid(code);
//        session.setAttribute("RESERVE_OPENID", openId);
        session.setAttribute("RESERVE_OPENID", "ofRfutyLry4QAZ7Xk0FtKpicBqfo");
        session.setAttribute("RESERVE_SEC", sec);
        return prefix + "/doReserve";
    }

    @PostMapping("/doReserve")
    @ResponseBody
    public AjaxResult doReserve(Order order, HttpSession session) {
        order.setW_no(session.getAttribute("RESERVE_OPENID").toString());
        int subscribeNum = order.getAdult() + order.getChild();
        order.setSubscribe_num(subscribeNum);
        if (subscribeNum < 10) {
            order.setSubscribe_type("1");
        } else {
            order.setSubscribe_type("2");
        }
        order.setStatus("1"); // 待审核

        Date subscribeDate = subscribeDetailService.selectFromDtById(order.getSubscribe_time_id());
        order.setInput_time(subscribeDate);
        order.setCreate_time(new Date());
        String message = orderService.insert(order);
        return AjaxResult.success(message);
    }

    @GetMapping("/reserveQuery")
    @ResponseBody
    public AjaxResult doQuery(HttpSession session) {
        AjaxResult ajaxResult = null;
        String w_no = "";
        if (session.getAttribute("RESERVE_OPENID") != null) {
            w_no = session.getAttribute("RESERVE_OPENID").toString();
            List<Order> order = orderService.getNormalOrderByWno(w_no);
            if (order != null) {
                ajaxResult = new AjaxResult(AjaxResult.Type.NONE, "当前存在有效预约记录", order);
            } else {
                ajaxResult = new AjaxResult(AjaxResult.Type.SUCCESS, "当前无有效预约记录");
            }
        } else {
            ajaxResult = new AjaxResult(AjaxResult.Type.ERROR, "请从公众号菜单进行访问");
        }
        return ajaxResult;
    }

    @GetMapping("/getReserveTime")
    @ResponseBody
    public List<SubscribeTime> getSubscribeTimeList(Integer subscribe_num) {
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        c.add(Calendar.DATE, 3);
        List<SubscribeTime> subscribeTimes = subscribeDetailService.getInvalidDateList(subscribe_num, c.getTime(),true);
        return subscribeTimes;
    }

    /**
     * 一键导航
     * @return
     */
    @RequestMapping("/navigate")
    public String navigate() {
        return prefix + "/navigate";
    }

    @GetMapping("/comment")
    public String comment(HttpServletRequest request, HttpSession session) {
//        String code = request.getParameter("code");
//        String openId = getOpenid(code);
//        session.setAttribute("RESERVE_OPENID", openId);
        session.setAttribute("RESERVE_OPENID", "ofRfutyLry4QAZ7Xk0FtKpicBqfo");
        return prefix + "/comment";
    }

    @PostMapping("/comment")
    @ResponseBody
    public AjaxResult comment(Comment comment, HttpSession session) {
        AjaxResult ajaxResult = null;
        String w_no = "";
        if (session.getAttribute("RESERVE_OPENID") != null) {
            w_no = session.getAttribute("RESERVE_OPENID").toString();
            comment.setW_no(w_no);
            comment.setInput_time(new Date());
            comment.setStatus("1");
            comment.setCreate_time(new Date());
            orderService.insertComment(comment);
            ajaxResult = new AjaxResult(AjaxResult.Type.SUCCESS, "感谢您的建议留言！");
        } else {
            ajaxResult = new AjaxResult(AjaxResult.Type.WARN, "请从公众号菜单进行访问！");
        }
        return ajaxResult;
    }

    /**
     * 返回用户OpenId
     * @param code 应用授权作用域返回值
     * @return
     * @throws IOException
     */
    private String getOpenid(String code) throws IOException {
        WechatConfig wechatConfig = (WechatConfig) SpringUtils.getBean("wechatConfig");
        String url = WechatFinalValue.AUTH_GET_OID;
        url = url.replace("APPID", wechatConfig.getAppID());
        url = url.replace("SECRET", wechatConfig.getAppsecret());
        url = url.replace("CODE", code);

        CloseableHttpClient client = HttpClients.createDefault();
        HttpGet get = new HttpGet(url);
        CloseableHttpResponse resp = client.execute(get);
        int sc = resp.getStatusLine().getStatusCode();
        String content = EntityUtils.toString(resp.getEntity());

        JSONObject jsonObj = JSONObject.parseObject(content);
        String openid = null;
        if (jsonObj.containsKey("openid")) {
            openid = jsonObj.getString("openid");
        }
        return openid;
    }
}
