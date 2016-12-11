package com.game.member;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import com.game.computer.ComputerDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "memberMapper.";
	
	//회원가입
	public int join(MemberDTO mDto) throws Exception{
		sqlSession.insert(namespace+"Join", mDto);
		
		int m_num = mDto.getM_num();
		
		return m_num;
	}
	
	//computer정보 입력
	public int cominfo(ComputerDTO com) throws Exception{
		return sqlSession.insert(namespace+"comInfo", com);
	}
	
	//로그인
	public MemberDTO login(MemberDTO mDto) throws Exception{
		return sqlSession.selectOne(namespace+"Login", mDto);
	}
	
	//computerinfo set
	public ComputerDTO cominfo(int m_num) throws Exception{
		return sqlSession.selectOne(namespace+"LoCominfo", m_num);
	}
	
	//회원정보 수정
	public int idMod(MemberDTO mDto) throws Exception{
		
		return sqlSession.update(namespace+"idMod", mDto);
		
	}
	
	//회원탈퇴(member)
	public int memOut(MemberDTO mDto) throws Exception{
		return sqlSession.delete(namespace+"memOut", mDto);
	}
	
	//회원탈퇴(computer)
	public int comOut(int m_num) throws Exception{
		return sqlSession.delete(namespace+"comOut", m_num);
	}
	
	
	//id중복체크
	public MemberDTO idcheck(String id) throws Exception{
		
		return sqlSession.selectOne(namespace+"idCheck", id);
	}
	
	//id찾기
	public MemberDTO searchid(MemberDTO mDto) throws Exception{
		
		return sqlSession.selectOne(namespace+"searchId", mDto);
	} 
	
	//pw찾기
	public MemberDTO searchpw(MemberDTO mDto) throws Exception{
		return sqlSession.selectOne(namespace+"searchPw", mDto);
	}
	
	//mail 보내기 
	public void mailSender(HttpServletRequest request, MemberDTO mDto) throws AddressException, MessagingException 
	{
		
		// 네이버일 경우 smtp.naver.com 을 입력합니다.
		// Google일 경우 smtp.gmail.com 을 입력합니다.
		String host = "smtp.naver.com";
		
		final String username = "monkey2224";       //네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요.
		final String password = "qwe103350!";   //네이버 이메일 비밀번호를 입력해주세요.
		int port=465; //포트번호
		 
		// 메일 내용
		String recipient = mDto.getM_email();    //받는 사람의 메일주소를 입력해주세요.
		String subject = "안녕하세요, gps 입니다."; 					  //메일 제목 입력해주세요.
		String body = "<html><head>"
		+ "</head><body><p>"+mDto.getM_id()+" 님의 비밀번호가 변경되었습니다.</p><br>"
		+ "<p>현재 비밀번호 : "+mDto.getM_pw()+"</p><br>"
		+ "<p>아래의 링크를 클릭하시면 로그인 페이지로 이동합니다.</p><br>"
		+ "<a href='http://localhost:8461/gps/member/login>로그인 페이지로</a>"
		+ "</header></body></html>";
		
		//메일 내용 입력해주세요.
		 
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성
		 
		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		   
		//Session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=username;
			String pw=password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); //for debug
		   
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
		mimeMessage.setFrom(new InternetAddress("monkey2224@naver.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음


		mimeMessage.setSubject(subject);  //제목셋팅
		mimeMessage.setText(body);        //내용셋팅
		Transport.send(mimeMessage); //javax.mail.Transport.send() 이용
		
	}
	

}
