package com.myspring.eium.sm.sm_p0004.vo;

import org.springframework.stereotype.Component;

@Component
public class SM_P0004VO {
	private String employee_code;
	private String employee_name;
	private String employee_id;
	private String employee_available_yn;
	private String employee_password;
	private String contact;
	private String company_code;
	private String company_name;
	private String user;

	



	public String getCompany_code() {
		return company_code;
	}



	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}



	public String getCompany_name() {
		return company_name;
	}



	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}



	public String getUser() {
		return user;
	}



	public void setUser(String user) {
		this.user = user;
	}



	public SM_P0004VO() {

	}

	public String getEmployee_code() {
		return employee_code;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}


	public String getEmployee_available_yn() {
		return employee_available_yn;
	}

	public void setEmployee_available_yn(String employee_available_yn) {
		this.employee_available_yn = employee_available_yn;
	}

	public String getEmployee_password() {
		return employee_password;
	}

	public void setEmployee_password(String employee_password) {
		this.employee_password = employee_password;
	}


	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}


	
	

	

}
