package com.gl.master.model.coupon;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;

public class CouponVo {
	
	private String cupid;
	private String cupname;
	@Range(max=1)
	private double percent;
	private String customid;
	private String cupperi;
	
	public CouponVo() {
		// TODO Auto-generated constructor stub
	}

	public CouponVo(String cupid, String cupname, double percent, String customid,
			String cupperi) {
		super();
		this.cupid = cupid;
		this.cupname = cupname;
		this.percent = percent;
		this.customid = customid;
		this.cupperi = cupperi;
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

	public double getPercent() {
		return percent;
	}

	public void setPercent(double percent) {
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cupid == null) ? 0 : cupid.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CouponVo other = (CouponVo) obj;
		if (cupid == null) {
			if (other.cupid != null)
				return false;
		} else if (!cupid.equals(other.cupid))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CouponVo [cupid=" + cupid + ", cupname=" + cupname
				+ ", percent=" + percent + ", customid=" + customid
				+ ", cupperi=" + cupperi + "]";
	}
	
	

}
