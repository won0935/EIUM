package com.myspring.eium.sm.sm_p0006.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class SM_P0006_01VO {
	private String AUTHORITY_NAME;
	private String AUTHORITY_GRANT;
	private String AUTHORITY_CODE;
	private String INT_USER_ID;
	private Date INT_DATE;
	private String UPT_USER_ID;
	private Date UPT_DATE;

	public SM_P0006_01VO() {

	}

	public SM_P0006_01VO(String AUTHORITY_NAME, String AUTHORITY_GRANT, String AUTHORITY_CODE,
			String INT_USER_ID, Date INT_DATE, String UPT_USER_ID, Date UPT_DATE) {
		
		this.AUTHORITY_NAME = AUTHORITY_NAME;
		this.AUTHORITY_GRANT = AUTHORITY_GRANT;
		this.AUTHORITY_CODE = AUTHORITY_CODE;
		this.INT_USER_ID = INT_USER_ID;
		this.INT_DATE = INT_DATE;
		this.UPT_USER_ID = UPT_USER_ID;
		this.UPT_DATE = UPT_DATE;
		
	}

	public String getAUTHORITY_NAME() {
		return AUTHORITY_NAME;
	}

	public void setAUTHORITY_NAME(String aUTHORITY_NAME) {
		AUTHORITY_NAME = aUTHORITY_NAME;
	}

	public String getAUTHORITY_GRANT() {
		return AUTHORITY_GRANT;
	}

	public void setAUTHORITY_GRANT(String aUTHORITY_GRANT) {
		AUTHORITY_GRANT = aUTHORITY_GRANT;
	}

	public String getAUTHORITY_CODE() {
		return AUTHORITY_CODE;
	}

	public void setAUTHORITY_CODE(String aUTHORITY_CODE) {
		AUTHORITY_CODE = aUTHORITY_CODE;
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
