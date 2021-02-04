package com.myspring.eium.hm.hm_p0035.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class HM_P0035VO {
	private String EMPLOYEE_ID;
	private String EMPLOYEE_CODE;
	private String EMPLOYEE_NAME;
	
	private String DUTY_NAME;
	private String EMPLOYEE_JOIN_DATE;
	private String JOB_CLASS_NAME;
	private String PAY_TYPE_NAME;
	private String CONTRACT_START_MONTH;
	private String CONTRACT_YEAR_PAY;
	private String CONTRACT_MONTH_PAY;
	private String CONTRACT_DAY_PAY;
	private String CONTRACT_TIME_PAY;
	
	private String INT_USER_ID;
	private Date INT_DATE;
	private String UPT_USER_ID;
	private Date UPT_DATE;
	
	private String SITE_CODE;
	private String SITE_NAME;
	
	private String DEPARTMENT_CODE;
	private String DEPARTMENT_NAME;
	


	
	public HM_P0035VO() {

	}

	public String getEMPLOYEE_ID() {
		return EMPLOYEE_ID;
	}

	public void setEMPLOYEE_ID(String eMPLOYEE_ID) {
		EMPLOYEE_ID = eMPLOYEE_ID;
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

	public String getDUTY_NAME() {
		return DUTY_NAME;
	}

	public void setDUTY_NAME(String dUTY_NAME) {
		DUTY_NAME = dUTY_NAME;
	}

	public String getEMPLOYEE_JOIN_DATE() {
		return EMPLOYEE_JOIN_DATE;
	}

	public void setEMPLOYEE_JOIN_DATE(String eMPLOYEE_JOIN_DATE) {
		EMPLOYEE_JOIN_DATE = eMPLOYEE_JOIN_DATE;
	}

	public String getJOB_CLASS_NAME() {
		return JOB_CLASS_NAME;
	}

	public void setJOB_CLASS_NAME(String jOB_CLASS_NAME) {
		JOB_CLASS_NAME = jOB_CLASS_NAME;
	}

	public String getPAY_TYPE_NAME() {
		return PAY_TYPE_NAME;
	}

	public void setPAY_TYPE_NAME(String pAY_TYPE_NAME) {
		PAY_TYPE_NAME = pAY_TYPE_NAME;
	}

	public String getINT_USER_ID() {
		return INT_USER_ID;
	}

	public void setINT_USER_ID(String iNT_USER_ID) {
		INT_USER_ID = iNT_USER_ID;
	}

	public Date getINT_DATE() {
		return INT_DATE;
	}

	public void setINT_DATE(Date iNT_DATE) {
		INT_DATE = iNT_DATE;
	}

	public String getUPT_USER_ID() {
		return UPT_USER_ID;
	}

	public void setUPT_USER_ID(String uPT_USER_ID) {
		UPT_USER_ID = uPT_USER_ID;
	}

	public Date getUPT_DATE() {
		return UPT_DATE;
	}

	public void setUPT_DATE(Date uPT_DATE) {
		UPT_DATE = uPT_DATE;
	}

	public String getSITE_CODE() {
		return SITE_CODE;
	}

	public void setSITE_CODE(String sITE_CODE) {
		SITE_CODE = sITE_CODE;
	}

	public String getSITE_NAME() {
		return SITE_NAME;
	}

	public void setSITE_NAME(String sITE_NAME) {
		SITE_NAME = sITE_NAME;
	}

	public String getDEPARTMENT_CODE() {
		return DEPARTMENT_CODE;
	}

	public void setDEPARTMENT_CODE(String dEPARTMENT_CODE) {
		DEPARTMENT_CODE = dEPARTMENT_CODE;
	}

	public String getDEPARTMENT_NAME() {
		return DEPARTMENT_NAME;
	}

	public void setDEPARTMENT_NAME(String dEPARTMENT_NAME) {
		DEPARTMENT_NAME = dEPARTMENT_NAME;
	}

	public String getCONTRACT_START_MONTH() {
		return CONTRACT_START_MONTH;
	}

	public void setCONTRACT_START_MONTH(String cONTRACT_START_MONTH) {
		CONTRACT_START_MONTH = cONTRACT_START_MONTH;
	}

	public String getCONTRACT_YEAR_PAY() {
		return CONTRACT_YEAR_PAY;
	}

	public void setCONTRACT_YEAR_PAY(String cONTRACT_YEAR_PAY) {
		CONTRACT_YEAR_PAY = cONTRACT_YEAR_PAY;
	}

	public String getCONTRACT_MONTH_PAY() {
		return CONTRACT_MONTH_PAY;
	}

	public void setCONTRACT_MONTH_PAY(String cONTRACT_MONTH_PAY) {
		CONTRACT_MONTH_PAY = cONTRACT_MONTH_PAY;
	}

	public String getCONTRACT_DAY_PAY() {
		return CONTRACT_DAY_PAY;
	}

	public void setCONTRACT_DAY_PAY(String cONTRACT_DAY_PAY) {
		CONTRACT_DAY_PAY = cONTRACT_DAY_PAY;
	}

	public String getCONTRACT_TIME_PAY() {
		return CONTRACT_TIME_PAY;
	}

	public void setCONTRACT_TIME_PAY(String cONTRACT_TIME_PAY) {
		CONTRACT_TIME_PAY = cONTRACT_TIME_PAY;
	}

}
