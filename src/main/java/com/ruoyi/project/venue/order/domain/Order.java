package com.ruoyi.project.venue.order.domain;

import java.util.Date;

import com.ruoyi.framework.web.domain.BaseEntity;

public class Order extends BaseEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// ID 
	private int id;
	// 预约人姓名 
	private String name;
	// 预约人电话 
	private String telephone;
	// 微信名 
	private String w_no;
	// 成人人数 
	private int adult;
	// 儿童人数 
	private int child;
	// 参观总人数 
	private int subscribe_num;
	// 预约类型（1-个人；2-团体） 
	private String subscribe_type;
	// 预约时间 
	private int subscribe_time_id;
	// 预约场馆 Id
	private int venue;
	// 预约场馆 名称
	private String venueName;
	// 备注(情况说明，如单位名) 
	private String remark;
	// 用户预约录入时间 
	private Date input_time;
	// 预约状态(1-待审核；2-用户撤销；3-驳回；4-强制更改；5-审核通过) 
	private String status;
	// 审核人 
	private String auditor;
	// 审核录入时间 
	private Date audit_time;
	// 更改原因 
	private String alter_reason;
	// 创建时间 
	private Date create_time;
	// 更新时间 
	private Date update_time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getW_no() {
		return w_no;
	}
	public void setW_no(String w_no) {
		this.w_no = w_no;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
	public int getSubscribe_num() {
		return subscribe_num;
	}
	public void setSubscribe_num(int subscribe_num) {
		this.subscribe_num = subscribe_num;
	}
	public String getSubscribe_type() {
		return subscribe_type;
	}
	public void setSubscribe_type(String subscribe_type) {
		this.subscribe_type = subscribe_type;
	}
	public int getSubscribe_time_id() {
		return subscribe_time_id;
	}
	public void setSubscribe_time_id(int subscribe_time_id) {
		this.subscribe_time_id = subscribe_time_id;
	}
	public int getVenue() {
		return venue;
	}
	public void setVenue(int venue) {
		this.venue = venue;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getInput_time() {
		return input_time;
	}
	public void setInput_time(Date input_time) {
		this.input_time = input_time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAuditor() {
		return auditor;
	}
	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}
	public Date getAudit_time() {
		return audit_time;
	}
	public void setAudit_time(Date audit_time) {
		this.audit_time = audit_time;
	}
	public String getAlter_reason() {
		return alter_reason;
	}
	public void setAlter_reason(String alter_reason) {
		this.alter_reason = alter_reason;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	public String getVenueName() {
		return venueName;
	}
	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}
}
