package com.myspring.eium.sm.sm_p0003.vo;

import org.springframework.stereotype.Component;

@Component
public class SM_P0003VO {


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
	public String getSECTOR_CODE() {
		return SECTOR_CODE;
	}
	public void setSECTOR_CODE(String sECTOR_CODE) {
		SECTOR_CODE = sECTOR_CODE;
	}
	public String getSECTOR_NAME() {
		return SECTOR_NAME;
	}
	public void setSECTOR_NAME(String sECTOR_NAME) {
		SECTOR_NAME = sECTOR_NAME;
	}
	
	String DEPARTMENT_CODE;
	public String getDEPARTMENT_TERM() {
		return DEPARTMENT_TERM;
	}
	public void setDEPARTMENT_TERM(String dEPARTMENT_TERM) {
		DEPARTMENT_TERM = dEPARTMENT_TERM;
	}


	public String getSECTOR_TERM() {
		return SECTOR_TERM;
	}
	public void setSECTOR_TERM(String sECTOR_TERM) {
		SECTOR_TERM = sECTOR_TERM;
	}

	String DEPARTMENT_NAME;
	String DEPARTMENT_TERM;
	String SITE_CODE;
	String SITE_NAME;
	String SECTOR_CODE;
	String SECTOR_NAME;
	

	String SECTOR_TERM;

	
}
