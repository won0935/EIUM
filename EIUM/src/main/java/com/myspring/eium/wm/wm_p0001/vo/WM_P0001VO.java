package com.myspring.eium.wm.wm_p0001.vo;
import org.springframework.stereotype.Component;

@Component
public class WM_P0001VO {
	
	//사원 테이블
	private String employee_CODE="";
	private String employee_NAME="";
	
	
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
	
	//부서 테이블
	private String department_CODE="";
	private String department_NAME="";
	
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

	//WORKING_STATUS 근태 상태
	private String working_STATUS_CODE="";
	private String working_STATUS_MONTH="";
	private String working_STATUS_DATE="";
	private String working_STATUS_START_TIME="";
	private String working_STATUS_END_TIME="";
	private String working_STATUS_TOTAL_TIME="";
	private String working_STATUS_DESC="";
	private String working_STATUS_YN="";


	public String getWorking_STATUS_CODE() {
		return working_STATUS_CODE;
	}
	public void setWorking_STATUS_CODE(String working_STATUS_CODE) {
		this.working_STATUS_CODE = working_STATUS_CODE;
	}
	public String getWorking_STATUS_MONTH() {
		return working_STATUS_MONTH;
	}
	public void setWorking_STATUS_MONTH(String working_STATUS_MONTH) {
		this.working_STATUS_MONTH = working_STATUS_MONTH;
	}
	public String getWorking_STATUS_DATE() {
		return working_STATUS_DATE;
	}
	public void setWorking_STATUS_DATE(String working_STATUS_DATE) {
		this.working_STATUS_DATE = working_STATUS_DATE;
	}
	public String getWorking_STATUS_START_TIME() {
		return working_STATUS_START_TIME;
	}
	public void setWorking_STATUS_START_TIME(String working_STATUS_START_TIME) {
		this.working_STATUS_START_TIME = working_STATUS_START_TIME;
	}
	public String getWorking_STATUS_END_TIME() {
		return working_STATUS_END_TIME;
	}
	public void setWorking_STATUS_END_TIME(String working_STATUS_END_TIME) {
		this.working_STATUS_END_TIME = working_STATUS_END_TIME;
	}
	public String getWorking_STATUS_TOTAL_TIME() {
		return working_STATUS_TOTAL_TIME;
	}
	public void setWorking_STATUS_TOTAL_TIME(String working_STATUS_TOTAL_TIME) {
		this.working_STATUS_TOTAL_TIME = working_STATUS_TOTAL_TIME;
	}
	public String getWorking_STATUS_DESC() {
		return working_STATUS_DESC;
	}
	public void setWorking_STATUS_DESC(String working_STATUS_DESC) {
		this.working_STATUS_DESC = working_STATUS_DESC;
	}
	public String getWorking_STATUS_YN() {
		return working_STATUS_YN;
	}
	public void setWorking_STATUS_YN(String working_STATUS_YN) {
		this.working_STATUS_YN = working_STATUS_YN;
	}

	//총근태결과

	private String total_WORKING_STATUS_CODE="";
	private String TOTAL_MONTH="";
	
	private String weekday="";
	private String holiday="";
	
	private String normal_WORK_DAY="";
	private String extension_WORK_DAY="";
	
	private String weekday_NORMAL_WORK_TIME="";
	private String weekday_EXTENSION_WORK_TIME="";
	private String weekday_NIGHT_WORK_TIME="";
	
	private String holiday_NORMAL_WORK_TIME="";
	private String holiday_EXTENSION_WORK_TIME="";
	private String holiday_NIGHT_WORK_TIME="";

	public String getTotal_WORKING_STATUS_CODE() {
		return total_WORKING_STATUS_CODE;
	}
	public void setTotal_WORKING_STATUS_CODE(String total_WORKING_STATUS_CODE) {
		this.total_WORKING_STATUS_CODE = total_WORKING_STATUS_CODE;
	}
	public String getTOTAL_MONTH() {
		return TOTAL_MONTH;
	}
	public void setTOTAL_MONTH(String tOTAL_MONTH) {
		TOTAL_MONTH = tOTAL_MONTH;
	}
	public String getWeekday() {
		return weekday;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public String getNormal_WORK_DAY() {
		return normal_WORK_DAY;
	}
	public void setNormal_WORK_DAY(String normal_WORK_DAY) {
		this.normal_WORK_DAY = normal_WORK_DAY;
	}
	public String getExtension_WORK_DAY() {
		return extension_WORK_DAY;
	}
	public void setExtension_WORK_DAY(String extension_WORK_DAY) {
		this.extension_WORK_DAY = extension_WORK_DAY;
	}
	public String getWeekday_NORMAL_WORK_TIME() {
		return weekday_NORMAL_WORK_TIME;
	}
	public void setWeekday_NORMAL_WORK_TIME(String weekday_NORMAL_WORK_TIME) {
		this.weekday_NORMAL_WORK_TIME = weekday_NORMAL_WORK_TIME;
	}
	public String getWeekday_EXTENSION_WORK_TIME() {
		return weekday_EXTENSION_WORK_TIME;
	}
	public void setWeekday_EXTENSION_WORK_TIME(String weekday_EXTENSION_WORK_TIME) {
		this.weekday_EXTENSION_WORK_TIME = weekday_EXTENSION_WORK_TIME;
	}
	public String getWeekday_NIGHT_WORK_TIME() {
		return weekday_NIGHT_WORK_TIME;
	}
	public void setWeekday_NIGHT_WORK_TIME(String weekday_NIGHT_WORK_TIME) {
		this.weekday_NIGHT_WORK_TIME = weekday_NIGHT_WORK_TIME;
	}
	public String getHoliday_NORMAL_WORK_TIME() {
		return holiday_NORMAL_WORK_TIME;
	}
	public void setHoliday_NORMAL_WORK_TIME(String holiday_NORMAL_WORK_TIME) {
		this.holiday_NORMAL_WORK_TIME = holiday_NORMAL_WORK_TIME;
	}
	public String getHoliday_EXTENSION_WORK_TIME() {
		return holiday_EXTENSION_WORK_TIME;
	}
	public void setHoliday_EXTENSION_WORK_TIME(String holiday_EXTENSION_WORK_TIME) {
		this.holiday_EXTENSION_WORK_TIME = holiday_EXTENSION_WORK_TIME;
	}
	public String getHoliday_NIGHT_WORK_TIME() {
		return holiday_NIGHT_WORK_TIME;
	}
	public void setHoliday_NIGHT_WORK_TIME(String holiday_NIGHT_WORK_TIME) {
		this.holiday_NIGHT_WORK_TIME = holiday_NIGHT_WORK_TIME;
	}

	
 
	
}
