package com.myspring.eium.hm.hm_p0001.vo;


import org.springframework.stereotype.Component;

@Component
public class HM_P0001VO {
	
	//직급 
	private String  position_CODE;
	private String  position_NAME;
	public String getPosition_CODE() {
		return position_CODE;
	}
	public void setPosition_CODE(String position_CODE) {
		this.position_CODE = position_CODE;
	}
	public String getPosition_NAME() {
		return position_NAME;
	}
	public void setPosition_NAME(String position_NAME) {
		this.position_NAME = position_NAME;
	}
	
	//호봉
	private String pay_GRADE_CODE;
	private String pay_GRADE_NAME;
	
	
	
	public String getPay_GRADE_CODE() {
		return pay_GRADE_CODE;
	}
	public void setPay_GRADE_CODE(String pay_GRADE_CODE) {
		this.pay_GRADE_CODE = pay_GRADE_CODE;
	}
	public String getPay_GRADE_NAME() {
		return pay_GRADE_NAME;
	}
	public void setPay_GRADE_NAME(String pay_GRADE_NAME) {
		this.pay_GRADE_NAME = pay_GRADE_NAME;
	}

	//호봉 테이블(변경이력)
	private String start_DATE;
	private String end_DATE;
	private String salary;
	public String getStart_DATE() {
		return start_DATE;
	}
	public void setStart_DATE(String start_DATE) {
		this.start_DATE = start_DATE;
	}
	public String getEnd_DATE() {
		return end_DATE;
	}
	public void setEnd_DATE(String end_DATE) {
		this.end_DATE = end_DATE;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	
	
}
