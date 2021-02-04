package com.myspring.eium.wm.wm_p0002.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class WM_P0002VO {
	private String EMPLOYEE_CODE;
	private String EMPLOYEE_NAME;
	private String DEPARTMENT_CODE;
	private String DEPARTMENT_NAME;
	private String POSITION_CODE;
	private String POSITION_NAME;
	private String VACATION_CODE;
	private String VACATION_TYPE;
	private String VACATION_START_DATE;
	private String VACATION_END_DATE;
	private String VACATION_APPLY_DATE;
	private String VACATION_REMAIN_DATE;
	private String BEFORE_VACATION_REMAIN_DATE;
	private String AFTER_VACATION_REMAIN_DATE;
	private String INT_USER_ID;
	private Date INT_DATE;
	private String UPT_USER_ID;
	private Date UPT_DATE;
	
	private String SITE_CODE;
	private String SITE_NAME;
	
	public WM_P0002VO() {

	}

	public WM_P0002VO(String EMPLOYEE_CODE, String EMPLOYEE_NAME, String DEPARTMENT_CODE, String DEPARTMENT_NAME, String POSITION_CODE, String POSITION_NAME,
			          String VACATION_TYPE, String VACATION_CODE, String VACATION_START_DATE, String VACATION_END_DATE, String VACATION_APPLY_DATE, String VACATION_REMAIN_DATE, String BEFORE_VACATION_REMAIN_DATE, String AFTER_VACATION_REMAIN_DATE,
			          String INT_USER_ID, Date INT_DATE, String UPT_USER_ID, Date UPT_DATE, String SITE_CODE, String SITE_NAME) {
		
		this.EMPLOYEE_CODE = EMPLOYEE_CODE;
		this.EMPLOYEE_NAME = EMPLOYEE_NAME;
		this.DEPARTMENT_CODE = DEPARTMENT_CODE;
		this.DEPARTMENT_NAME = DEPARTMENT_NAME;
		this.POSITION_CODE = POSITION_CODE;
		this.POSITION_NAME = POSITION_NAME;
		this.VACATION_CODE = VACATION_CODE;
		this.VACATION_TYPE = VACATION_TYPE;
		this.VACATION_START_DATE = VACATION_START_DATE;
		this.VACATION_END_DATE = VACATION_END_DATE;
		this.VACATION_APPLY_DATE = VACATION_APPLY_DATE;
		this.VACATION_REMAIN_DATE = VACATION_REMAIN_DATE;
		this.BEFORE_VACATION_REMAIN_DATE = BEFORE_VACATION_REMAIN_DATE;
		this.AFTER_VACATION_REMAIN_DATE = AFTER_VACATION_REMAIN_DATE;
		this.INT_USER_ID = INT_USER_ID;
		this.INT_DATE = INT_DATE;
		this.UPT_USER_ID = UPT_USER_ID;
		this.UPT_DATE = UPT_DATE;
		
		this.SITE_CODE = SITE_CODE;
		this.SITE_NAME = SITE_NAME;
		
		
	
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

	public String getPOSITION_CODE() {
		return POSITION_CODE;
	}

	public void setPOSITION_CODE(String pOSITION_CODE) {
		POSITION_CODE = pOSITION_CODE;
	}

	public String getPOSITION_NAME() {
		return POSITION_NAME;
	}

	public void setPOSITION_NAME(String pOSITION_NAME) {
		POSITION_NAME = pOSITION_NAME;
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

	public String getVACATION_TYPE() {
		return VACATION_TYPE;
	}

	public void setVACATION_TYPE(String vACATION_TYPE) {
		VACATION_TYPE = vACATION_TYPE;
	}

	public String getVACATION_START_DATE() {
		return VACATION_START_DATE;
	}

	public void setVACATION_START_DATE(String vACATION_START_DATE) {
		VACATION_START_DATE = vACATION_START_DATE;
	}

	public String getVACATION_END_DATE() {
		return VACATION_END_DATE;
	}

	public void setVACATION_END_DATE(String vACATION_END_DATE) {
		VACATION_END_DATE = vACATION_END_DATE;
	}

	public String getVACATION_APPLY_DATE() {
		return VACATION_APPLY_DATE;
	}

	public void setVACATION_APPLY_DATE(String vACATION_APPLY_DATE) {
		VACATION_APPLY_DATE = vACATION_APPLY_DATE;
	}

	public String getVACATION_REMAIN_DATE() {
		return VACATION_REMAIN_DATE;
	}

	public String getVACATION_CODE() {
		return VACATION_CODE;
	}

	public void setVACATION_CODE(String vACATION_CODE) {
		VACATION_CODE = vACATION_CODE;
	}

	public void setVACATION_REMAIN_DATE(String vACATION_REMAIN_DATE) {
		VACATION_REMAIN_DATE = vACATION_REMAIN_DATE;
	}

	public String getBEFORE_VACATION_REMAIN_DATE() {
		return BEFORE_VACATION_REMAIN_DATE;
	}

	public void setBEFORE_VACATION_REMAIN_DATE(String bEFORE_VACATION_REMAIN_DATE) {
		BEFORE_VACATION_REMAIN_DATE = bEFORE_VACATION_REMAIN_DATE;
	}

	public String getAFTER_VACATION_REMAIN_DATE() {
		return AFTER_VACATION_REMAIN_DATE;
	}

	public void setAFTER_VACATION_REMAIN_DATE(String aFTER_VACATION_REMAIN_DATE) {
		AFTER_VACATION_REMAIN_DATE = aFTER_VACATION_REMAIN_DATE;
	}
	

}
