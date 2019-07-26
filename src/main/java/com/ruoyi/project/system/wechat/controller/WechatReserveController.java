package com.ruoyi.project.system.wechat.controller;

import com.ruoyi.framework.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/wechat/reserve")
public class WechatReserveController extends BaseController {
    private String prefix = "/system/reserve";

    /**
     * 参观预约
     * @return
     */
    @GetMapping("/doReserve")
    public String doReserve() {
        return prefix + "/doReserve";
    }

    /**
     * 预约查询
     * @return
     */
    @RequestMapping("/query")
    public String checkReserve() {
        return "";
    }

    /**
     * 一键导航
     * @return
     */
    @RequestMapping("/navigate")
    public String navigate() {
        return "";
    }

    /**
     * 留言建议
     * @return
     */
    @RequestMapping("/recommend")
    public String recommend() {
        return "";
    }
}
