package com.google.pronect.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.dao.MemberDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private JavaMailSenderImpl mailSender;
	String backupPath = "D:\\YeosongYoon\\WebProgramming\\Source\\10_2ndTeamProject\\pronect\\src\\main\\webapp\\memberFile\\";
	
	@Override
	public int idConfirm(String mid) {
		// TODO Auto-generated method stub
		return memberDao.idConfirm(mid);
	}

	@Override
	public int nicknameConfirm(String mnickname) {
		// TODO Auto-generated method stub
		return memberDao.nicknameConfirm(mnickname);
	}

	@Override
	public int joinMember(final Member member, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("memberFile/");
		Iterator<String> params = mRequest.getFileNames();
		String mimage = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		mimage = mFile.getOriginalFilename();
		if(mimage!=null && !mimage.equals("")) { // 첨부함
			if(new File(uploadPath + mimage).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				mimage = System.currentTimeMillis() + "_" + mimage;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + mimage)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + mimage);
				System.out.println("백업파일 : " + backupPath + mimage);
				boolean result = fileCopy(uploadPath + mimage, backupPath + mimage);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			mimage="noprofile.jpg";
		}// if
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<div style=\"width:700px; margin: 0 auto;\">\n" + 
					"		<h1>ProNect입니다.<br>" + member.getMname() + " 님의 회원가입 감사합니다</h1>\n" + 
					"		<h3>훌륭한 서비스로 보답하겠습니다.</h3>\n" + 
					"	</div>";
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				// 받을 메일
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMmail()));
				// 보낼 메일
				mimeMessage.setFrom(new InternetAddress("yse297@gmail.com"));
				// 메일 제목
				mimeMessage.setSubject("[ProNect 가입인사]" + member.getMname() + "님 가입 감사합니다");
				// 메일 본문
				mimeMessage.setText(content, "utf-8", "html");
			}
		}; // message 객체 생성
		mailSender.send(message); // 메일 전송
		member.setMimage(mimage);
		httpSession.setAttribute("mid", member.getMid());
		return memberDao.joinMember(member);
	}
	private boolean fileCopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		InputStream is = null; 
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

	@Override
	public String loginCheck(String mid, String mpw, HttpSession httpSession) {
		// TODO Auto-generated method stub
		String result = "로그인 성공";
		Member member = memberDao.getDetailMember(mid);
		if(member == null) {
			result = "잘못된 아이디나 비밀번호입니다.";
		}else if(! member.getMpw().equals(mpw)) {
			result = "잘못된 아이디나 비밀번호입니다.";
		}else {
			httpSession.setAttribute("member", member);
		}
		return result;
	}

	@Override
	public Member getDetailMember(String mid) {
		// TODO Auto-generated method stub
		return memberDao.getDetailMember(mid);
	}

	@Override
	public int modifyMember(Member member, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("memberFile/");
		Iterator<String> params = mRequest.getFileNames();
		String mimage = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		mimage = mFile.getOriginalFilename();
		if(mimage!=null && !mimage.equals("")) { // 첨부함
			if(new File(uploadPath + mimage).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				mimage = System.currentTimeMillis() + "_" + mimage;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + mimage)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + mimage);
				System.out.println("백업파일 : " + backupPath + mimage);
				boolean result = fileCopy(uploadPath + mimage, backupPath + mimage);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			mimage="noprofile.jpg";
		}// if
		member.setMimage(mimage);
		String mpw = mRequest.getParameter("mpw");
		String dbMpw = mRequest.getParameter("dbMpw");
		member.setMpw(mpw);
		if(mpw.equals("")) { // 정보 수정시 새비밀번호를 입력하지 않을 경우, 현비밀번호(dbMpw)로 
			mpw = dbMpw;
			member.setMpw(dbMpw);
		}
		httpSession.setAttribute("member", member);
		return memberDao.modifyMember(member);
	}

	@Override
	public int modifyManager(Member member) {
		// TODO Auto-generated method stub
		return memberDao.modifyManager(member);
	}

	@Override
	public List<Member> memberList(String pageNum, Member member) {
		// TODO Auto-generated method stub
		Paging paging = new Paging(memberDao.totCntMember(member), pageNum);
		member.setStartRow(paging.getStartRow());
		member.setEndRow(paging.getEndRow());
		return memberDao.memberList(member);
	}

	@Override
	public int totCntMember(Member member) {
		// TODO Auto-generated method stub
		return memberDao.totCntMember(member);
	}
	
	@Override
	public int deactivateMember(Member member, HttpSession httpSession) {
		// TODO Auto-generated method stub
		httpSession.setAttribute("member", member);
		return memberDao.deactivateMember(member);
	}
	
	@Override
	public String searchId(String mname, String mmail, HttpSession httpSession) {
		// TODO Auto-generated method stub
		String result = "아이디 찾기 요청이 성공하여 회원님의 이메일로 아이디를 발송하였습니다";
		final Member member = memberDao.searchId(mname, mmail);
		if(member == null) {
			result = "이름 혹은 이메일이 일치하지 않습니다";
		}else {
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content = "<h1>회원 "+ member.getMname() +"님의 아이디는 :   " + member.getMid() + "   입니다.</h1>\n";
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					// TODO Auto-generated method stub
					// 받을 메일
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMmail()));
					// 보낼 메일
					mimeMessage.setFrom(new InternetAddress("teamPronect@gmail.com"));
					// 메일 제목
					mimeMessage.setSubject("[proNect 아이디 찾기 요청]");
					// 메일 본문
					mimeMessage.setText(content, "utf-8", "html");
				}
			}; // message 객체 생성
			mailSender.send(message); // 메일 전송
		}
		return result;
	}

	@Override
	public String searchPw(String mname, String mmail, String mid, HttpSession httpSession) {
		// TODO Auto-generated method stub
		String result = "비밀번호 찾기 요청이 성공하여 회원님의 이메일로 비밀번호를 발송하였습니다";
		final Member member = memberDao.searchId(mname, mmail);
		if(member == null) {
			result = "이름 혹은 이메일이 일치하지 않습니다";
		}else {
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content = "<h1>회원 "+ member.getMname() +"님의 비밀번호는 :   " + member.getMpw() + "   입니다.</h1><br>"
								+ "<h2>받은 비밀번호로 로그인 하신 후, 비밀번호 이메일 삭제 및 비밀번호 변경을 권장드립니다.</h2>";
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					// TODO Auto-generated method stub
					// 받을 메일
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMmail()));
					// 보낼 메일
					mimeMessage.setFrom(new InternetAddress("teamPronect@gmail.com"));
					// 메일 제목
					mimeMessage.setSubject("[proNect 비밀번호 찾기 요청]");
					// 메일 본문
					mimeMessage.setText(content, "utf-8", "html");
				}
			}; // message 객체 생성
			mailSender.send(message); // 메일 전송
		}
		return result;
	}
}
