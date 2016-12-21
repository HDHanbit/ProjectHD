package com.gl.market.model;

import java.sql.Date;

public class UserCopVo {
	
	private String cupid;
	private String cupname;
	private int percent;
	private String customid;
	private String cupperi;
	
	public UserCopVo() {
		// TODO Auto-generated constructor stub
	}

	public UserCopVo(String cupid, String cupname, int percent,
			String customid, String cupperi) {
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cupid == null) ? 0 : cupid.hashCode());
		result = prime * result + ((cupname == null) ? 0 : cupname.hashCode());
		result = prime * result + ((cupperi == null) ? 0 : cupperi.hashCode());
		result = prime * result
				+ ((customid == null) ? 0 : customid.hashCode());
		result = prime * result + percent;
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
		UserCopVo other = (UserCopVo) obj;
		if (cupid == null) {
			if (other.cupid != null)
				return false;
		} else if (!cupid.equals(other.cupid))
			return false;
		if (cupname == null) {
			if (other.cupname != null)
				return false;
		} else if (!cupname.equals(other.cupname))
			return false;
		if (cupperi == null) {
			if (other.cupperi != null)
				return false;
		} else if (!cupperi.equals(other.cupperi))
			return false;
		if (customid == null) {
			if (other.customid != null)
				return false;
		} else if (!customid.equals(other.customid))
			return false;
		if (percent != other.percent)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserCopVo [cupid=" + cupid + ", cupname=" + cupname
				+ ", percent=" + percent + ", customid=" + customid
				+ ", cupperi=" + cupperi + "]";
	}
	
	
	
	

	
	
}
