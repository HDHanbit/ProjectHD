package com.gl.master.model.product;

public class ProDetailVo {
	private String proid;
	private String startday;
	private String trans;
	public ProDetailVo() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "ProDetailVo [proid=" + proid + ", startday=" + startday
				+ ", trans=" + trans + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
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
		ProDetailVo other = (ProDetailVo) obj;
		if (proid == null) {
			if (other.proid != null)
				return false;
		} else if (!proid.equals(other.proid))
			return false;
		return true;
	}

	public ProDetailVo(String proid, String startday, String trans) {
		super();
		this.proid = proid;
		this.startday = startday;
		this.trans = trans;
	}

	public String getProid() {
		return proid;
	}
	public void setProid(String proid) {
		this.proid = proid;
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
	

}
