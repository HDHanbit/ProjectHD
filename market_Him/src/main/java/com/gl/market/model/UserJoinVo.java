package com.gl.market.model;

public class UserJoinVo {
	
	private String id;
	private String pw;
	private String name;
	private String phone;
	private int cash;
	private String grade;
	private int tcash;
	
	
	public UserJoinVo() {
		// TODO Auto-generated constructor stub
	}


	public UserJoinVo(String id, String pw, String name, String phone, int cash,
			String grade, int tcash) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.cash = cash;
		this.grade = grade;
		this.tcash = tcash;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getCash() {
		return cash;
	}


	public void setCash(int cash) {
		this.cash = cash;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public int getTcash() {
		return tcash;
	}


	public void setTcash(int tcash) {
		this.tcash = tcash;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((pw == null) ? 0 : pw.hashCode());
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
		UserJoinVo other = (UserJoinVo) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (pw == null) {
			if (other.pw != null)
				return false;
		} else if (!pw.equals(other.pw))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "UserJoinVo [id=" + id + ", pw=" + pw + ", name=" + name
				+ ", phone=" + phone + ", cash=" + cash + ", grade=" + grade
				+ ", tcash=" + tcash + "]";
	}
	
}
