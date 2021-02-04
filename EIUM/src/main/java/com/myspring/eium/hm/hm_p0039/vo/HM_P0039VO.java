package com.myspring.eium.hm.hm_p0039.vo;

import org.springframework.stereotype.Component;

@Component
public class HM_P0039VO {

	public String getEMPLOYEE_JOIN_DATE() {
		return EMPLOYEE_JOIN_DATE;
	}
	public void setEMPLOYEE_JOIN_DATE(String eMPLOYEE_JOIN_DATE) {
		EMPLOYEE_JOIN_DATE = eMPLOYEE_JOIN_DATE;
	}
	public String getEMPLOYEE_CODE() {
		return EMPLOYEE_CODE;
	}
	public void setEMPLOYEE_CODE(String eMPLOYEE_CODE) {
		EMPLOYEE_CODE = eMPLOYEE_CODE;
	}
	public String getEMPLOYEE_NAME() {
		return EMPLOYEE_NAME;
	}
	public void setEMPLOYEE_NAME(String eMPLOYEE_NAME) {
		EMPLOYEE_NAME = eMPLOYEE_NAME;
	}
	public String getDEPARTMENT_NAME() {
		return DEPARTMENT_NAME;
	}
	public void setDEPARTMENT_NAME(String dEPARTMENT_NAME) {
		DEPARTMENT_NAME = dEPARTMENT_NAME;
	}
	public String getDUTY_NAME() {
		return DUTY_NAME;
	}
	public void setDUTY_NAME(String dUTY_NAME) {
		DUTY_NAME = dUTY_NAME;
	}
	public String getWORKING_YEARS() {
		return WORKING_YEARS;
	}
	public void setWORKING_YEARS(String wORKING_YEARS) {
		WORKING_YEARS = wORKING_YEARS;
	}
	public String getRESIDENT_RESISTRATION_NUMBER() {
		return RESIDENT_RESISTRATION_NUMBER;
	}
	public void setRESIDENT_RESISTRATION_NUMBER(String rESIDENT_RESISTRATION_NUMBER) {
		RESIDENT_RESISTRATION_NUMBER = rESIDENT_RESISTRATION_NUMBER;
	}
	String EMPLOYEE_JOIN_DATE;
	String EMPLOYEE_CODE;
	String EMPLOYEE_NAME;
	String DEPARTMENT_NAME;
	String DUTY_NAME;
	String WORKING_YEARS;
	String RESIDENT_RESISTRATION_NUMBER;
    }
