package com.gl.master.model.event;

import org.springframework.web.multipart.MultipartFile;

public class EventVo {
	private String eid;
	private String ename;
	private String eimg;
	private String eexp;
	private String eurl;
	private int eprio;
	private String eduring;
	private MultipartFile eimgFile;
	
	public EventVo() {
		// TODO Auto-generated constructor stub
	}

	public EventVo(String eid, String ename, String eimg, String eexp,
			String eurl, int eprio, String eduring, MultipartFile eimgFile) {
		super();
		this.eid = eid;
		this.ename = ename;
		this.eimg = eimg;
		this.eexp = eexp;
		this.eurl = eurl;
		this.eprio = eprio;
		this.eduring = eduring;
		this.eimgFile = eimgFile;
	}

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEimg() {
		return eimg;
	}

	public void setEimg(String eimg) {
		this.eimg = eimg;
	}

	public String getEexp() {
		return eexp;
	}

	public void setEexp(String eexp) {
		this.eexp = eexp;
	}

	public String getEurl() {
		return eurl;
	}

	public void setEurl(String eurl) {
		this.eurl = eurl;
	}

	public int getEprio() {
		return eprio;
	}

	public void setEprio(int eprio) {
		this.eprio = eprio;
	}

	public String getEduring() {
		return eduring;
	}

	public void setEduring(String eduring) {
		this.eduring = eduring;
	}

	public MultipartFile getEimgFile() {
		return eimgFile;
	}

	public void setEimgFile(MultipartFile eimgFile) {
		this.eimgFile = eimgFile;
	}

	@Override
	public String toString() {
		return "EventVo [eid=" + eid + ", ename=" + ename + ", eimg=" + eimg
				+ ", eexp=" + eexp + ", eurl=" + eurl + ", eprio=" + eprio
				+ ", eduring=" + eduring + ", eimgFile=" + eimgFile + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((eid == null) ? 0 : eid.hashCode());
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
		EventVo other = (EventVo) obj;
		if (eid == null) {
			if (other.eid != null)
				return false;
		} else if (!eid.equals(other.eid))
			return false;
		return true;
	}
	
	
	
	
	
	
}
	
 
