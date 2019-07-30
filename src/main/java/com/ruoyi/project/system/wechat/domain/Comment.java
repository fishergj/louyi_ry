package com.ruoyi.project.system.wechat.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
public class Comment implements Serializable {

    private Long id;

    private String w_no;

    private String suggest;

    private Date input_time;

    private String status;

    private String oper_id;

    private String feedback;

    private Date feedback_time;

    private Date create_time;

    private Date update_time;
}
