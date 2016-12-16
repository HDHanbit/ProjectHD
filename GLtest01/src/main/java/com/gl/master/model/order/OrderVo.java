package com.gl.master.model.order;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.jboss.logging.FormatWith;
import org.springframework.web.multipart.MultipartFile;

public class OrderVo {
	/*
	@Range(min=1000)
	private int price;
	
	@Range(min=1)
	private int minp;
	@Range(min=1)
	private int maxp;
	@Pattern(regexp="[0-9]+¹Ú+[1-9]+ÀÏ")
	private String peris;

	@Range(max=1)
	private double discount;
	@Range(min=0,max=10)
	private double point;
	
*/
	private String orderid;
	private String proid;
	private String customid;
	private String payd;
	private int goperson;
	private int cancel;
	private int paycash;
	
	public OrderVo() {
		// TODO Auto-generated constructor stub
	}
	
	public OrderVo(String orderid, String proid, String customid, String payd,
			int goperson, int cancel, int paycash) {
		super();
		this.orderid = orderid;
		this.proid = proid;
		this.customid = customid;
		this.payd = payd;
		this.goperson = goperson;
		this.cancel = cancel;
		this.paycash = paycash;
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
	public String getPayd() {
		return payd;
	}
	public void setPayd(String payd) {
		this.payd = payd;
	}
	public int getGoperson() {
		return goperson;
	}
	public void setGoperson(int goperson) {
		this.goperson = goperson;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((customid == null) ? 0 : customid.hashCode());
		result = prime * result + ((orderid == null) ? 0 : orderid.hashCode());
		result = prime * result + ((proid == null) ? 0 : proid.hashCode());
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
		OrderVo other = (OrderVo) obj;
		if (customid == null) {
			if (other.customid != null)
				return false;
		} else if (!customid.equals(other.customid))
			return false;
		if (orderid == null) {
			if (other.orderid != null)
				return false;
		} else if (!orderid.equals(other.orderid))
			return false;
		if (proid == null) {
			if (other.proid != null)
				return false;
		} else if (!proid.equals(other.proid))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "OrderVo [orderid=" + orderid + ", proid=" + proid
				+ ", customid=" + customid + ", payd=" + payd + ", goperson="
				+ goperson + ", cancel=" + cancel + ", paycash=" + paycash
				+ "]";
	}
	
	

}
