package com.gl.master.model;

public class ProductOrderVo {

	private int cnt;
	private int maxp;
	private String proid;
	private String startday;
	private String trans;

	public ProductOrderVo(String proid, String startday, String trans) {
		super();
		this.proid = proid;
		this.startday = startday;
		this.trans = trans;
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getMaxp() {
		return maxp;
	}

	public void setMaxp(int maxp) {
		this.maxp = maxp;
	}

	public String getProid() {
		return proid;
	}

	public void setProid(String proid) {
		this.proid = proid;
	}

	public ProductOrderVo() {
		// TODO Auto-generated constructor stub
	}

	public ProductOrderVo(int cnt, int maxp, String proid) {
		super();

		this.cnt = cnt;
		this.maxp = maxp;
		this.proid = proid;
	}

	public ProductOrderVo(int cnt, int maxp, String proid, String startday,
			String trans) {
		super();
		this.cnt = cnt;
		this.maxp = maxp;
		this.proid = proid;
		this.startday = startday;
		this.trans = trans;
	}
	

}
