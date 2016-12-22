package com.gl.market.model;

import java.sql.Date;

public class UserOrderVo {
	
	private String orderid;
	private String proid;
	private String customid;
	private int goperson;
	private String payd;
	private int cancel;
	private int paycash;
	private String startday;
	private String trans;
	private String proname;
	private String thumb;
	
	public UserOrderVo() {
		// TODO Auto-generated constructor stub
	}

	public UserOrderVo(String orderid, String proid, String customid,
			int goperson, String payd, int cancel, int paycash,
			String startday, String trans, String proname, String thumb) {
		super();
		this.orderid = orderid;
		this.proid = proid;
		this.customid = customid;
		this.goperson = goperson;
		this.payd = payd;
		this.cancel = cancel;
		this.paycash = paycash;
		this.startday = startday;
		this.trans = trans;
		this.proname = proname;
		this.thumb = thumb;
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

	public int getGoperson() {
		return goperson;
	}

	public void setGoperson(int goperson) {
		this.goperson = goperson;
	}

	public String getPayd() {
		return payd;
	}

	public void setPayd(String payd) {
		this.payd = payd;
	}

	public int getCancel() {
		return cancel;
	}

	public void setCancel(int cancel) {
		this.cancel = cancel;
	}

	public int getPaycash() {
		return paycash;
	}

	public void setPaycash(int paycash) {
		this.paycash = paycash;
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

	public String getProname() {
		return proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cancel;
		result = prime * result
				+ ((customid == null) ? 0 : customid.hashCode());
		result = prime * result + goperson;
		result = prime * result + ((orderid == null) ? 0 : orderid.hashCode());
		result = prime * result + paycash;
		result = prime * result + ((payd == null) ? 0 : payd.hashCode());
		result = prime * result + ((proid == null) ? 0 : proid.hashCode());
		result = prime * result + ((proname == null) ? 0 : proname.hashCode());
		result = prime * result
				+ ((startday == null) ? 0 : startday.hashCode());
		result = prime * result + ((thumb == null) ? 0 : thumb.hashCode());
		result = prime * result + ((trans == null) ? 0 : trans.hashCode());
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
		UserOrderVo other = (UserOrderVo) obj;
		if (cancel != other.cancel)
			return false;
		if (customid == null) {
			if (other.customid != null)
				return false;
		} else if (!customid.equals(other.customid))
			return false;
		if (goperson != other.goperson)
			return false;
		if (orderid == null) {
			if (other.orderid != null)
				return false;
		} else if (!orderid.equals(other.orderid))
			return false;
		if (paycash != other.paycash)
			return false;
		if (payd == null) {
			if (other.payd != null)
				return false;
		} else if (!payd.equals(other.payd))
			return false;
		if (proid == null) {
			if (other.proid != null)
				return false;
		} else if (!proid.equals(other.proid))
			return false;
		if (proname == null) {
			if (other.proname != null)
				return false;
		} else if (!proname.equals(other.proname))
			return false;
		if (startday == null) {
			if (other.startday != null)
				return false;
		} else if (!startday.equals(other.startday))
			return false;
		if (thumb == null) {
			if (other.thumb != null)
				return false;
		} else if (!thumb.equals(other.thumb))
			return false;
		if (trans == null) {
			if (other.trans != null)
				return false;
		} else if (!trans.equals(other.trans))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserOrderVo [orderid=" + orderid + ", proid=" + proid
				+ ", customid=" + customid + ", goperson=" + goperson
				+ ", payd=" + payd + ", cancel=" + cancel + ", paycash="
				+ paycash + ", startday=" + startday + ", trans=" + trans
				+ ", proname=" + proname + ", thumb=" + thumb + "]";
	}
	
}
