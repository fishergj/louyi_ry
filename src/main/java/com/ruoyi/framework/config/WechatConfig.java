package com.ruoyi.framework.config;

import com.ruoyi.project.system.wechat.domain.AccessToken;
import com.ruoyi.project.system.wechat.domain.TicketToken;
import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * 微信配置
 *
 * @author jungao
 * @date Dec 14, 2018 4:05:41 PM
 */
@Data
@Configuration
public class WechatConfig {
    @Value("${spring.wechat.appID}")
    private String appID;

    @Value("${spring.wechat.appsecret}")
    private String appsecret;

    @Value("${spring.wechat.base_url}")
    private String baseUrl;

    @Value("${spring.wechat.wechat_token}")
    private String token;

    private AccessToken accessToken;

    private TicketToken ticketToken;
}
