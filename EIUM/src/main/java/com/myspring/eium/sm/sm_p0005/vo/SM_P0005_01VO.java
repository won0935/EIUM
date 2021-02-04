package com.myspring.eium.sm.sm_p0005.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class SM_P0005_01VO {
	private String MENU_CODE;
	private String AUTHORITY_CODE;
	private String ACCESS_GRANT;
	private String MENU_NAME;
	private String ACCESS_RANGE;
	private String ACCESS_INSERT;
	private String ACCESS_UPDATE;
	private String ACCESS_DELETE;
	private String ACCESS_PRINT;
	private String INT_USER_ID;
	private Date INT_DATE;
	private String UPT_USER_ID;
	private Date UPT_DATE;

	public SM_P0005_01VO() {

	}

	public SM_P0005_01VO(String MENU_CODE, String AUTHORITY_CODE, String ACCESS_GRANT, String MENU_NAME,
			String ACCESS_RANGE, String ACCESS_INSERT, String ACCESS_UPDATE, String ACCESS_DELETE, String ACCESS_PRINT,
			String INT_USER_ID, Date INT_DATE, String UPT_USER_ID, Date UPT_DATE) {
		
		this.MENU_CODE = MENU_CODE;
		this.AUTHORITY_CODE = AUTHORITY_CODE;
		this.ACCESS_GRANT = ACCESS_GRANT;
		this.MENU_NAME = MENU_NAME;
		this.ACCESS_RANGE = ACCESS_RANGE;
		this.ACCESS_INSERT = ACCESS_INSERT;
		this.ACCESS_UPDATE = ACCESS_UPDATE;
		this.ACCESS_DELETE = ACCESS_DELETE;
		this.ACCESS_PRINT = ACCESS_PRINT;
		this.INT_USER_ID = INT_USER_ID;
		this.INT_DATE = INT_DATE;
		this.UPT_USER_ID = UPT_USER_ID;
		this.UPT_DATE = UPT_DATE;
		
	}

	public String getMENU_CODE() {
		return MENU_CODE;
	}

	public void setMENU_CODE(String mENU_CODE) {
		MENU_CODE = mENU_CODE;
	}

	public String getAUTHORITY_CODE() {
		return AUTHORITY_CODE;
	}

	public void setAUTHORITY_CODE(String aUTHORITY_CODE) {
		AUTHORITY_CODE = aUTHORITY_CODE;
	}

	public String getACCESS_GRANT() {
		return ACCESS_GRANT;
	}

	public void setACCESS_GRANT(String aCCESS_GRANT) {
		ACCESS_GRANT = aCCESS_GRANT;
	}

	public String getMENU_NAME() {
		return MENU_NAME;
	}

	public void setMENU_NAME(String mENU_NAME) {
		MENU_NAME = mENU_NAME;
	}

	public String getACCESS_RANGE() {
		return ACCESS_RANGE;
	}

	public void setACCESS_RANGE(String aCCESS_RANGE) {
		ACCESS_RANGE = aCCESS_RANGE;
	}

	public String getACCESS_INSERT() {
		return ACCESS_INSERT;
	}

	public void setACCESS_INSERT(String aCCESS_INSERT) {
		ACCESS_INSERT = aCCESS_INSERT;
	}

	public String getACCESS_UPDATE() {
		return ACCESS_UPDATE;
	}

	public void setACCESS_UPDATE(String aCCESS_UPDATE) {
		ACCESS_UPDATE = aCCESS_UPDATE;
	}

	public String getACCESS_DELETE() {
		return ACCESS_DELETE;
	}

	public void setACCESS_DELETE(String aCCESS_DELETE) {
		ACCESS_DELETE = aCCESS_DELETE;
	}

	public String getACCESS_PRINT() {
		return ACCESS_PRINT;
	}

	public void setACCESS_PRINT(String aCCESS_PRINT) {
		ACCESS_PRINT = aCCESS_PRINT;
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


}
