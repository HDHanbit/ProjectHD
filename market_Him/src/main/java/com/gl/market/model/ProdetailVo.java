package com.gl.market.model;

public class ProdetailVo {

	private String proid;
	private String startday; 
	private String trans;
	
	public ProdetailVo() {
	}

	public String getProid() {
		return proid;
	}

	public void setProid(String proid) {
		this.proid = proid;
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
		return "Prodetail [proid=" + proid + ", startday=" + startday
				+ ", trans=" + trans + "]";
	}

	public ProdetailVo(String proid, String startday, String trans) {
		super();
		this.proid = proid;
		this.startday = startday;
		this.trans = trans;
	}
	
	
	
	
}
