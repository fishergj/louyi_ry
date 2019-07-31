package com.ruoyi.project.system.wechat.domain;

import lombok.Data;

@Data
public class TicketToken {
    private int errcode;
    private String errmsg;
    private String ticket;
    private String expires_in;
}
