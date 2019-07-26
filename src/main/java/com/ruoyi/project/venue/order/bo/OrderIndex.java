package com.ruoyi.project.venue.order.bo;

public class OrderIndex {
	private int auditNum;
	private int messageNum;
	private int[] dataDaySum;
	private int[] dataDayAdultSum;
	private int[] dataDayChildSum;
	private String[] weekDayName;
	public int getAuditNum() {
		return auditNum;
	}
	public void setAuditNum(int auditNum) {
		this.auditNum = auditNum;
	}
	public int getMessageNum() {
		return messageNum;
	}
	public void setMessageNum(int messageNum) {
		this.messageNum = messageNum;
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
	public String[] getWeekDayName() {
		return weekDayName;
	}
	public void setWeekDayName(String[] weekDayName) {
		this.weekDayName = weekDayName;
	}
}
