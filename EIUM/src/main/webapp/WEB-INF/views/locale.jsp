<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<script type="text/javascript">
var login='<spring:message code="login"  text="로그인"/>';
var findId='<spring:message code="findId"  text="ID 찾기"/>';
var findPwd='<spring:message code="findPwd"  text="패스워드 찾기"/>';

var lo_RegistrationInformationManagement='<spring:message code="lo_RegistrationInformationManagement"  text="등록정보관리"/>';
var lo_Companyregistration='<spring:message code="lo_Companyregistration"  text="회사등록"/>';
var lo_Siteregistration='<spring:message code="lo_Siteregistration"  text="사업장등록"/>';

var lo_Departmentregistration='<spring:message code="lo_Departmentregistration"  text="부서등록"/>';
var lo_Employeeregistration='<spring:message code="lo_Employeeregistration"  text="사원등록"/>';
var lo_Authoritymanagement='<spring:message code="lo_Authoritymanagement"  text="권한관리"/>';
var lo_Setpermissionsbyaccount='<spring:message code="lo_Setpermissionsbyaccount"  text="계정별권한설정"/>';
var lo_Environmentsetting='<spring:message code="lo_Environmentsetting"  text="기초환경설정"/>';

var lo_PayrollTableRegistration='<spring:message code="lo_PayrollTableRegistration"  text="호봉테이블등록"/>';
var lo_Paymentdateregistration='<spring:message code="lo_Paymentdateregistration"  text="지급일등록"/>';
var lo_PersonnelBasicCodeRegistration='<spring:message code="lo_PersonnelBasicCodeRegistration"  text="인사기초코드등록"/>';
var lo_HRmanagement='<spring:message code="lo_HRmanagement"  text="인사관리"/>';
var lo_PersonnelInformationRegistration='<spring:message code="lo_PersonnelInformationRegistration"  text="인사정보등록"/>';

var lo_PersonnelRecordCard='<spring:message code="lo_PersonnelRecordCard"  text="인사기록카드"/>';
var lo_EducationManagement='<spring:message code="lo_EducationManagement"  text="교육관리"/>';
var lo_EducationalEvaluation='<spring:message code="lo_EducationalEvaluation"  text="교육평가"/>';
var lo_Personnelappointment='<spring:message code="lo_Personnelappointment"  text="인사발령"/>';
var lo_Personnelappointmentinquiry='<spring:message code="lo_Personnelappointmentinquiry"  text="인사발령조회"/>';

var lo_EmployeeInformation='<spring:message code="lo_EmployeeInformation"  text="사원정보현황"/>';
var lo_HRnRewards='<spring:message code="lo_HRnRewards"  text="인사고과/상벌현황"/>';
var lo_EmployeeLeavingStatus='<spring:message code="lo_EmployeeLeavingStatus"  text="사원입퇴사현황"/>';
var lo_Pricingwage='<spring:message code="lo_Pricingwage"  text="책정임금현황"/>';
var lo_YearsofService='<spring:message code="lo_YearsofService"  text="근속년수현황"/>';

var lo_EducationStatus='<spring:message code="lo_EducationStatus"  text="교육현황"/>';
var lo_Payrollmanagement='<spring:message code="lo_Payrollmanagement"  text="급여관리"/>';
var lo_Salaryinputandcalculation='<spring:message code="lo_Salaryinputandcalculation"  text="급여입력및계산"/>';
var lo_Payroll='<spring:message code="lo_Payroll"  text="급여대장"/>';
var lo_Salaryspecification='<spring:message code="lo_Salaryspecification"  text="급여명세"/>';

var lo_TransferStatus='<spring:message code="lo_TransferStatus"  text="급상여이체현황"/>';
var lo_MonthlyPaymentStatus='<spring:message code="lo_MonthlyPaymentStatus"  text="월별지급현황"/>';
var lo_EmployeeWageStatistics='<spring:message code="lo_EmployeeWageStatistics"  text="사원임금통계"/>';
var lo_TnAManagement='<spring:message code="lo_TnAManagement"  text="근태관리"/>';
var lo_TnAinput='<spring:message code="lo_TnAinput"  text="근태입력"/>';

var lo_VacationManagement='<spring:message code="lo_VacationManagement"  text="휴가관리"/>';
var lo_VacationHistory='<spring:message code="lo_VacationHistory"  text="휴가내역"/>';
var lo_TravelManagement='<spring:message code="lo_TravelManagement"  text="출장관리"/>';
var lo_Businesstripinquiry='<spring:message code="lo_Businesstripinquiry"  text="출장조회"/>';
var lo_manytabs='<spring:message code="lo_manytabs"  text="탭이 너무 많습니다. 하나 닫을까요?"/>';

var lo_vacation='<spring:message code="lo_vacation"  text="휴가"/>';
var lo_business='<spring:message code="lo_business"  text="출장"/>';
var lo_event='<spring:message code="lo_event"  text="경조사"/>';




</script>
</body>
</html>