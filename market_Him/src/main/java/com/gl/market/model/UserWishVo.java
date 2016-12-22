package com.gl.market.model;

import java.sql.Date;

public class UserWishVo {
	
	private String wishid;
	private String proid;
	private String customid;
	private String proname;
	private int price;
	private String thumb;
	
	public UserWishVo() {
		// TODO Auto-generated constructor stub
	}

	public UserWishVo(String wishid, String proid, String customid,
			String proname, int price, String thumb) {
		super();
		this.wishid = wishid;
		this.proid = proid;
		this.customid = customid;
		this.proname = proname;
		this.price = price;
		this.thumb = thumb;
	}

	public String getwishid() {
		return wishid;
	}

	public void setwishid(String wishid) {
		this.wishid = wishid;
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
				+ ((wishid == null) ? 0 : wishid.hashCode());
		result = prime * result
				+ ((customid == null) ? 0 : customid.hashCode());
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
		UserWishVo other = (UserWishVo) obj;
		if (wishid == null) {
			if (other.wishid != null)
				return false;
		} else if (!wishid.equals(other.wishid))
			return false;
		if (customid == null) {
			if (other.customid != null)
				return false;
		} else if (!customid.equals(other.customid))
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
		return "UserWishVo [wishid=" + wishid + ", proid=" + proid
				+ ", customid=" + customid + ", proname=" + proname
				+ ", price=" + price + ", thumb=" + thumb + "]";
	}

	
	
}
