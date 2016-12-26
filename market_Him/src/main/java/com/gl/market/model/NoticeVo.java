package com.gl.market.model;

import java.sql.Date;


public class NoticeVo {
	 private String notid;
	 private String notitle ;
	 private String notcontent;
	 private String notfile;
	 private Date notday;
	
	 public NoticeVo() {
		// TODO Auto-generated constructor stub
	}
	 
	 public String getNotid() {
		return notid;
	}
	public void setNotid(String notid) {
		this.notid = notid;
	}
	public String getNotitle() {
		return notitle;
	}
	public void setNotitle(String notitle) {
		this.notitle = notitle;
	}
	public String getNotcontent() {
		return notcontent;
	}
	public void setNotcontent(String notcontent) {
		this.notcontent = notcontent;
	}
	public String getNotfile() {
		return notfile;
	}
	public void setNotfile(String notfile) {
		this.notfile = notfile;
	}
	public Date getNotday() {
		return notday;
	}
	public void setNotday(Date notday) {
		this.notday = notday;
	}
	@Override
	public String toString() {
		return "NoticeVo [notid=" + notid + ", notitle=" + notitle
				+ ", notcontent=" + notcontent + ", notfile=" + notfile
				+ ", notday=" + notday + "]";
	}
	public NoticeVo(String notid, String notitle, String notcontent,
			String notfile, Date notday) {
		super();
		this.notid = notid;
		this.notitle = notitle;
		this.notcontent = notcontent;
		this.notfile = notfile;
		this.notday = notday;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((notcontent == null) ? 0 : notcontent.hashCode());
		result = prime * result + ((notday == null) ? 0 : notday.hashCode());
		result = prime * result + ((notfile == null) ? 0 : notfile.hashCode());
		result = prime * result + ((notid == null) ? 0 : notid.hashCode());
		result = prime * result + ((notitle == null) ? 0 : notitle.hashCode());
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
		NoticeVo other = (NoticeVo) obj;
		if (notcontent == null) {
			if (other.notcontent != null)
				return false;
		} else if (!notcontent.equals(other.notcontent))
			return false;
		if (notday == null) {
			if (other.notday != null)
				return false;
		} else if (!notday.equals(other.notday))
			return false;
		if (notfile == null) {
			if (other.notfile != null)
				return false;
		} else if (!notfile.equals(other.notfile))
			return false;
		if (notid == null) {
			if (other.notid != null)
				return false;
		} else if (!notid.equals(other.notid))
			return false;
		if (notitle == null) {
			if (other.notitle != null)
				return false;
		} else if (!notitle.equals(other.notitle))
			return false;
		return true;
	}
	
	 
	

	
	
	
	
	
}
