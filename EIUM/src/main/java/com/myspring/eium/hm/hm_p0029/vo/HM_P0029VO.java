package com.myspring.eium.hm.hm_p0029.vo;




import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import oracle.sql.BLOB;

@Component
public class HM_P0029VO {
	//교육 파트 VO
	private String site_CODE;
	private String site_NAME;
	private String employee_TRAINING_CODE;
	private String employee_TRAINING_NAME;
	private String employee_CODE;
	private String employee_NAME;
	private String employee_TRAINING_START_DATE;
	private String employee_TRAINING_END_DATE;
	private String assessment_DESC;
	
	//출장 파트 VO
	private String business_TRIP_CODE;
	private String country_NAME;
	private String area;
	private String START_DATE;
	private String END_DATE;
	private String flight_COST;
	private String total_COST;
	private String purpose;
	
	
	//자격/면허 파트 VO
	private String license_CODE;
	private String license_NAME;
	private String start_date;
	private String end_date;
	private String license_NUMBER;
	private String institute;
	private String bonus;
	
	// 어학시험 파트 VO
	private String language_CODE;
	private String language_NAME;
	private String grade;
	private String percent;
	
	//교육 파트 GET, SET
	
	
	public String getSite_CODE() {
		return site_CODE;
	}
	public void setSite_CODE(String site_CODE) {
		this.site_CODE = site_CODE;
	}
	public String getSite_NAME() {
		return site_NAME;
	}
	public void setSite_NAME(String site_NAME) {
		this.site_NAME = site_NAME;
	}
	public String getEmployee_TRAINING_CODE() {
		return employee_TRAINING_CODE;
	}
	public void setEmployee_TRAINING_CODE(String employee_TRAINING_CODE) {
		this.employee_TRAINING_CODE = employee_TRAINING_CODE;
	}
	public String getEmployee_TRAINING_NAME() {
		return employee_TRAINING_NAME;
	}
	public void setEmployee_TRAINING_NAME(String employee_TRAINING_NAME) {
		this.employee_TRAINING_NAME = employee_TRAINING_NAME;
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
	public String getEmployee_TRAINING_START_DATE() {
		return employee_TRAINING_START_DATE;
	}
	public void setEmployee_TRAINING_START_DATE(String employee_TRAINING_START_DATE) {
		this.employee_TRAINING_START_DATE = employee_TRAINING_START_DATE;
	}
	public String getEmployee_TRAINING_END_DATE() {
		return employee_TRAINING_END_DATE;
	}
	public void setEmployee_TRAINING_END_DATE(String employee_TRAINING_END_DATE) {
		this.employee_TRAINING_END_DATE = employee_TRAINING_END_DATE;
	}
	public String getAssessment_DESC() {
		return assessment_DESC;
	}
	public void setAssessment_DESC(String assessment_DESC) {
		this.assessment_DESC = assessment_DESC;
	}
	
	//출장 파트 GET, SET
	public String getBusiness_TRIP_CODE() {
		return business_TRIP_CODE;
	}
	public void setBusiness_TRIP_CODE(String business_TRIP_CODE) {
		this.business_TRIP_CODE = business_TRIP_CODE;
	}
	
	public String getCountry_NAME() {
		return country_NAME;
	}
	public void setCountry_NAME(String country_NAME) {
		this.country_NAME = country_NAME;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
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
	public String getFlight_COST() {
		return flight_COST;
	}
	public void setFlight_COST(String flight_COST) {
		this.flight_COST = flight_COST;
	}
	public String getTotal_COST() {
		return total_COST;
	}
	public void setTotal_COST(String total_COST) {
		this.total_COST = total_COST;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	
	
	//자격/면허 파트 GET, SET
	public String getLicense_CODE() {
		return license_CODE;
	}
	public void setLicense_CODE(String license_CODE) {
		this.license_CODE = license_CODE;
	}
	public String getLicense_NAME() {
		return license_NAME;
	}
	public void setLicense_NAME(String license_NAME) {
		this.license_NAME = license_NAME;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getLicense_NUMBER() {
		return license_NUMBER;
	}
	public void setLicense_NUMBER(String license_NUMBER) {
		this.license_NUMBER = license_NUMBER;
	}
	public String getInstitute() {
		return institute;
	}
	public void setInstitute(String institute) {
		this.institute = institute;
	}
	public String getBonus() {
		return bonus;
	}
	public void setBonus(String bonus) {
		this.bonus = bonus;
	}
	
	//어학시험 파트 GET, SET
	public String getLanguage_CODE() {
		return language_CODE;
	}
	public void setLanguage_CODE(String language_CODE) {
		this.language_CODE = language_CODE;
	}
	public String getLanguage_NAME() {
		return language_NAME;
	}
	public void setLanguage_NAME(String language_NAME) {
		this.language_NAME = language_NAME;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getPercent() {
		return percent;
	}
	public void setPercent(String percent) {
		this.percent = percent;
	}
	

	
	
	
}
