package com.myspring.eium.hm.hm_p0004.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class HM_P0004VO {
	

	private String emp_CODE;
	private String  emp_NAME;
	private String  dep_NAME;
	private String  emp_NAME_EN;
	private String  emp_NAME_HN;
	private String  foreign_YN;
	private String  rr_NUM;
	private String  sex;
	private String  birth;
	private String  contact;
	private String  final_EDU_CODE;
	private String  final_EDU_NAME;
	
	 private MultipartFile picture;
	 
	private String  zip_CODE;
	private String  res_ADDRESS;
	private String  res_ADDRESS_DETAIL;
	private String  res_ADDRESS_EN;
	private String  email;
	private String  card_NUM;
	private String  hh_YN;
	private String  hc_YN;
	private String  country_CODE;
	private String  country_NAME;
	private String  hire_TYPE;
	private String  hire_NUM;
	private String  cur_ADDRESS;
	private String  cur_ADDRESS_DETAIL;
	
	private String employee_JOIN_DATE;
	private String employee_RESIGNATION_DATE;
	private String department_CODE;
	private String department_NAME;
	private String position_CODE;
	private String position_NAME;
	private String out_REASON_CODE;
	private String out_REASON_NAME;

	private String job_CLASS_CODE;
	private String job_CLASS_NAME;
	private String duty_CODE;
	private String duty_NAME;
	private String job_DIS_CODE;
	private String job_DIS_NAME;
	private String work_STATUS_CODE;
	private String work_STATUS_NAME;
	private String probation_YN;
	private String probation_DATE;
	private String work_INCLUDE_YN;
	private String leave_DATE_START;
	private String leave_DATE_END;
	private String d_CODE_CODE;
	private String d_CODE_NAME;
	private String work_TYPE_CODE;
	private String work_TYPE_NAME;
	private String pay_TYPE_CODE;
	private String pay_TYPE_NAME;
	
	private String pay_GRADE_CODE;
	private String pay_GRADE_NAME;

	private String salary;
	private String bank_CODE_1;
	private String bank_NAME_1;
	private String account_NUMBER_1;
	private String account_NAME_1;
	private String bank_CODE_2;
	private String bank_NAME_2;
	private String account_NUMBER_2;
	private String account_NAME_2;
	
	private String employee_CODE;
	private String contract_START_MONTH;
	private String contract_END_MONTH;
	private String contract_YEAR_PAY;
	private String contract_MONTH_PAY;
	private String contract_DAY_PAY;
	private String contract_TIME_PAY;
	
	public String getWork_STATUS_CODE() {
		return work_STATUS_CODE;
	}
	public void setWork_STATUS_CODE(String work_STATUS_CODE) {
		this.work_STATUS_CODE = work_STATUS_CODE;
	}
	public String getWork_STATUS_NAME() {
		return work_STATUS_NAME;
	}
	public void setWork_STATUS_NAME(String work_STATUS_NAME) {
		this.work_STATUS_NAME = work_STATUS_NAME;
	}
	public String getEmp_CODE() {
		return emp_CODE;
	}
	public void setEmp_CODE(String emp_CODE) {
		this.emp_CODE = emp_CODE;
	}
	public String getEmp_NAME() {
		return emp_NAME;
	}
	public void setEmp_NAME(String emp_NAME) {
		this.emp_NAME = emp_NAME;
	}
	public String getDep_NAME() {
		return dep_NAME;
	}
	public void setDep_NAME(String dep_NAME) {
		this.dep_NAME = dep_NAME;
	}
	public String getEmp_NAME_EN() {
		return emp_NAME_EN;
	}
	public void setEmp_NAME_EN(String emp_NAME_EN) {
		this.emp_NAME_EN = emp_NAME_EN;
	}
	public String getEmp_NAME_HN() {
		return emp_NAME_HN;
	}
	public void setEmp_NAME_HN(String emp_NAME_HN) {
		this.emp_NAME_HN = emp_NAME_HN;
	}
	public String getForeign_YN() {
		return foreign_YN;
	}
	public void setForeign_YN(String foreign_YN) {
		this.foreign_YN = foreign_YN;
	}
	public String getRr_NUM() {
		return rr_NUM;
	}
	public void setRr_NUM(String rr_NUM) {
		this.rr_NUM = rr_NUM;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getFinal_EDU_CODE() {
		return final_EDU_CODE;
	}
	public void setFinal_EDU_CODE(String final_EDU_CODE) {
		this.final_EDU_CODE = final_EDU_CODE;
	}
	public String getFinal_EDU_NAME() {
		return final_EDU_NAME;
	}
	public void setFinal_EDU_NAME(String final_EDU_NAME) {
		this.final_EDU_NAME = final_EDU_NAME;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	public String getZip_CODE() {
		return zip_CODE;
	}
	public void setZip_CODE(String zip_CODE) {
		this.zip_CODE = zip_CODE;
	}
	public String getRes_ADDRESS() {
		return res_ADDRESS;
	}
	public void setRes_ADDRESS(String res_ADDRESS) {
		this.res_ADDRESS = res_ADDRESS;
	}
	public String getRes_ADDRESS_DETAIL() {
		return res_ADDRESS_DETAIL;
	}
	public void setRes_ADDRESS_DETAIL(String res_ADDRESS_DETAIL) {
		this.res_ADDRESS_DETAIL = res_ADDRESS_DETAIL;
	}
	public String getRes_ADDRESS_EN() {
		return res_ADDRESS_EN;
	}
	public void setRes_ADDRESS_EN(String res_ADDRESS_EN) {
		this.res_ADDRESS_EN = res_ADDRESS_EN;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCard_NUM() {
		return card_NUM;
	}
	public void setCard_NUM(String card_NUM) {
		this.card_NUM = card_NUM;
	}
	public String getHh_YN() {
		return hh_YN;
	}
	public void setHh_YN(String hh_YN) {
		this.hh_YN = hh_YN;
	}
	public String getHc_YN() {
		return hc_YN;
	}
	public void setHc_YN(String hc_YN) {
		this.hc_YN = hc_YN;
	}
	public String getCountry_CODE() {
		return country_CODE;
	}
	public void setCountry_CODE(String country_CODE) {
		this.country_CODE = country_CODE;
	}
	public String getCountry_NAME() {
		return country_NAME;
	}
	public void setCountry_NAME(String country_NAME) {
		this.country_NAME = country_NAME;
	}
	public String getHire_TYPE() {
		return hire_TYPE;
	}
	public void setHire_TYPE(String hire_TYPE) {
		this.hire_TYPE = hire_TYPE;
	}
	public String getHire_NUM() {
		return hire_NUM;
	}
	public void setHire_NUM(String hire_NUM) {
		this.hire_NUM = hire_NUM;
	}
	public String getCur_ADDRESS() {
		return cur_ADDRESS;
	}
	public void setCur_ADDRESS(String cur_ADDRESS) {
		this.cur_ADDRESS = cur_ADDRESS;
	}
	public String getCur_ADDRESS_DETAIL() {
		return cur_ADDRESS_DETAIL;
	}
	public void setCur_ADDRESS_DETAIL(String cur_ADDRESS_DETAIL) {
		this.cur_ADDRESS_DETAIL = cur_ADDRESS_DETAIL;
	}
	public String getEmployee_JOIN_DATE() {
		return employee_JOIN_DATE;
	}
	public void setEmployee_JOIN_DATE(String employee_JOIN_DATE) {
		this.employee_JOIN_DATE = employee_JOIN_DATE;
	}
	public String getEmployee_RESIGNATION_DATE() {
		return employee_RESIGNATION_DATE;
	}
	public void setEmployee_RESIGNATION_DATE(String employee_RESIGNATION_DATE) {
		this.employee_RESIGNATION_DATE = employee_RESIGNATION_DATE;
	}
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
	public String getPosition_CODE() {
		return position_CODE;
	}
	public void setPosition_CODE(String position_CODE) {
		this.position_CODE = position_CODE;
	}
	public String getPosition_NAME() {
		return position_NAME;
	}
	public void setPosition_NAME(String position_NAME) {
		this.position_NAME = position_NAME;
	}
	public String getOut_REASON_CODE() {
		return out_REASON_CODE;
	}
	public void setOut_REASON_CODE(String out_REASON_CODE) {
		this.out_REASON_CODE = out_REASON_CODE;
	}
	public String getOut_REASON_NAME() {
		return out_REASON_NAME;
	}
	public void setOut_REASON_NAME(String out_REASON_NAME) {
		this.out_REASON_NAME = out_REASON_NAME;
	}
	public String getJob_CLASS_CODE() {
		return job_CLASS_CODE;
	}
	public void setJob_CLASS_CODE(String job_CLASS_CODE) {
		this.job_CLASS_CODE = job_CLASS_CODE;
	}
	public String getJob_CLASS_NAME() {
		return job_CLASS_NAME;
	}
	public void setJob_CLASS_NAME(String job_CLASS_NAME) {
		this.job_CLASS_NAME = job_CLASS_NAME;
	}
	public String getDuty_CODE() {
		return duty_CODE;
	}
	public void setDuty_CODE(String duty_CODE) {
		this.duty_CODE = duty_CODE;
	}
	public String getDuty_NAME() {
		return duty_NAME;
	}
	public void setDuty_NAME(String duty_NAME) {
		this.duty_NAME = duty_NAME;
	}
	public String getJob_DIS_CODE() {
		return job_DIS_CODE;
	}
	public void setJob_DIS_CODE(String job_DIS_CODE) {
		this.job_DIS_CODE = job_DIS_CODE;
	}
	public String getJob_DIS_NAME() {
		return job_DIS_NAME;
	}
	public void setJob_DIS_NAME(String job_DIS_NAME) {
		this.job_DIS_NAME = job_DIS_NAME;
	}

	public String getProbation_YN() {
		return probation_YN;
	}
	public void setProbation_YN(String probation_YN) {
		this.probation_YN = probation_YN;
	}
	public String getProbation_DATE() {
		return probation_DATE;
	}
	public void setProbation_DATE(String probation_DATE) {
		this.probation_DATE = probation_DATE;
	}
	public String getWork_INCLUDE_YN() {
		return work_INCLUDE_YN;
	}
	public void setWork_INCLUDE_YN(String work_INCLUDE_YN) {
		this.work_INCLUDE_YN = work_INCLUDE_YN;
	}
	public String getLeave_DATE_START() {
		return leave_DATE_START;
	}
	public void setLeave_DATE_START(String leave_DATE_START) {
		this.leave_DATE_START = leave_DATE_START;
	}
	public String getLeave_DATE_END() {
		return leave_DATE_END;
	}
	public void setLeave_DATE_END(String leave_DATE_END) {
		this.leave_DATE_END = leave_DATE_END;
	}
	public String getD_CODE_CODE() {
		return d_CODE_CODE;
	}
	public void setD_CODE_CODE(String d_CODE_CODE) {
		this.d_CODE_CODE = d_CODE_CODE;
	}
	public String getD_CODE_NAME() {
		return d_CODE_NAME;
	}
	public void setD_CODE_NAME(String d_CODE_NAME) {
		this.d_CODE_NAME = d_CODE_NAME;
	}
	public String getWork_TYPE_CODE() {
		return work_TYPE_CODE;
	}
	public void setWork_TYPE_CODE(String work_TYPE_CODE) {
		this.work_TYPE_CODE = work_TYPE_CODE;
	}
	public String getWork_TYPE_NAME() {
		return work_TYPE_NAME;
	}
	public void setWork_TYPE_NAME(String work_TYPE_NAME) {
		this.work_TYPE_NAME = work_TYPE_NAME;
	}
	public String getPay_TYPE_CODE() {
		return pay_TYPE_CODE;
	}
	public void setPay_TYPE_CODE(String pay_TYPE_CODE) {
		this.pay_TYPE_CODE = pay_TYPE_CODE;
	}
	public String getPay_TYPE_NAME() {
		return pay_TYPE_NAME;
	}
	public void setPay_TYPE_NAME(String pay_TYPE_NAME) {
		this.pay_TYPE_NAME = pay_TYPE_NAME;
	}
	public String getPay_GRADE_CODE() {
		return pay_GRADE_CODE;
	}
	public void setPay_GRADE_CODE(String pay_GRADE_CODE) {
		this.pay_GRADE_CODE = pay_GRADE_CODE;
	}
	public String getPay_GRADE_NAME() {
		return pay_GRADE_NAME;
	}
	public void setPay_GRADE_NAME(String pay_GRADE_NAME) {
		this.pay_GRADE_NAME = pay_GRADE_NAME;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getBank_CODE_1() {
		return bank_CODE_1;
	}
	public void setBank_CODE_1(String bank_CODE_1) {
		this.bank_CODE_1 = bank_CODE_1;
	}
	public String getBank_NAME_1() {
		return bank_NAME_1;
	}
	public void setBank_NAME_1(String bank_NAME_1) {
		this.bank_NAME_1 = bank_NAME_1;
	}
	public String getAccount_NUMBER_1() {
		return account_NUMBER_1;
	}
	public void setAccount_NUMBER_1(String account_NUMBER_1) {
		this.account_NUMBER_1 = account_NUMBER_1;
	}
	public String getAccount_NAME_1() {
		return account_NAME_1;
	}
	public void setAccount_NAME_1(String account_NAME_1) {
		this.account_NAME_1 = account_NAME_1;
	}
	public String getBank_CODE_2() {
		return bank_CODE_2;
	}
	public void setBank_CODE_2(String bank_CODE_2) {
		this.bank_CODE_2 = bank_CODE_2;
	}
	public String getBank_NAME_2() {
		return bank_NAME_2;
	}
	public void setBank_NAME_2(String bank_NAME_2) {
		this.bank_NAME_2 = bank_NAME_2;
	}
	public String getAccount_NUMBER_2() {
		return account_NUMBER_2;
	}
	public void setAccount_NUMBER_2(String account_NUMBER_2) {
		this.account_NUMBER_2 = account_NUMBER_2;
	}
	public String getAccount_NAME_2() {
		return account_NAME_2;
	}
	public void setAccount_NAME_2(String account_NAME_2) {
		this.account_NAME_2 = account_NAME_2;
	}
	public String getContract_START_MONTH() {
		return contract_START_MONTH;
	}
	public void setContract_START_MONTH(String contract_START_MONTH) {
		this.contract_START_MONTH = contract_START_MONTH;
	}
	public String getContract_END_MONTH() {
		return contract_END_MONTH;
	}
	public void setContract_END_MONTH(String contract_END_MONTH) {
		this.contract_END_MONTH = contract_END_MONTH;
	}
	public String getContract_YEAR_PAY() {
		return contract_YEAR_PAY;
	}
	public void setContract_YEAR_PAY(String contract_YEAR_PAY) {
		this.contract_YEAR_PAY = contract_YEAR_PAY;
	}
	public String getContract_MONTH_PAY() {
		return contract_MONTH_PAY;
	}
	public void setContract_MONTH_PAY(String contract_MONTH_PAY) {
		this.contract_MONTH_PAY = contract_MONTH_PAY;
	}
	public String getContract_DAY_PAY() {
		return contract_DAY_PAY;
	}
	public void setContract_DAY_PAY(String contract_DAY_PAY) {
		this.contract_DAY_PAY = contract_DAY_PAY;
	}
	public String getContract_TIME_PAY() {
		return contract_TIME_PAY;
	}
	public void setContract_TIME_PAY(String contract_TIME_PAY) {
		this.contract_TIME_PAY = contract_TIME_PAY;
	}
	public String getEmployee_CODE() {
		return employee_CODE;
	}
	public void setEmployee_CODE(String employee_CODE) {
		this.employee_CODE = employee_CODE;
	}

	

}
