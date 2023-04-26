package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.pronect.dao.StudyDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Member;
import com.google.pronect.vo.Study;
@Service
public class StudyServiceImpl implements StudyService {
	@Autowired
	private StudyDao studyDao;
	@Override
	public List<Study> studyList(String pageNum) {
		Paging paging = new Paging(studyDao.studyTotCnt(), pageNum, 10, 10);
		Study study = new Study();
		study.setStartRow(paging.getStartRow());
		study.setEndRow(paging.getEndRow());
		return studyDao.studyList(study);
	}

	@Override
	public int studyTotCnt() {
		return studyDao.studyTotCnt();
	}
	@Override
	public int studyGroupLeader(HttpSession session) {
		// 세션 객체에서 "member" 속성의 값을 가져오기
		Object memberObj = session.getAttribute("member");
		String mid="";
		// 가져온 값을 원하는 데이터 타입으로 형변환
		if (memberObj != null && memberObj instanceof Member) {
		    Member member = (Member) memberObj;
		    mid = member.getMid(); // Member 클래스에서 id 필드에 해당하는 getter 메서드를 사용하여 id 값을 가져옴
		    // id 값 사용
		}
		return studyDao.studyGroupLeader(mid);
	}

	@Override
	public int registerGroup(Study study,String[] slanguage) {
		study.setSlanguage1("");
		study.setSlanguage2("");
		study.setSlanguage3("");
	    if (slanguage != null) {
	        for (int i = 0; i < slanguage.length; i++) {
	            if (i == 0) {
	                study.setSlanguage1(slanguage[i]);
	            } else if (i == 1) {
	                study.setSlanguage2(slanguage[i]);
	            } else if (i == 2) {
	                study.setSlanguage3(slanguage[i]);
	            }
	        }
	    }
		String mid = study.getMid();
		studyDao.registerGroup(study);
		int sid = studyDao.getRegisteredSid(mid);
		return studyDao.insertHistory(sid, mid);
	}

	@Override
	public int getRegisteredSid(String mid) {
		return studyDao.getRegisteredSid(mid);
	}

	@Override
	public int insertHistory(int sid, String mid) {
		return studyDao.insertHistory(sid, mid);
	}

	@Override
	public Study getStudyDetail(int sid) {
		studyDao.studyHitUp(sid);
		return studyDao.getStudyDetail(sid);
	}
	@Override
	public Study getAfterModifyView(int sid) {
		return studyDao.getStudyDetail(sid);
	}

	@Override
	public int modifyStudy(Study study, String[] slanguage) {
		study.setSlanguage1("");
		study.setSlanguage2("");
		study.setSlanguage3("");
	    if (slanguage != null) {
	        for (int i = 0; i < slanguage.length; i++) {
	            if (i == 0) {
	                study.setSlanguage1(slanguage[i]);
	            } else if (i == 1) {
	                study.setSlanguage2(slanguage[i]);
	            } else if (i == 2) {
	                study.setSlanguage3(slanguage[i]);
	            }
	        }
	    }
		return studyDao.modifyStudy(study);
	}

	@Override
	public int deleteHistory(int sid) {
		return studyDao.deleteHistory(sid);
	}

	@Override
	public int deleteStudy(int sid) {
		return studyDao.deleteStudy(sid);
	}

	@Override
	public Study joinCheck(int sid, HttpSession session) {
		// 세션 객체에서 "member" 속성의 값을 가져오기
		Object memberObj = session.getAttribute("member");
		Study study = new Study();
		String mid="";
		// 가져온 값을 원하는 데이터 타입으로 형변환
		if (memberObj != null && memberObj instanceof Member) {
		    Member member = (Member) memberObj;
		    mid = member.getMid(); // Member 클래스에서 id 필드에 해당하는 getter 메서드를 사용하여 id 값을 가져옴
		    study.setMid(mid);
		    study.setSid(sid);
		    // id 값 사용
		}
		return studyDao.joinCheck(study);
	}
	
	@Override
	public int joinStudy(int sid, String mid) {
		return studyDao.joinStudy(sid, mid);
	}

	@Override
	public int unJoinStudy(int sid, String mid) {
		return studyDao.unJoinStudy(sid, mid);
	}
	
	@Override
	public Study joinList(int sid) {
		return studyDao.joinList(sid);
	}
	
	@Override
	public int acceptStudy(String mid) {
		return studyDao.acceptStudy(mid);
	}

	@Override
	public int completeStudy(int sid) {
		return studyDao.completeStudy(sid);
	}

}
