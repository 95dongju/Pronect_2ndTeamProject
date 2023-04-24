package com.google.pronect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.pronect.dao.StudyDao;
import com.google.pronect.util.Paging;
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
	public int studyGroupLeader(String mid) {
		return studyDao.studyGroupLeader(mid);
	}

	@Override
	public int registerGroup(Study study) {
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
	public int modifyStudy(Study study) {
		System.out.println("서비스 단 : " +study);
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
	public int joinStudy(int sid, String mid) {
		return studyDao.joinStudy(sid, mid);
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
