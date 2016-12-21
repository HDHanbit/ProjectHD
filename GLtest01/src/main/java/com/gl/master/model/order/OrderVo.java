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

	private String orderid;
	private String proid;
	private String customid;
	private String payd;
	private int goperson;
	private int cancel;
	private int paycash;
	private String startday;
	private String trans;
	
	public OrderVo() {
		// TODO Auto-generated constructor stub
	}
	

	public OrderVo(String orderid, String customid, String payd, int goperson) {
		super();
		this.orderid = orderid;
		this.customid = customid;
		this.payd = payd;
		this.goperson = goperson;
	}


	public OrderVo(String orderid, String proid, String customid, String payd,
			int goperson, int cancel, int paycash, String startday, String trans) {
		super();
		this.orderid = orderid;
		this.proid = proid;
		this.customid = customid;
		this.payd = payd;
		this.goperson = goperson;
		this.cancel = cancel;
		this.paycash = paycash;
		this.startday = startday;
		this.trans = trans;
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((customid == null) ? 0 : customid.hashCode());
		result = prime * result + ((orderid == null) ? 0 : orderid.hashCode());
		result = prime * result
				+ ((startday == null) ? 0 : startday.hashCode());
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
		if (startday == null) {
			if (other.startday != null)
				return false;
		} else if (!startday.equals(other.startday))
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
		return "OrderVo [orderid=" + orderid + ", proid=" + proid
				+ ", customid=" + customid + ", payd=" + payd + ", goperson="
				+ goperson + ", cancel=" + cancel + ", paycash=" + paycash
				+ ", startday=" + startday + ", trans=" + trans + "]";
	}
	
	
	

}
