package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.google.pronect.vo.Study;

@Mapper
public interface StudyDao {
	public List<Study> studyList(Study study);
	public int studyTotCnt();
	public int registerGroup(Study study);
	public int getRegisteredSid(String mid);
	public int studyGroupLeader(String mid);
	public int insertHistory(@Param("sid")int sid, @Param("mid")String mid);
	public int studyHitUp(int sid);
	public Study getStudyDetail(int sid);
	public Study getAfterModifyView(int sid);
	public int modifyStudy(Study study);
	public int deleteHistory(int sid);
	public int deleteStudy(int sid);
	public int joinCheck(Study study);
	public int joinStudy(@Param("sid") int sid, @Param("mid") String mid);
	public int unJoinStudy(@Param("sid") int sid, @Param("mid") String mid);
	public int acceptStudy(String mid);
	public int completeStudy(int sid);
	
}
