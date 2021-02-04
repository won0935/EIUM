package com.myspring.eium.common.service;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.common.dao.HomeDAO;
import com.myspring.eium.common.vo.HomeVO;


@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HomeService {
	@Autowired
	HomeDAO HomeDAO;
	@Autowired
	HomeVO HomeVO;
	
	public HomeVO findInfo(Map<String, Object> searchMap) throws Exception {
				
		if(searchMap.get("EMPLOYEE_ID")==null||"".equals(searchMap.get("EMPLOYEE_ID"))) {
			HomeVO = HomeDAO.findId(searchMap);
		}else {
			HomeVO = HomeDAO.findPwd(searchMap);
		}
		return HomeVO;
	}
	

	public void mailSender(HomeVO homeVO) throws Exception {
		// 네이버일 경우 smtp.naver.com 을 입력합니다. 
		// Google일 경우 smtp.gmail.com 을 입력합니다. 
		String host = "smtp.naver.com"; 
		final String username = ""; //네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요. 
		final String password = ""; //네이버 이메일 비밀번호를 입력해주세요. 
		int port=465; //포트번호 
		
		// 메일 내용 
		String recipient = homeVO.getEmail(); //받는 사람의 메일주소를 입력해주세요. 
		String subject = "EIUM - 요청정보 전송"; //메일 제목 입력해주세요. 
		

		String body = "";
		if (homeVO.getPwd() != null || !"".equals(homeVO.getPwd())) {
			body = String.join( System.getProperty("line.separator"),
					"사원번호: "+ homeVO.getEmpCode(),
			        "ID: " + homeVO.getId(),
			        "Password: " + homeVO.getPwd());
		}else {
			body = String.join( System.getProperty("line.separator"),
			        "사원번호: "+ homeVO.getEmpCode(),
			        "ID: " + homeVO.getId() );
		}
		
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성

		// SMTP 서버 정보 설정 
		props.put("mail.smtp.host", host); props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); //Session 생성 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); } }); 
		session.setDebug(true); //for debug 
		
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
		mimeMessage.setFrom(new InternetAddress("won0935@naver.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
		mimeMessage.setSubject(subject); //제목셋팅 
		mimeMessage.setText(body); //내용셋팅 
		mimeMessage.setText(body); //내용셋팅 
		Transport.send(mimeMessage); //javax.mail.Transport.send() 이용 }
	}
	
	public List<HomeVO> findvacation(String emp_id) {
		return HomeDAO.findvacation(emp_id);
	}
	public List<HomeVO> findbusiness(String emp_id) {
		return HomeDAO.findbusiness(emp_id);
	}
	public List<HomeVO> findboard(String emp_id) {
		return HomeDAO.findboard(emp_id);
	}


	public void boardInsert(Map<String, Object> map) {
		HomeDAO.boardInsert(map);
		
	}


	public void boardUpdate(Map<String, Object> map) {
		HomeDAO.boardUpdate(map);
		
	}


	public void boardDelete(Integer board_CODE) {
		HomeDAO.boardDelete(board_CODE);
		
	}
}
