package com.myspring.eium.sm.sm_p0005.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class SM_P0005VO {
	private String AUTHORITY_CODE;
	private String AUTHORITY_NAME;
	private String INT_USER_ID;
	private Date INT_DATE;
	private String UPT_USER_ID;
	private Date UPT_DATE;
	
	private String MENU_CODE;
	private String MENU_NAME;

	public SM_P0005VO() {

	}

	public SM_P0005VO(String AUTHORITY_CODE, String AUTHORITY_NAME, String INT_USER_ID,
			Date INT_DATE, String UPT_USER_ID, Date UPT_DATE, String MENU_CODE, String MENU_NAME) {
		
		this.AUTHORITY_CODE = AUTHORITY_CODE;
		this.AUTHORITY_NAME = AUTHORITY_NAME;
		this.INT_USER_ID = INT_USER_ID;
		this.INT_DATE = INT_DATE;
		this.UPT_USER_ID = UPT_USER_ID;
		this.UPT_DATE = UPT_DATE;
		
		this.MENU_CODE = MENU_CODE;
		this.MENU_NAME = MENU_NAME;
		
	}

	public String getAUTHORITY_CODE() {
		return AUTHORITY_CODE;
	}

	public void setAUTHORITY_CODE(String aUTHORITY_CODE) {
		AUTHORITY_CODE = aUTHORITY_CODE;
	}

	public String getAUTHORITY_NAME() {
		return AUTHORITY_NAME;
	}

	public void setAUTHORITY_NAME(String aUTHORITY_NAME) {
		AUTHORITY_NAME = aUTHORITY_NAME;
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

	public String getMENU_CODE() {
		return MENU_CODE;
	}

	public void setMENU_CODE(String mENU_CODE) {
		MENU_CODE = mENU_CODE;
	}

	public String getMENU_NAME() {
		return MENU_NAME;
	}

	public void setMENU_NAME(String mENU_NAME) {
		MENU_NAME = mENU_NAME;
	}



}
