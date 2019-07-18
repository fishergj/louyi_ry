package com.ruoyi.project.venue.orderaudit.bo;

import java.util.Date;

public class OrderauditSearchBo {
	// 预约人姓名 
		private String name;
		// 预约人电话 
		private String telephone;
		// 预约类型（1-个人；2-团体） 
		private String subscribe_type;
		// 预约状态(1-待审核；2-用户撤销；3-驳回；4-强制更改；5-审核通过) 
		private String status;
		// 开始时间
		private Date startTime;
		// 结束时间
		private Date endTime;
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
		public String getSubscribe_type() {
			return subscribe_type;
		}
		public void setSubscribe_type(String subscribe_type) {
			this.subscribe_type = subscribe_type;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public Date getStartTime() {
			return startTime;
		}
		public void setStartTime(Date startTime) {
			this.startTime = startTime;
		}
		public Date getEndTime() {
			return endTime;
		}
		public void setEndTime(Date endTime) {
			this.endTime = endTime;
		}	
}
