package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.google.pronect.vo.Group;

@Mapper
public interface GroupDao {
	/////////////////////groupList.do//////////////////////////////////////////
	public List<Group> groupList(Group group);
	public int 		groupTotCnt();
	/////////////////////studyList.do//////////////////////////////////////////
	public List<Group> studyList(Group group);
	public int 		studyTotCnt();
	/////////////////////projectList.do//////////////////////////////////////////
	public List<Group> projectList(Group group);
	public int 		projectTotCnt();
	/////////////////////register.do//////////////////////////////////////////
	public int 		registerGroup(Group group);
	public int 		insertHistory(Group group);
	/////////////////////detail.do//////////////////////////////////////////
	public List<Group>	groupMember(int gid);
	public int 		groupHitUp(int gid);
	public Group 	getGroupDetail(int gid);
	public int 		joinCheck(Group group); //join.do에서도 사용
	public int 		joinCheckCnt(Group group); //join.do에서도 사용
	public List<Group> hitGroup();
	/////////////////////modify.do  GET//////////////////////////////////////
	public Group 	getAfterModifyView(int gid);
	/////////////////////modify.do  POST//////////////////////////////////////
	public int		modifyGroup(Group group);
	/////////////////////delete.do//////////////////////////////////////////
	public int 		deleteHistory(int gid);
	public int 		deleteGroup(int gid);
	/////////////////////join.do//////////////////////////////////////////
	public int 		joinGroup(Group group);
	/////////////////////unJoin.do//////////////////////////////////////////
	public int 		unJoinGroup(Group group);
	/////////////////////accept.do//////////////////////////////////////////
	public int 		acceptGroup(Group group);
	public Group	memberFullCheck(int gid); //memberOut.do 에서도 사용
	public int		peopleFull(int gid);
	public int		memberPlus(int gid);
	/////////////////////memberOut.do//////////////////////////////////////////
	public int		memberOut(Group group);
	public int 		peopleUnFull(int gid);
	public int		memberMinus(int gid);
	/////////////////////complete.do//////////////////////////////////////////
	public int 		joinDelete(int gid);
	public int		historyComplete(int gid);
	public int 		completeGroup(int gid);
	/////////////////////memberInfo.do//////////////////////////////////////////
	public List<Group> 	joinList(int gid);
	/////////////////////달성도 insert용//////////////////////////////////////////
	public List<Group> getMemberId(int gid);
	public List<Group>	myStudyList(Group group, @Param("mid") String mid);
	public int 			totCntMyStudy(@Param("mid") String mid);
	public List<Group>	myProjectList(Group group, @Param("mid") String mid);
	public int 			totCntMyProject(@Param("mid") String mid);
	public List<Group>	myHistory(Group group, @Param("mid") String mid);
	public int 			totCntMyHistory(@Param("mid") String mid);
	/////////////////////    ?????   //////////////////////////////////////////
	public String 	startDate(int gid);
	public String 	endDate(int gid);
//	public int 		groupLeader(String mid);
}
