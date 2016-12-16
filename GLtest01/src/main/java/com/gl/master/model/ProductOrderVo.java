package com.gl.master.model;

public class ProductOrderVo {

	private int cnt;
	private int maxp;
	private String proid;

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

}
