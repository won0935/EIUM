package com.myspring.eium.hm.hm_p0001.vo;

import org.springframework.stereotype.Component;

@Component
public class HM_P0001_01VO {
	private String position_CODE;
	private String pay_GRADE;
	private int salary;
	
	public String getPosition_CODE() {
		return position_CODE;
	}
	public void setPosition_CODE(String position_CODE) {
		this.position_CODE = position_CODE;
	}
	public String getPay_GRADE() {
		return pay_GRADE;
	}
	public void setPay_GRADE(String pay_GRADE) {
		this.pay_GRADE = pay_GRADE;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	
	
}
