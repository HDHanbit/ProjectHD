package com.gl.master.model.customer;

public class CustomerVo {

	private String id;
	private String pw;
	private String name;
	private int phone;
	private int cash;
	private int tcash;
	private String grade;
	
	public CustomerVo() {
		// TODO Auto-generated constructor stub
	}

	
	
	public CustomerVo(String id, int cash, int tcash) {
		super();
		this.id = id;
		this.cash = cash;
		this.tcash = tcash;
	}



	public CustomerVo(String id, String pw,String name, int phone, int cash, int tcash,
			String grade) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.cash = cash;
		this.tcash = tcash;
		this.grade = grade;
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


	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getTcash() {
		return tcash;
	}

	public void setTcash(int tcash) {
		this.tcash = tcash;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + phone;
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
		CustomerVo other = (CustomerVo) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (phone != other.phone)
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
		return "CustomerVo [id=" + id + ", pw=" + pw + ", phone=" + phone
				+ ", cash=" + cash + ", tcash=" + tcash + ", grade=" + grade
				+ "]";
	}

}
