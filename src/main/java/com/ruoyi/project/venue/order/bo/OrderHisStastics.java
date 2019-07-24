package com.ruoyi.project.venue.order.bo;

import com.ruoyi.project.venue.order.domain.OrderStastics;

public class OrderHisStastics {

	private OrderStastics stastics;
	private int[] dataDaySum;
	private int[] dataDayAdultSum;
	private int[] dataDayChildSum;
	public OrderStastics getStastics() {
		return stastics;
	}
	public void setStastics(OrderStastics stastics) {
		this.stastics = stastics;
	}
	public int[] getDataDaySum() {
		return dataDaySum;
	}
	public void setDataDaySum(int[] dataDaySum) {
		this.dataDaySum = dataDaySum;
	}
	public int[] getDataDayAdultSum() {
		return dataDayAdultSum;
	}
	public void setDataDayAdultSum(int[] dataDayAdultSum) {
		this.dataDayAdultSum = dataDayAdultSum;
	}
	public int[] getDataDayChildSum() {
		return dataDayChildSum;
	}
	public void setDataDayChildSum(int[] dataDayChildSum) {
		this.dataDayChildSum = dataDayChildSum;
	}
	
}
