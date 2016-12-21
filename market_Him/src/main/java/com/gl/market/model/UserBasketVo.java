package com.gl.market.model;

import java.sql.Date;

public class UserBasketVo {
	
	private String basketid;
	private String proid;
	private String customid;
	private Date payd;
	private String proname;
	private int price;
	private String thumb;
	
	public UserBasketVo() {
		// TODO Auto-generated constructor stub
	}

	public UserBasketVo(String basketid, String proid, String customid,
			Date payd, String proname, int price, String thumb) {
		super();
		this.basketid = basketid;
		this.proid = proid;
		this.customid = customid;
		this.payd = payd;
		this.proname = proname;
		this.price = price;
		this.thumb = thumb;
	}

	public String getBasketid() {
		return basketid;
	}

	public void setBasketid(String basketid) {
		this.basketid = basketid;
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

	public Date getPayd() {
		return payd;
	}

	public void setPayd(Date payd) {
		this.payd = payd;
	}

	public String getProname() {
		return proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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
		result = prime * result
				+ ((basketid == null) ? 0 : basketid.hashCode());
		result = prime * result
				+ ((customid == null) ? 0 : customid.hashCode());
		result = prime * result + ((payd == null) ? 0 : payd.hashCode());
		result = prime * result + price;
		result = prime * result + ((proid == null) ? 0 : proid.hashCode());
		result = prime * result + ((proname == null) ? 0 : proname.hashCode());
		result = prime * result + ((thumb == null) ? 0 : thumb.hashCode());
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
		UserBasketVo other = (UserBasketVo) obj;
		if (basketid == null) {
			if (other.basketid != null)
				return false;
		} else if (!basketid.equals(other.basketid))
			return false;
		if (customid == null) {
			if (other.customid != null)
				return false;
		} else if (!customid.equals(other.customid))
			return false;
		if (payd == null) {
			if (other.payd != null)
				return false;
		} else if (!payd.equals(other.payd))
			return false;
		if (price != other.price)
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
		if (thumb == null) {
			if (other.thumb != null)
				return false;
		} else if (!thumb.equals(other.thumb))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserBasketVo [basketid=" + basketid + ", proid=" + proid
				+ ", customid=" + customid + ", payd=" + payd + ", proname="
				+ proname + ", price=" + price + ", thumb=" + thumb + "]";
	}

	
	
}
