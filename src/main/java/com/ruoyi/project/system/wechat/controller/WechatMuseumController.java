package com.ruoyi.project.system.wechat.controller;

import com.ruoyi.framework.web.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 场馆介绍
 */
@Controller
@RequestMapping("/wechat/meseum")
public class WechatMuseumController extends BaseController {

    private String prefix = "system/museum";

//    @Autowired
//    private IIntroduceService introduceService;

    /**
     * 场馆概述
     * @return
     */
    @GetMapping("/intro")
    public String introVenue() {
        return prefix + "/intro";
    }

    /**
     * 根据类型获取场馆介绍
     * @param introType
     * @return
     */
//    @GetMapping("/intro/{introType}")
//    @ResponseBody
//    public VenueIntro getVenueIntro(@PathVariable(name="introType") int introType) {
//        return introduceService.selectVenueIntroByType(introType);
//    }

    /**
     * 场馆导览
     * @return
     */
    @RequestMapping("/guide")
    public String guideVenue() {
        return "";
    }

    /**
     * 展品介绍
     * @return
     */
    @RequestMapping("/exhibit")
    public String introExhibit() {
        return "";
    }

    /**
     * 精彩瞬间
     * @return
     */
    @RequestMapping("/moment")
    public String queryMoment() {
        return "";
    }

}
