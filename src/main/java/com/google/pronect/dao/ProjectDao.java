package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.google.pronect.vo.Project;

@Mapper
public interface ProjectDao {
	public List<Project> projectList(Project project);
	public int projectTotCnt();
	public int registerGroup(Project project);
	public int getRegisteredPid(String mid);
	public int projectGroupLeader(String mid);
	public int insertHistory(@Param("pid")int pid, @Param("mid")String mid);
	public int projectHitUp(int pid);
	public Project getProjectDetail(int pid);
	public Project getAfterModifyView(int pid);
	public int modifyProject(Project project);
	public int deleteHistory(int pid);
	public int deleteProject(int pid);
	public int joinProject(int pid, String mid);
	public int acceptProject(String mid);
	public int completeProject(int pid);
	
}
