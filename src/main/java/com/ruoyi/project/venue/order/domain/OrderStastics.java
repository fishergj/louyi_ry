package com.ruoyi.project.venue.order.domain;

public class OrderStastics {
	// 成人人数
	private String orderDt;
	// 星期数字
	private int weekDay;
	// 星期字符串
	private String orderWeeDay;
	// 参观总人数
	private int orderSum;
	// 成人人数
	private int orderAdult;
	// 儿童人数
	private int orderChild;

	public String getOrderDt() {
		return orderDt;
	}

	public void setOrderDt(String orderDt) {
		this.orderDt = orderDt;
	}
	
	public int getWeekDay() {
		return weekDay;
	}

	public void setWeekDay(int weekDay) {
		this.weekDay = weekDay;
	}

	public String getOrderWeeDay() {
		return orderWeeDay;
	}

	public void setOrderWeeDay(String orderWeeDay) {
		this.orderWeeDay = orderWeeDay;
	}

	public int getOrderSum() {
		return orderSum;
	}

	public void setOrderSum(int orderSum) {
		this.orderSum = orderSum;
	}

	public int getOrderAdult() {
		return orderAdult;
	}

	public void setOrderAdult(int orderAdult) {
		this.orderAdult = orderAdult;
	}

	public int getOrderChild() {
		return orderChild;
	}

	public void setOrderChild(int orderChild) {
		this.orderChild = orderChild;
	}
}
