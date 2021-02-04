package com.myspring.eium.wm.wm_p0004.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class WM_P0004VO {
	private String EMPLOYEE_CODE;
	private String EMPLOYEE_NAME;
	private String DEPARTMENT_CODE;
	private String DEPARTMENT_NAME;
	private String POSITION_CODE;
	private String POSITION_NAME;
	
	private String BUSINESS_TRIP_CODE;
    private String START_DATE;
    private String END_DATE;
    private String COUNTRY_CODE;
    private String COUNTRY_NAME;
    private String AREA;
    private String FLIGHT_COST;
    private String SELF_BURDEN;
    private String COMPANY_BURDEN;
    private String ECT_COST;
    private String TOTAL_COST;
    private String PURPOSE;
    
	private String INT_USER_ID;
	private Date INT_DATE;
	private String UPT_USER_ID;
	private Date UPT_DATE;
	
	private String SITE_CODE;
	private String SITE_NAME;
	
	public WM_P0004VO() {

	}

	public WM_P0004VO(String EMPLOYEE_CODE, String EMPLOYEE_NAME, String DEPARTMENT_CODE, String DEPARTMENT_NAME, String POSITION_CODE, String POSITION_NAME,
			          String BUSINESS_TRIP_CODE, String START_DATE, String END_DATE, String COUNTRY_CODE, String COUNTRY_NAME, String AREA, String FLIGHT_COST, String SELF_BURDEN, String COMPANY_BURDEN, String ECT_COST, String TOTAL_COST, String PURPOSE,
			          String INT_USER_ID, Date INT_DATE, String UPT_USER_ID, Date UPT_DATE, String SITE_CODE, String SITE_NAME) {
		
		this.EMPLOYEE_CODE = EMPLOYEE_CODE;
		this.EMPLOYEE_NAME = EMPLOYEE_NAME;
		this.DEPARTMENT_CODE = DEPARTMENT_CODE;
		this.DEPARTMENT_NAME = DEPARTMENT_NAME;
		this.POSITION_CODE = POSITION_CODE;
		this.POSITION_NAME = POSITION_NAME;
		this.BUSINESS_TRIP_CODE = BUSINESS_TRIP_CODE;
		this.START_DATE = START_DATE;
		this.END_DATE = END_DATE;
		this.COUNTRY_CODE = COUNTRY_CODE;
		this.COUNTRY_NAME = COUNTRY_NAME;
		this.AREA = AREA;
		this.FLIGHT_COST = FLIGHT_COST;
		this.SELF_BURDEN = SELF_BURDEN;
		this.COMPANY_BURDEN = COMPANY_BURDEN;
		this.ECT_COST = ECT_COST;
		this.TOTAL_COST = TOTAL_COST;
		this.PURPOSE = PURPOSE;
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

	public String getSTART_DATE() {
		return START_DATE;
	}

	public void setSTART_DATE(String sTART_DATE) {
		START_DATE = sTART_DATE;
	}

	public String getEND_DATE() {
		return END_DATE;
	}

	public void setEND_DATE(String eND_DATE) {
		END_DATE = eND_DATE;
	}

	public String getCOUNTRY_CODE() {
		return COUNTRY_CODE;
	}

	public void setCOUNTRY_CODE(String cOUNTRY_CODE) {
		COUNTRY_CODE = cOUNTRY_CODE;
	}

	public String getCOUNTRY_NAME() {
		return COUNTRY_NAME;
	}

	public void setCOUNTRY_NAME(String cOUNTRY_NAME) {
		COUNTRY_NAME = cOUNTRY_NAME;
	}

	public String getAREA() {
		return AREA;
	}

	public void setAREA(String aREA) {
		AREA = aREA;
	}

	public String getFLIGHT_COST() {
		return FLIGHT_COST;
	}

	public void setFLIGHT_COST(String fLIGHT_COST) {
		FLIGHT_COST = fLIGHT_COST;
	}

	public String getSELF_BURDEN() {
		return SELF_BURDEN;
	}

	public void setSELF_BURDEN(String sELF_BURDEN) {
		SELF_BURDEN = sELF_BURDEN;
	}

	public String getCOMPANY_BURDEN() {
		return COMPANY_BURDEN;
	}

	public void setCOMPANY_BURDEN(String cOMPANY_BURDEN) {
		COMPANY_BURDEN = cOMPANY_BURDEN;
	}

	public String getECT_COST() {
		return ECT_COST;
	}

	public void setECT_COST(String eCT_COST) {
		ECT_COST = eCT_COST;
	}

	public String getTOTAL_COST() {
		return TOTAL_COST;
	}

	public void setTOTAL_COST(String tOTAL_COST) {
		TOTAL_COST = tOTAL_COST;
	}

	public String getPURPOSE() {
		return PURPOSE;
	}

	public void setPURPOSE(String pURPOSE) {
		PURPOSE = pURPOSE;
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

	public String getBUSINESS_TRIP_CODE() {
		return BUSINESS_TRIP_CODE;
	}

	public void setBUSINESS_TRIP_CODE(String bUSINESS_TRIP_CODE) {
		BUSINESS_TRIP_CODE = bUSINESS_TRIP_CODE;
	}

}
