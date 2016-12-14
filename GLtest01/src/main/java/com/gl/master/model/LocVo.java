package com.gl.master.model;

public class LocVo {
	private String loccode;
	private String locname;
	private String catcode;
	private String code;
	private String name;

	public LocVo() {
		// TODO Auto-generated constructor stub
	}

	public LocVo(String loccode, String locname, String catcode, String code,
			String name) {
		super();
		this.loccode = loccode;
		this.locname = locname;
		this.catcode = catcode;
		this.code = code;
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((catcode == null) ? 0 : catcode.hashCode());
		result = prime * result + ((loccode == null) ? 0 : loccode.hashCode());
		result = prime * result + ((locname == null) ? 0 : locname.hashCode());
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
		LocVo other = (LocVo) obj;
		if (catcode == null) {
			if (other.catcode != null)
				return false;
		} else if (!catcode.equals(other.catcode))
			return false;
		if (loccode == null) {
			if (other.loccode != null)
				return false;
		} else if (!loccode.equals(other.loccode))
			return false;
		if (locname == null) {
			if (other.locname != null)
				return false;
		} else if (!locname.equals(other.locname))
			return false;
		return true;
	}

	public String getLoccode() {
		return loccode;
	}

	public void setLoccode(String loccode) {
		this.loccode = loccode;
	}

	public String getLocname() {
		return locname;
	}

	public void setLocname(String locname) {
		this.locname = locname;
	}

	public String getCatcode() {
		return catcode;
	}

	public void setCatcode(String catcode) {
		this.catcode = catcode;
	}

	@Override
	public String toString() {
		return "LocVo [loccode=" + loccode + ", locname=" + locname
				+ ", catcode=" + catcode + "]";
	}

}
