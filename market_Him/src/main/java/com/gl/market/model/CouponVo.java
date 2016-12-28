package com.gl.market.model;

public class CouponVo {
 
	private String cupid;
	private String cupname;
	private int percent;
	private String customid;
	private String cupperi;
	
	public CouponVo() {
	}

	public String getCupid() {
		return cupid;
	}

	public void setCupid(String cupid) {
		this.cupid = cupid;
	}

	public String getCupname() {
		return cupname;
	}

	public void setCupname(String cupname) {
		this.cupname = cupname;
	}

	public int getPercent() {
		return percent;
	}

	public void setPercent(int percent) {
		this.percent = percent;
	}

	public String getCustomid() {
		return customid;
	}

	public void setCustomid(String customid) {
		this.customid = customid;
	}

	public String getCupperi() {
		return cupperi;
	}

	public void setCupperi(String cupperi) {
		this.cupperi = cupperi;
	}

	@Override
	public String toString() {
		return "CouponVo [cupid=" + cupid + ", cupname=" + cupname
				+ ", percent=" + percent + ", customid=" + customid
				+ ", cupperi=" + cupperi + "]";
	}

	public CouponVo(String cupid, String cupname, int percent, String customid,
			String cupperi) {
		super();
		this.cupid = cupid;
		this.cupname = cupname;
		this.percent = percent;
		this.customid = customid;
		this.cupperi = cupperi;
	}
	
	
	
	
}