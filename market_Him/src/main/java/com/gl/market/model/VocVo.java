package com.gl.market.model;

public class VocVo {
	
	private String vocid;
	private String voctitle;
	private String voccontent;
	private String customid;
	private String answer;
	private String proid;
	
	public VocVo() {
		// TODO Auto-generated constructor stub
	}

	public VocVo(String vocid, String voctitle, String voccontent,
			String customid, String answer, String proid) {
		super();
		this.vocid = vocid;
		this.voctitle = voctitle;
		this.voccontent = voccontent;
		this.customid = customid;
		this.answer = answer;
		this.proid = proid;
	}

	public String getVocid() {
		return vocid;
	}

	public void setVocid(String vocid) {
		this.vocid = vocid;
	}

	public String getVoctitle() {
		return voctitle;
	}

	public void setVoctitle(String voctitle) {
		this.voctitle = voctitle;
	}

	public String getVoccontent() {
		return voccontent;
	}

	public void setVoccontent(String voccontent) {
		this.voccontent = voccontent;
	}

	public String getCustomid() {
		return customid;
	}

	public void setCustomid(String customid) {
		this.customid = customid;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getProid() {
		return proid;
	}

	public void setProid(String proid) {
		this.proid = proid;
	}

	@Override
	public String toString() {
		return "VocVo [vocid=" + vocid + ", voctitle=" + voctitle
				+ ", voccontent=" + voccontent + ", customid=" + customid
				+ ", answer=" + answer + ", proid=" + proid + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((answer == null) ? 0 : answer.hashCode());
		result = prime * result
				+ ((customid == null) ? 0 : customid.hashCode());
		result = prime * result + ((proid == null) ? 0 : proid.hashCode());
		result = prime * result
				+ ((voccontent == null) ? 0 : voccontent.hashCode());
		result = prime * result + ((vocid == null) ? 0 : vocid.hashCode());
		result = prime * result
				+ ((voctitle == null) ? 0 : voctitle.hashCode());
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
		VocVo other = (VocVo) obj;
		if (answer == null) {
			if (other.answer != null)
				return false;
		} else if (!answer.equals(other.answer))
			return false;
		if (customid == null) {
			if (other.customid != null)
				return false;
		} else if (!customid.equals(other.customid))
			return false;
		if (proid == null) {
			if (other.proid != null)
				return false;
		} else if (!proid.equals(other.proid))
			return false;
		if (voccontent == null) {
			if (other.voccontent != null)
				return false;
		} else if (!voccontent.equals(other.voccontent))
			return false;
		if (vocid == null) {
			if (other.vocid != null)
				return false;
		} else if (!vocid.equals(other.vocid))
			return false;
		if (voctitle == null) {
			if (other.voctitle != null)
				return false;
		} else if (!voctitle.equals(other.voctitle))
			return false;
		return true;
	}
	
	
	
	
}
