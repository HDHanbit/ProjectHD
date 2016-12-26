package com.gl.market.model;

public class OderVO {

	private String orderid;
	private String proid;
	private String customid;
	private int paycash;
	private String payd;
	private String goperson;
	private String cancel;
	private String startday;
	private String trans;
	
	public OderVO() {
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getProid() {
		return proid;
	}

	public void setProid(String proid) {
		this.proid = proid;
	}

	public String getCustomid() {
		return customid;
	}

	public void setCustomid(String customid) {
		this.customid = customid;
	}

	public int getPaycash() {
		return paycash;
	}

	public void setPaycash(int paycash) {
		this.paycash = paycash;
	}

	public String getPayd() {
		return payd;
	}

	public void setPayd(String payd) {
		this.payd = payd;
	}

	public String getGoperson() {
		return goperson;
	}

	public void setGoperson(String goperson) {
		this.goperson = goperson;
	}

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}

	public String getStartday() {
		return startday;
	}

	public void setStartday(String startday) {
		this.startday = startday;
	}

	public String getTrans() {
		return trans;
	}

	public void setTrans(String trans) {
		this.trans = trans;
	}

	@Override
	public String toString() {
		return "OderVO [orderid=" + orderid + ", proid=" + proid
				+ ", customid=" + customid + ", paycash=" + paycash + ", payd="
				+ payd + ", goperson=" + goperson + ", cancel=" + cancel
				+ ", startday=" + startday + ", trans=" + trans + "]";
	}

	public OderVO(String orderid, String proid, String customid, int paycash,
			String payd, String goperson, String cancel, String startday,
			String trans) {
		super();
		this.orderid = orderid;
		this.proid = proid;
		this.customid = customid;
		this.paycash = paycash;
		this.payd = payd;
		this.goperson = goperson;
		this.cancel = cancel;
		this.startday = startday;
		this.trans = trans;
	}
	
	
}
