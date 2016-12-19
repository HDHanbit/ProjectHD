package com.gl.master.model.notice;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVo {
	
	private String notid;
	private String notitle;
	private String notcontent;
	private String notfile;
	private String notday;
	private MultipartFile notF;
	
	public NoticeVo() {
		// TODO Auto-generated constructor stub
	}
	
	public NoticeVo(String notid, String notitle, String notcontent,
			String notfile, String notday, MultipartFile notF) {
		super();
		this.notid = notid;
		this.notitle = notitle;
		this.notcontent = notcontent;
		this.notfile = notfile;
		this.notday = notday;
		this.notF = notF;
	}




	public String getNotday() {
		return notday;
	}

	public void setNotday(String notday) {
		this.notday = notday;
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

	public MultipartFile getNotF() {
		return notF;
	}

	public void setNotF(MultipartFile notF) {
		this.notF = notF;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((notid == null) ? 0 : notid.hashCode());
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
		if (notid == null) {
			if (other.notid != null)
				return false;
		} else if (!notid.equals(other.notid))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "NoticeVo [notid=" + notid + ", notitle=" + notitle
				+ ", notcontent=" + notcontent + ", notfile=" + notfile
				+ ", notday=" + notday + ", notF=" + notF + "]";
	}

	

}
