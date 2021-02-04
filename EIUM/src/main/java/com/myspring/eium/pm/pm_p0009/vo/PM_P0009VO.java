package com.myspring.eium.pm.pm_p0009.vo;

import org.springframework.stereotype.Component;


@Component
public class PM_P0009VO {
	

	private String employee_CODE;
	private String  employee_NAME;
	private String  department_CODE;
	private String  department_NAME;
	private String  basic_SALARY;
	private String  position_SALARY;
	private String  bonus_SALARY;
	private String  payment_CODE;
	private String  payment_DATE1;
	private String  payment_DATE2;
	private String  payment_DES_NAME;
	
	
	public String getPayment_CODE() {
		return payment_CODE;
	}
	public void setPayment_CODE(String payment_CODE) {
		this.payment_CODE = payment_CODE;
	}
	public String getPayment_DATE1() {
		return payment_DATE1;
	}
	public void setPayment_DATE1(String payment_DATE1) {
		this.payment_DATE1 = payment_DATE1;
	}
	public String getPayment_DATE2() {
		return payment_DATE2;
	}
	public void setPayment_DATE2(String payment_DATE2) {
		this.payment_DATE2 = payment_DATE2;
	}
	public String getPayment_DES_NAME() {
		return payment_DES_NAME;
	}
	public void setPayment_DES_NAME(String payment_DES_NAME) {
		this.payment_DES_NAME = payment_DES_NAME;
	}
	public String getEmployee_CODE() {
		return employee_CODE;
	}
	public void setEmployee_CODE(String employee_CODE) {
		this.employee_CODE = employee_CODE;
	}
	public String getEmployee_NAME() {
		return employee_NAME;
	}
	public void setEmployee_NAME(String employee_NAME) {
		this.employee_NAME = employee_NAME;
	}
	public String getDepartment_CODE() {
		return department_CODE;
	}
	public void setDepartment_CODE(String department_CODE) {
		this.department_CODE = department_CODE;
	}
	public String getDepartment_NAME() {
		return department_NAME;
	}
	public void setDepartment_NAME(String department_NAME) {
		this.department_NAME = department_NAME;
	}
	public String getBasic_SALARY() {
		return basic_SALARY;
	}
	public void setBasic_SALARY(String basic_SALARY) {
		this.basic_SALARY = basic_SALARY;
	}
	public String getPosition_SALARY() {
		return position_SALARY;
	}
	public void setPosition_SALARY(String position_SALARY) {
		this.position_SALARY = position_SALARY;
	}
	public String getBonus_SALARY() {
		return bonus_SALARY;
	}
	public void setBonus_SALARY(String bonus_SALARY) {
		this.bonus_SALARY = bonus_SALARY;
	}
	
	
	
	
}
