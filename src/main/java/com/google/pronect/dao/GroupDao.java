package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.google.pronect.vo.Group;

@Mapper
public interface GroupDao {
	public List<Group> groupList(Group group);
	public int groupTotCnt();
	public int registerGroup(Group group);
	public int getRegisteredGid(String mid);
	public int groupLeader(String mid);
	public int insertHistory(@Param("gid")int gid, @Param("mid")String mid);
	public int groupHitUp(int gid);
	public Group getGroupDetail(int gid);
	public Group getAfterModifyView(int gid);
	public int modifyGroup(Group group);
	public int deleteHistory(int gid);
	public int deleteGroup(int gid);
	public int joinCheck(Group group);
	public int joinGroup(@Param("gid") int gid, @Param("mid") String mid);
	public int unJoinGroup(@Param("gid") int gid, @Param("mid") String mid);
	public Group joinList(int gid);
	public int acceptGroup(String mid);
	public int completeGroup(int gid);
	public String startDate(int gid);
	public String endDate(int gid);
}
