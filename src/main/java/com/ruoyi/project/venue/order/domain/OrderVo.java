package com.ruoyi.project.venue.order.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderVo extends Order {
    // 场馆名称
    private String venue_text;

    // 预约类型名称
    private String subscribe_type_text;

    // 预约状态名称
    private String status_text;

    // 日期格式化成字符串
    private String date_format;
}
